//
//  IVVMoneyTransferService.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConstants.h"
#import "IVVModelConstants.h"

@class IVVMoneyAmount;

@protocol IVVMoneyTransferService <NSObject>

- (IVVMoneyAmounts)obtainCurrentMoneyAmounts;

- (BOOL)exchangeMoney:(NSDecimalNumber *)amount
         fromCurrency:(IVVCurrencyType)fromCurrency
           toCurrency:(IVVCurrencyType)toCurrency
        currencyRates:(IVVCurrencyRates)currencyRates;

@end
