//
//  IVVCurrencyConvertionInteractorInput.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConstants.h"
#import "IVVModelConstants.h"

@class IVVCurrency;

@protocol IVVCurrencyConvertionInteractorInput <NSObject>

- (void)loadMoneyAmounts;

- (void)loadCurrencyRates;

- (void)exchangeMoney:(NSDecimalNumber *)amount
         fromCurrency:(IVVCurrencyType)fromCurrency
           toCurrency:(IVVCurrencyType)toCurrency
        currencyRates:(IVVCurrencyRates)currencyRates;

- (void)startCurrencyMonitoring;

- (void)stopCurrencyMonitoring;

@end
