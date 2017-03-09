//
//  IVVCurrencyConvertionViewModelFactory.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConstants.h"
#import "IVVModelConstants.h"

@class IVVCurrencyConvertionViewModel, IVVExchangeViewModel;
@class IVVCurrencyConvertionExchangeModel;

@protocol IVVCurrencyConvertionViewModelFactory <NSObject>

- (IVVCurrencyConvertionViewModel *)generateCurrencyConvertionViewModelWithMoneyAmounts:(IVVMoneyAmounts)moneyAmounts
                                                                          currencyRates:(IVVCurrencyRates)currencyRates;

- (IVVCurrencyConvertionViewModel *)enrichCurrencyConvertionViewModel:(IVVCurrencyConvertionViewModel *)viewModel
                                                    withExchangeModel:(IVVCurrencyConvertionExchangeModel *)exchangeModel
                                                    exchangeAvaliable:(BOOL)exchangeAvaliable;

@end 
