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

- (void)loadInitialData {
    IVVMoneyAmounts moneyAmounts = [self.moneyTransferService obtainCurrentMoneyAmounts];
    [self.output onMoneyAmountsDidChange:moneyAmounts];
    
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
    }
    
    // TODO: Process error
}


- (void)startCurrencyMonitoring {
    [self.currencyRatesProvider subscibeToCurrencyRatesChanges:self];
}

- (void)stopCurrencyMonitoring {
    [self.currencyRatesProvider unSubscibeToCurrencyRatesChanges:self];
}

#pragma mark - IVVCurrencyRatesProviderSubscriber

- (void)currencyRatesDidChange:(NSArray<IVVCurrency *> *)currencyRates {
    [self.output onCurrencyRatesDidChange:currencyRates];
}

@end
