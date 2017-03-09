//
//  IVVCurrencyProviderImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyRatesProviderImplementation.h"

// Model
#import "IVVCurrency.h"

// Service
#import "IVVCurrencyRatesService.h"

// Scheduler
#import "IVVScheduler.h"

static const NSTimeInterval IVVCurrecnyRateUpdateTimeInterval = 30.0;

@interface IVVCurrencyRatesProviderImplementation()

@property (nonatomic, strong) IVVCurrencyRates currencyRates;
@property (nonatomic, strong) NSHashTable<id<IVVCurrencyRatesProviderSubscriber>> *subscribers;

@end

@implementation IVVCurrencyRatesProviderImplementation

#pragma mark - Getters/Setters

- (NSHashTable *)subscribers {
    if (_subscribers == nil) {
        _subscribers = [NSHashTable hashTableWithOptions:NSPointerFunctionsWeakMemory];
    }
    
    return _subscribers;
}

#pragma mark - Public methods

- (void)getCurrencyRatesWithSucces:(IVVCurrencyRatesBlock)succes
                           failure:(IVVErrorBlock)failure {
    if (self.currencyRates != nil) {
        succes(self.currencyRates);
        return;
    }
    
    [self.currencyRatesService getCurrencyRatesWithSucces:^(IVVCurrencyRates currencyRates) {
        [self updateCurrencyRates:currencyRates];
        succes(self.currencyRates);
    }
                                                  failure:failure];
}

- (void)subscibeToCurrencyRatesChanges:(id<IVVCurrencyRatesProviderSubscriber>)subscriber {
    [self.subscribers addObject:subscriber];
    if ([self.scheduler isRunning] == NO) {
        [self startScheduler];
    }
}

- (void)unSubscibeToCurrencyRatesChanges:(id<IVVCurrencyRatesProviderSubscriber>)subscriber {
    [self.subscribers removeObject:subscriber];
    [self stopSchedulingIfNeeded];
}

#pragma mark - Private methods

// TODO : Use nsoperation queue to chain scheduled operations 
- (void)startScheduler {
    @weakify(self)
    [self.scheduler startSchedulingWithTimeInterval:IVVCurrecnyRateUpdateTimeInterval
                                      scheduleBlock:^{
                                          [self stopSchedulingIfNeeded];
                                          
                                          @strongify(self)
                                          [self.currencyRatesService getCurrencyRatesWithSucces:^(IVVCurrencyRates currencyRates) {
                                              [self onCurrencyRatesChange:currencyRates];
                                          } failure:nil];
                                      }];
}

- (void)onCurrencyRatesChange:(IVVCurrencyRates)currencyRates {
    BOOL currencyRatesDidChange = [self updateCurrencyRates:currencyRates];
    if (currencyRatesDidChange) {
        [self notifySubscribersWithCurrencyRates:self.currencyRates];
    }
}

- (BOOL)updateCurrencyRates:(IVVCurrencyRates)currencyRates {
    if ([self.currencyRates isEqualToArray:currencyRates]) {
        return NO;
    }
    
    self.currencyRates = currencyRates;
    return YES;
}

- (void)notifySubscribersWithCurrencyRates:(IVVCurrencyRates)currencyRates {
    NSArray <id<IVVCurrencyRatesProviderSubscriber>> *subscribers = [self.subscribers allObjects];
    for (id<IVVCurrencyRatesProviderSubscriber> subscriber in subscribers) {
        [subscriber currencyRatesDidChange:currencyRates];
    }
}

// if someone forgot to unsubscribe 
- (void)stopSchedulingIfNeeded {
    if (self.subscribers.allObjects.count == 0) {
        [self.scheduler stopScheduling];
    }
}

#pragma mark - Lifecycle 

- (void)dealloc {
    [self.scheduler stopScheduling];
}

@end
