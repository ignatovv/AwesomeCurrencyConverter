//
//  IVVMoneyStorageImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVMoneyStorageImplementation.h"

#import "IVVPresistentStore.h"

#import <UIKit/UIKit.h>

@implementation IVVMoneyStorageImplementation

- (BOOL)addMoney:(NSDecimalNumber *)amount
     forCurrency:(IVVCurrencyType)currency {
    if (currency == IVVCurrencyTypeUnknown) {
        return NO;
    }
    
    NSString *key = [self keyForCurrency:currency];
    
    NSDecimalNumber *savedAmount = [self getAmountFromStoreForKey:key];
    NSDecimalNumber *newAmount = [savedAmount decimalNumberByAdding:amount];
    
    [self saveAmountToStore:newAmount
                    withKey:key];
    
    return YES;
}

- (BOOL)subtractMoney:(NSDecimalNumber *)amount
          forCurrency:(IVVCurrencyType)currency {
    if (currency == IVVCurrencyTypeUnknown) {
        return NO;
    }
    
    NSString *key = [self keyForCurrency:currency];
    
    NSDecimalNumber *savedAmount = [self getAmountFromStoreForKey:key];
    
    NSComparisonResult comparisonResult = [savedAmount compare:amount];
    if (comparisonResult == NSOrderedAscending) {
        return NO;
    }
    
    NSDecimalNumber *newAmount = [savedAmount decimalNumberBySubtracting:amount];
    [self saveAmountToStore:newAmount
                    withKey:key];
    
    return YES;
}

- (NSDecimalNumber *)getMoneyAmountForCurrency:(IVVCurrencyType)currency {
    if (currency == IVVCurrencyTypeUnknown) {
        return nil;
    }
    
    NSString *key = [self keyForCurrency:currency];
    
    NSDecimalNumber *savedAmount = [self getAmountFromStoreForKey:key];
    return savedAmount;
}

- (void)setMoneyAmount:(NSDecimalNumber *)amount
           forCurrency:(IVVCurrencyType)currency {
    NSString *key = [self keyForCurrency:currency];
    [self saveAmountToStore:amount
                    withKey:key];
}

#pragma mark - Persistent store

- (void)saveAmountToStore:(NSDecimalNumber *)amount
                  withKey:(NSString *)key {
    NSString *stringRepresentation = [amount stringValue];
    [self.presistentStore setObject:stringRepresentation
                             forKey:key];
}

- (NSDecimalNumber *)getAmountFromStoreForKey:(NSString *)key {
    NSString *stringRepresentation = [self.presistentStore getObjectForKey:key];
    return [NSDecimalNumber decimalNumberWithString:stringRepresentation];
}

#pragma mark - Helpers

- (NSString *)keyForCurrency:(IVVCurrencyType)currency {
    return [self dictionaryForCurrencyKeys][@(currency)];
}

- (NSDictionary *)dictionaryForCurrencyKeys {
    return @{@(IVVCurrencyTypeEUR) : @"IVVPresistentStoreKeyEUR",
             @(IVVCurrencyTypeGBP) : @"IVVPresistentStoreKeyGBP",
             @(IVVCurrencyTypeUSD) : @"IVVPresistentStoreKeyUSD" };
}

@end
