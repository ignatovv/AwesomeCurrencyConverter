//
//  IVVCurrencyConverter.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConstants.h"
#import "IVVModelConstants.h"

@class IVVCurrency;

@protocol IVVCurrencyConverter <NSObject>

- (NSDecimalNumber *)convertCurrency:(IVVCurrencyType)fromCurrency
                          toCurrency:(IVVCurrencyType)toCurrency
                   withCurrencyRates:(IVVCurrencyRates)currencyRates
                              amount:(NSDecimalNumber *)amount;

@end
