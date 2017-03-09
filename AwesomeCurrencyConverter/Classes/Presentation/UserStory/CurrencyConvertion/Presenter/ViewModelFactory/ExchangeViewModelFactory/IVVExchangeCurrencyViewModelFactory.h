//
//  IVVExchangeCurrencyViewModelFactoryImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@class IVVExchangeFromListViewModel, IVVExchangeToListViewModel;
@class IVVCurrencyTransacrionModel;

#import "IVVCurrencyConstants.h"
#import "IVVModelConstants.h"

@protocol IVVExchangeCurrencyViewModelFactory <NSObject>

- (IVVExchangeToListViewModel *)exchangeToListViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                          currencyRates:(IVVCurrencyRates)currencyRates;

- (IVVExchangeFromListViewModel *)exchangeFromListViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                              currencyRates:(IVVCurrencyRates)currencyRates;

- (IVVExchangeFromListViewModel *)enrichExchangeFromListViewModel:(IVVExchangeFromListViewModel *)viewModel
                                                withExchangeModel:(IVVCurrencyTransacrionModel *)exchangeModel;

- (IVVExchangeToListViewModel *)enrichExchangeToListViewModel:(IVVExchangeToListViewModel *)viewModel
                                            withExchangeModel:(IVVCurrencyTransacrionModel *)exchangeModel;

@end
