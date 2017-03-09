//
//  IVVCurrencyRatesServiceConfigurator.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyRatesServiceConfiguratorImplementation.h"

#import "IVVAPIConstants.h"

@implementation IVVCurrencyRatesServiceConfiguratorImplementation

- (NSString *)urlForCurrencyRates {
    return IVVCurrencyRatesURL;
}

@end
