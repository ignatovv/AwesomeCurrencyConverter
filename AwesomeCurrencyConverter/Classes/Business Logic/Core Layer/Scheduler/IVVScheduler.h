//
//  IVVScheduler.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

typedef void (^IVVScheduleBlock)(void);

@protocol IVVScheduler <NSObject>

- (void)startSchedulingWithTimeInterval:(NSTimeInterval)timeInterval
                          scheduleBlock:(IVVScheduleBlock)scheduleBlock;

- (void)stopScheduling;

- (BOOL)isRunning;

@end
