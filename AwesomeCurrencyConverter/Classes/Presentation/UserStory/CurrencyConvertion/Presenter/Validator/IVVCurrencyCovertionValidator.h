//
//  IVVCurrencyCovertionValidator.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@class IVVCurrencyConvertionExchangeModel;

@protocol IVVCurrencyCovertionValidator <NSObject>

- (BOOL)validateTransactionWithTransactionModel:(IVVCurrencyConvertionExchangeModel *)transactionModel;

- (BOOL)validateExchangeAvailabilityWithTransactionModel:(IVVCurrencyConvertionExchangeModel *)transactionModel;

@end
