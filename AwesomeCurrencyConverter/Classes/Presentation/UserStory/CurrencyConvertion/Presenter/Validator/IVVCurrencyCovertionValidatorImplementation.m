//
//  IVVCurrencyCovertionValidatorImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyCovertionValidatorImplementation.h"

#import "NSArray+IVVMoneyAmounts.h"

#import "IVVCurrencyTransacrionModel.h"
#import "IVVMoneyAmount.h"

// minimum amount of transaction is 1
static const NSInteger IVVCurrencyConvertionMinimunConvertionAmount = 0;

@implementation IVVCurrencyCovertionValidatorImplementation

- (BOOL)validateTransactionWithTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel {
    IVVMoneyAmount *moneyAmountObject = [transactionModel.moneyAmounts moneyAmountWithCurrency:transactionModel.currencyTypeFrom];
    NSComparisonResult comparisonResult = [moneyAmountObject.moneyAmount compare:transactionModel.exchangeAmount];
    
    return comparisonResult != NSOrderedAscending;
}

- (BOOL)validateExchangeAvailabilityWithTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel {
    if (transactionModel.currencyTypeTo == transactionModel.currencyTypeFrom) {
        return NO;
    }
    if (transactionModel.exchangeAmount.integerValue <= IVVCurrencyConvertionMinimunConvertionAmount) {
        return NO;
    }

    return [self validateTransactionWithTransactionModel:transactionModel];
}

@end
