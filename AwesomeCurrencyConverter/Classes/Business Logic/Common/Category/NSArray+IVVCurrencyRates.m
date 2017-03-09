//
//  NSArray+IVVCurrencyRates.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "NSArray+IVVCurrencyRates.h"

#import "IVVCurrencyObject.h"

@implementation NSArray(IVVCurrencyRates)

- (IVVCurrencyObject *)currecnyRateWithCurrency:(IVVCurrencyType)type {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %u", NSStringFromSelector(@selector(currencyType)), type];
    IVVCurrencyObject *currencyRate = [[self filteredArrayUsingPredicate:predicate] firstObject];
    return currencyRate;
}

@end
