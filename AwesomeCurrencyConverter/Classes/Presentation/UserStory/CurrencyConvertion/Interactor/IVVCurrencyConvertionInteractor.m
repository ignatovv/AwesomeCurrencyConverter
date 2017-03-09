//
//  IVVCurrencyConvertionInteractor.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionInteractor.h"

#import "IVVCurrencyConvertionInteractorOutput.h"

// Services
#import "IVVCurrencyRatesProvider.h"
#import "IVVMoneyTransferService.h"

// Storage
#import "IVVMoneyStorage.h"

@interface IVVCurrencyConvertionInteractor() <IVVCurrencyRatesProviderSubscriber>

@end

@implementation IVVCurrencyConvertionInteractor

- (void)loadMoneyAmounts {
    IVVMoneyAmounts moneyAmounts = [self.moneyTransferService obtainCurrentMoneyAmounts];
    [self.output onMoneyAmountsDidChange:moneyAmounts];
}

- (void)loadCurrencyRates {
    @weakify(self)
    [self.currencyRatesProvider getCurrencyRatesWithSucces:^(IVVCurrencyRates currencyRates) {
        @strongify(self)
        [self.output onCurrencyRatesDidChange:currencyRates];
    } failure:^(NSError *error) {
        // TODO Fail
    }];
}

- (void)exchangeMoney:(NSDecimalNumber *)amount
         fromCurrency:(IVVCurrencyType)fromCurrency
           toCurrency:(IVVCurrencyType)toCurrency
        currencyRates:(IVVCurrencyRates)currencyRates {
    BOOL transferSucceed = [self.moneyTransferService exchangeMoney:amount
                                                       fromCurrency:fromCurrency
                                                         toCurrency:toCurrency
                                                      currencyRates:currencyRates];
    if (transferSucceed == YES) {
        IVVMoneyAmounts moneyAmounts = [self.moneyTransferService obtainCurrentMoneyAmounts];
        [self.output onMoneyAmountsDidChange:moneyAmounts];
        return;
    } else {
        // TODO: Process error
    }
}


- (void)startCurrencyMonitoring {
    [self.currencyRatesProvider subscibeToCurrencyRatesChanges:self];
}

- (void)stopCurrencyMonitoring {
    [self.currencyRatesProvider unSubscibeToCurrencyRatesChanges:self];
}

#pragma mark - IVVCurrencyRatesProviderSubscriber

- (void)currencyRatesDidChange:(IVVCurrencyRates)currencyRates {
    [self.output onCurrencyRatesDidChange:currencyRates];
}

@end
