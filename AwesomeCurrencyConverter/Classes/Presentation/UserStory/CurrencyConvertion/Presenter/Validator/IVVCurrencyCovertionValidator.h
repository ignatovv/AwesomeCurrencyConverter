//
//  IVVCurrencyCovertionValidator.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@class IVVCurrencyTransacrionModel;

@protocol IVVCurrencyCovertionValidator <NSObject>

- (BOOL)validateTransactionWithTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel;

- (BOOL)validateExchangeAvailabilityWithTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel;

@end
