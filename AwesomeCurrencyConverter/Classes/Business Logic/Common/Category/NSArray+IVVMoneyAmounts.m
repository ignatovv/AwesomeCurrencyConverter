//
//  NSArray+IVVMoneyAmounts.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "NSArray+IVVMoneyAmounts.h"

#import "IVVMoneyAmount.h"

@implementation NSArray(IVVMoneyAmounts)

- (IVVMoneyAmount *)moneyAmountWithCurrency:(IVVCurrencyType)type {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K = %u", NSStringFromSelector(@selector(currencyType)), type];
    IVVMoneyAmount *moneyAmount = [[self filteredArrayUsingPredicate:predicate] firstObject];
    return moneyAmount;
}

@end
