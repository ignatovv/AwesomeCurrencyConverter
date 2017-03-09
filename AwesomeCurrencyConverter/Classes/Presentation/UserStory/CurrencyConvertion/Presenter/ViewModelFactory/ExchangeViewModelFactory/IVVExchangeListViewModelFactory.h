//
//  IVVExchangeListViewModelFactoryImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@class IVVExchangeFromListViewModel, IVVExchangeToListViewModel;
@class IVVCurrencyTransacrionModel;

#import "IVVCurrencyConstants.h"
#import "IVVModelConstants.h"

@protocol IVVExchangeListViewModelFactory <NSObject>

- (IVVExchangeToListViewModel *)exchangeToListViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                          currencyRates:(IVVCurrencyRates)currencyRates;

- (IVVExchangeFromListViewModel *)exchangeFromListViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                              currencyRates:(IVVCurrencyRates)currencyRates;

- (IVVExchangeFromListViewModel *)enrichExchangeFromListViewModel:(IVVExchangeFromListViewModel *)viewModel
                                             withTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel;

- (IVVExchangeToListViewModel *)enrichExchangeToListViewModel:(IVVExchangeToListViewModel *)viewModel
                                         withTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel;

@end
