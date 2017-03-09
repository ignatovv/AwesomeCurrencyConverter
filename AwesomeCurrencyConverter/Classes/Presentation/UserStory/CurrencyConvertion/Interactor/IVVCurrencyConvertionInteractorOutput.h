//
//  IVVCurrencyConvertionInteractorOutput.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVModelConstants.h"

@class IVVCurrency, IVVMoneyAmount;

@protocol IVVCurrencyConvertionInteractorOutput <NSObject>

- (void)onMoneyAmountsDidChange:(IVVMoneyAmounts)moneyAmounts;
- (void)onCurrencyRatesDidChange:(IVVCurrencyRates)currencyRates;

@end
