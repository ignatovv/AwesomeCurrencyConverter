//
//  IVVMoneyAmount.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVMoneyAmount.h"

@implementation IVVMoneyAmount

- (instancetype)initWithCurrencyType:(IVVCurrencyType)currencyType
                         moneyAmount:(NSDecimalNumber *)moneyAmount {
    if (self = [super init]) {
        _currencyType = currencyType;
        _moneyAmount = moneyAmount;
    }
    
    return self;
}

@end
