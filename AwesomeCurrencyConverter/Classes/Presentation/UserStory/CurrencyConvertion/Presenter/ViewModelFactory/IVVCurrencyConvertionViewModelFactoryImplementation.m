//
//  IVVCurrencyConvertionViewModelFactory.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionViewModelFactoryImplementation.h"

// ViewModel
#import "IVVCurrencyConvertionViewModel.h"
#import "IVVCurrencyTransacrionModel.h"

// Factory
#import "IVVExchangeCurrencyViewModelFactory.h"

@implementation IVVCurrencyConvertionViewModelFactoryImplementation

#pragma mark - Public methods

- (IVVCurrencyConvertionViewModel *)generateCurrencyConvertionViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                                          currencyRates:(IVVCurrencyRates)currencyRates {
    IVVCurrencyConvertionViewModel *viewModel = [[IVVCurrencyConvertionViewModel alloc] init];
    
    viewModel.exchangeFromViewModel = [self.exchangeCurrencyFactory exchangeFromListViewModelWithMoneyAmounts:moneyAmounts
                                                                                                currencyRates:currencyRates];
    
    viewModel.exchangeToViewModel = [self.exchangeCurrencyFactory exchangeToListViewModelWithMoneyAmounts:moneyAmounts
                                                                                            currencyRates:currencyRates];
    
    return viewModel;
}

- (IVVCurrencyConvertionViewModel *)enrichCurrencyConvertionViewModel:(IVVCurrencyConvertionViewModel *)viewModel
                                                    withTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel
                                                    exchangeAvaliable:(BOOL)exchangeAvaliable {
    viewModel.exchangeFromViewModel = [self.exchangeCurrencyFactory enrichExchangeFromListViewModel:viewModel.exchangeFromViewModel
                                                                           withTransactionModel:transactionModel];
    
    viewModel.exchangeToViewModel = [self.exchangeCurrencyFactory enrichExchangeToListViewModel:viewModel.exchangeToViewModel
                                                                          withTransactionModel:transactionModel];
    
    viewModel.exchangeEnambled = exchangeAvaliable;
    
    return viewModel;
}

@end
