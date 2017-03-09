//
//  IVVCurrencyRatesServiceImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#include "IVVCurrencyRatesService.h"

@protocol IVVClient, IVVCurrencyRatesServiceMapper, IVVCurrencyRatesServiceConfigurator;

@interface IVVCurrencyRatesServiceImplementation : NSObject <IVVCurrencyRatesService>

@property (nonatomic, strong) id<IVVClient> client;
@property (nonatomic, strong) id<IVVCurrencyRatesServiceMapper> mapper;
@property (nonatomic, strong) id<IVVCurrencyRatesServiceConfigurator> configurator;

@end
