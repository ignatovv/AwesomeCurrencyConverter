//
//  IVVCurrencyCovertionValidatorImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyCovertionValidatorImplementation.h"

#import "NSArray+IVVMoneyAmounts.h"

#import "IVVCurrencyConvertionExchangeModel.h"
#import "IVVMoneyAmountObject.h"

static const NSInteger IVVCurrencyConvertionMinimunConvertionAmount = 0;

@implementation IVVCurrencyCovertionValidatorImplementation

- (BOOL)validateTransactionWithTransactionModel:(IVVCurrencyConvertionExchangeModel *)transactionModel {
    IVVMoneyAmountObject *moneyAmountObject = [transactionModel.moneyAmounts moneyAmountWithCurrency:transactionModel.currencyFromType];
    NSComparisonResult comparisonResult = [moneyAmountObject.moneyAmount compare:transactionModel.exchangeAmount];
    
    return comparisonResult != NSOrderedAscending;
}

- (BOOL)validateExchangeAvailabilityWithTransactionModel:(IVVCurrencyConvertionExchangeModel *)transactionModel {
    if (transactionModel.currencyToType == transactionModel.currencyFromType) {
        return NO;
    }
    if (transactionModel.exchangeAmount.integerValue <= IVVCurrencyConvertionMinimunConvertionAmount) {
        return NO;
    }

    return [self validateTransactionWithTransactionModel:transactionModel];
}

@end
