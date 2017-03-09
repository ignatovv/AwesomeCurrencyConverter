//
//  IVVCurrencyConverterImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConverterImplementation.h"

#import "IVVCurrencyObject.h"

#import <UIKit/UIKit.h>

#import "NSArray+IVVCurrencyRates.h"

@implementation IVVCurrencyConverterImplementation

- (NSDecimalNumber *)convertCurrency:(IVVCurrencyType)fromCurrency
                          toCurrency:(IVVCurrencyType)toCurrency
                   withCurrencyRates:(IVVCurrencyRates)currencyRates
                              amount:(NSDecimalNumber *)amount {
    IVVCurrencyObject *currencyFromRate = [currencyRates currecnyRateWithCurrency:fromCurrency];
    IVVCurrencyObject *currencyToRate = [currencyRates currecnyRateWithCurrency:toCurrency];
    
    NSDecimalNumber *currencyRatio = [currencyToRate.currencyRate decimalNumberByDividingBy:currencyFromRate.currencyRate];
    NSDecimalNumber *convertedAmount = [amount decimalNumberByMultiplyingBy:currencyRatio];
    
    return convertedAmount;
}

@end
