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
#import "IVVExchangeListViewModelFactory.h"

@implementation IVVCurrencyConvertionViewModelFactoryImplementation

#pragma mark - Public methods

- (IVVCurrencyConvertionViewModel *)generateCurrencyConvertionViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                                          currencyRates:(IVVCurrencyRates)currencyRates {
    IVVCurrencyConvertionViewModel *viewModel = [[IVVCurrencyConvertionViewModel alloc] init];
    
    viewModel.exchangeFromViewModel = [self.exchangeListFactory exchangeFromListViewModelWithMoneyAmounts:moneyAmounts
                                                                                                currencyRates:currencyRates];
    
    viewModel.exchangeToViewModel = [self.exchangeListFactory exchangeToListViewModelWithMoneyAmounts:moneyAmounts
                                                                                            currencyRates:currencyRates];
    
    return viewModel;
}

- (IVVCurrencyConvertionViewModel *)enrichCurrencyConvertionViewModel:(IVVCurrencyConvertionViewModel *)viewModel
                                                    withTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel
                                                    exchangeAvaliable:(BOOL)exchangeAvaliable {
    viewModel.exchangeFromViewModel = [self.exchangeListFactory enrichExchangeFromListViewModel:viewModel.exchangeFromViewModel
                                                                           withTransactionModel:transactionModel];
    
    viewModel.exchangeToViewModel = [self.exchangeListFactory enrichExchangeToListViewModel:viewModel.exchangeToViewModel
                                                                          withTransactionModel:transactionModel];
    
    viewModel.exchangeEnambled = exchangeAvaliable;
    
    return viewModel;
}

@end
