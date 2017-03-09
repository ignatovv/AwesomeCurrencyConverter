//
//  IVVCurrencyProviderImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyRatesProvider.h"

@protocol IVVCurrencyRatesService, IVVScheduler;

@interface IVVCurrencyRatesProviderImplementation : NSObject <IVVCurrencyRatesProvider>

@property (nonatomic, strong) id<IVVCurrencyRatesService> currencyRatesService;
@property (nonatomic, strong) id<IVVScheduler> scheduler;

@end
