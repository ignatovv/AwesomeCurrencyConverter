//
//  IVVCurrencyConvertionExchangeModel.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionExchangeModel.h"

@implementation IVVCurrencyConvertionExchangeModel

- (NSDecimalNumber *)exchangeAmount {
    if (_exchangeAmount == nil) {
        _exchangeAmount = [NSDecimalNumber zero];
    }
    
    return _exchangeAmount;
}

@end
