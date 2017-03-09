//
//  IVVSchedulerImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVSchedulerImplementation.h"

static const NSTimeInterval IVVMaximumTimerTolerance = 1.0;
static const NSTimeInterval IVVTimerToleranceFraction = 0.1;

@interface IVVSchedulerImplementation()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign, getter=isRunning) BOOL running;

@end

@implementation IVVSchedulerImplementation

#pragma mark - Public methods

- (void)startSchedulingWithTimeInterval:(NSTimeInterval)timeInterval
                          scheduleBlock:(IVVScheduleBlock)scheduleBlock {
    [self stopScheduling];
    
    self.running = YES;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5
                                                 repeats:YES
                                                   block:^(NSTimer * _Nonnull timer) {
                                                       scheduleBlock();
                                                   }];                  
    self.timer.tolerance = [self toleranceForTimeInterval:timeInterval];
}

- (void)stopScheduling {
    [self.timer invalidate];
    self.timer = nil;
    self.running = NO;
}

#pragma mark - Private methods

- (NSTimeInterval)toleranceForTimeInterval:(NSTimeInterval)timeInterval {
    NSTimeInterval fractionalTolerance = timeInterval * IVVTimerToleranceFraction;
    return MIN(IVVMaximumTimerTolerance, fractionalTolerance);
}

@end
