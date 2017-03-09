//
//  IVVCurrencyTransacrionModel.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyTransacrionModel.h"

@implementation IVVCurrencyTransacrionModel

- (instancetype)init {
    if (self = [super init]) {
        _exchangeAmount = [NSDecimalNumber zero];
    }
    
    return self;
}

@end
