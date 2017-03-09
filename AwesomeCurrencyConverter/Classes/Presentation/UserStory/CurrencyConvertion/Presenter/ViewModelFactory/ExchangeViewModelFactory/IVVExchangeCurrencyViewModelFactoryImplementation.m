//
//  IVVExchangeCurrencyViewModelFactoryImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

// View Model
#import "IVVExchangeCurrencyFromViewModel.h"
#import "IVVExchangeCurrencyToViewModel.h"

#import "IVVExchangeToListViewModel.h"
#import "IVVExchangeFromListViewModel.h"

// Model
#import "IVVMoneyAmount.h"
#import "IVVCurrency.h"
#import "IVVCurrencyTransacrionModel.h"

// Helpers
#import "IVVCurrencyConverter.h"

// Categories
#import "NSArray+IVVCurrencyRates.h"
#import "NSArray+IVVMoneyAmounts.h"
#import "NSDecimalNumber+IVVUtilities.h"

#import "IVVExchangeCurrencyViewModelFactoryImplementation.h"

static NSString * const IVVMoneyAmountMask = @"You have %@%@";
static NSString * const IVVExchangeRateMask = @"%@%@ = %@%@";

static NSString * const IVVMoneyAmountOne = @"1";
static NSString * const IVVMoneyAmountZero = @"0";

@implementation IVVExchangeCurrencyViewModelFactoryImplementation

#pragma mark - Public methods

- (IVVExchangeToListViewModel *)exchangeToListViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                          currencyRates:(IVVCurrencyRates)currencyRates {

    NSMutableArray<IVVExchangeCurrencyToViewModel *> *currencyViewModeles = [NSMutableArray array];
    
    for (IVVMoneyAmount *moneyAmount in moneyAmounts) {
        IVVCurrency *currencyRate = [currencyRates currecnyRateWithCurrency:moneyAmount.currencyType];
    
        IVVExchangeCurrencyToViewModel *viewModel = [self currencyToViewModelWithMoneyAmount:moneyAmount
                                                                                currencyRate:currencyRate];
        [currencyViewModeles addObject:viewModel];
    }
    
    IVVExchangeToListViewModel *exchangeViewModel = [[IVVExchangeToListViewModel alloc] init];
    exchangeViewModel.currencyViewModeles = [currencyViewModeles copy];
    return exchangeViewModel;
}

- (IVVExchangeFromListViewModel *)exchangeFromListViewModelWithMoneyAmounts:(IVVCurrencyRates)moneyAmounts
                                                              currencyRates:(IVVCurrencyRates)currencyRates {
    NSMutableArray<IVVExchangeCurrencyFromViewModel *> *currencyViewModeles = [NSMutableArray array];
    
    for (IVVMoneyAmount *moneyAmount in moneyAmounts) {
        IVVCurrency *currencyRate = [currencyRates currecnyRateWithCurrency:moneyAmount.currencyType];
        
        IVVExchangeCurrencyFromViewModel *viewModel = [self currencyFromViewModelWithMoneyAmount:moneyAmount
                                                                                    currencyRate:currencyRate];
        [currencyViewModeles addObject:viewModel];
    }
    
    IVVExchangeFromListViewModel *exchangeViewModel = [[IVVExchangeFromListViewModel alloc] init];
    exchangeViewModel.currencyViewModeles = [currencyViewModeles copy];
    return exchangeViewModel;
}

- (IVVExchangeFromListViewModel *)enrichExchangeFromListViewModel:(IVVExchangeFromListViewModel *)viewModel
                                                withTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel {
    NSMutableArray *currencyViewModeles = [NSMutableArray array];
    
    for (IVVExchangeCurrencyFromViewModel *currencyViewModel in viewModel.currencyViewModeles) {
        currencyViewModel.exchangeAmount = [self moneyAmountStringWithAmount:transactionModel.exchangeAmount];
        
        IVVCurrencyType currencyType = currencyViewModel.currencyType;
        IVVMoneyAmount *moneyAmount = [transactionModel.moneyAmounts moneyAmountWithCurrency:currencyType];
        NSString *moneyAmountString = [self moneyAmountWithType:currencyType
                                                         amount:moneyAmount.moneyAmount];
        currencyViewModel.currencyAmount = moneyAmountString;
        
        if (transactionModel.currencyFromType == currencyType) {
            currencyViewModel.errorState = !transactionModel.transactionValid;
        }
        
        [currencyViewModeles addObject:currencyViewModel];
    }

    viewModel.currencyViewModeles = [currencyViewModeles copy];
    return viewModel;
}

- (IVVExchangeToListViewModel *)enrichExchangeToListViewModel:(IVVExchangeToListViewModel *)viewModel
                                            withTransactionModel:(IVVCurrencyTransacrionModel *)transactionModel {
    NSMutableArray *currencyViewModeles = [NSMutableArray array];
    
    for (IVVExchangeCurrencyToViewModel *currencyViewModel in viewModel.currencyViewModeles) {
        NSDecimalNumber *exchangeAmount = [self.currencyConverter convertCurrency:transactionModel.currencyFromType
                                                                       toCurrency:currencyViewModel.currencyType
                                                                withCurrencyRates:transactionModel.currencyRates
                                                                           amount:transactionModel.exchangeAmount];
        currencyViewModel.exchangeAmount = [self moneyAmountStringWithAmount:exchangeAmount];
        IVVCurrencyType currencyTypeTo = currencyViewModel.currencyType;
        NSString *exchangeRate = [self exchangeRateWithCurrencyRateTo:transactionModel.currencyFromType
                                                     CurrencyRateFrom:currencyTypeTo
                                                        currencyRates:transactionModel.currencyRates];
        currencyViewModel.exchangeRate = exchangeRate;
        
        IVVCurrencyType currencyType = currencyViewModel.currencyType;
        IVVMoneyAmount *moneyAmount = [transactionModel.moneyAmounts moneyAmountWithCurrency:currencyType];
        
        NSString *moneyAmountString = [self moneyAmountWithType:currencyType
                                                         amount:moneyAmount.moneyAmount];
        currencyViewModel.currencyAmount = moneyAmountString;


        [currencyViewModeles addObject:currencyViewModel];
    }
    
    viewModel.currencyViewModeles = [currencyViewModeles copy];
    
    return viewModel;
}

#pragma mark - Private Methods

- (IVVExchangeCurrencyToViewModel *)currencyToViewModelWithMoneyAmount:(IVVMoneyAmount *)moneyAmount
                                                          currencyRate:(IVVCurrency *)currencyRate {
    IVVExchangeCurrencyToViewModel *viewModel = [[IVVExchangeCurrencyToViewModel alloc] init];
    viewModel.name = [self currencyNameWithType:moneyAmount.currencyType];
    viewModel.currencyAmount = [self moneyAmountWithType:moneyAmount.currencyType
                                                  amount:moneyAmount.moneyAmount];
    viewModel.transferDirection = IVVExchangeCurrencyFromViewModelTransferDirectionPositive;
    viewModel.currencyType = currencyRate.currencyType;
    viewModel.exchangeAmount = IVVMoneyAmountZero;
    
    return viewModel;
}

- (IVVExchangeCurrencyFromViewModel *)currencyFromViewModelWithMoneyAmount:(IVVMoneyAmount *)moneyAmount
                                                              currencyRate:(IVVCurrency *)currencyRate {
    IVVExchangeCurrencyFromViewModel *viewModel = [[IVVExchangeCurrencyFromViewModel alloc] init];
    viewModel.name = [self currencyNameWithType:moneyAmount.currencyType];
    viewModel.currencyAmount = [self moneyAmountWithType:moneyAmount.currencyType
                                                  amount:moneyAmount.moneyAmount];
    viewModel.transferDirection = IVVExchangeCurrencyFromViewModelTransferDirectionNegative;
    viewModel.currencyType = currencyRate.currencyType;
    viewModel.exchangeAmount = IVVMoneyAmountZero;
    viewModel.errorState = NO;
    
    return viewModel;
}

#pragma mark - Helpers

- (NSString *)exchangeRateWithCurrencyRateTo:(IVVCurrencyType)currencyRateTo
                            CurrencyRateFrom:(IVVCurrencyType)currencyRateFrom
                               currencyRates:(IVVCurrencyRates)currencyRates {
    NSString *currencyFomSign = [self currencySignDictionary][@(currencyRateFrom)];
    NSString *currencyFormAmount = IVVMoneyAmountOne;
    NSString *currencyToSign = [self currencySignDictionary][@(currencyRateTo)];
    
    NSDecimalNumber *convertedAmount = [self.currencyConverter convertCurrency:currencyRateFrom
                                                                    toCurrency:currencyRateTo
                                                             withCurrencyRates:currencyRates
                                                                        amount:[NSDecimalNumber decimalNumberWithString:IVVMoneyAmountOne]];
    NSString *currencyToAmount = [self moneyAmountStringWithAmount:convertedAmount];
    
    NSString *exchangeRate = [NSString stringWithFormat:IVVExchangeRateMask, currencyFomSign, currencyFormAmount, currencyToSign, currencyToAmount];
    
    return exchangeRate;
}

- (NSString *)currencyNameWithType:(IVVCurrencyType)type {
    NSString *currencyName = [[self currencyNameDictionary] objectForKey:@(type)];
    return currencyName;
}

- (NSString *)moneyAmountWithType:(IVVCurrencyType)type
                           amount:(NSDecimalNumber *)amount {
    NSString *currencySign = [[self currencySignDictionary] objectForKey:@(type)];
    NSString *stringAmount = [self moneyAmountStringWithAmount:amount];
    NSString *moneyAmountString = [NSString stringWithFormat:IVVMoneyAmountMask, currencySign, stringAmount];
    return moneyAmountString;
}

- (NSString *)moneyAmountStringWithAmount:(NSDecimalNumber *)amount {
    if (amount == nil) {
        return @"0";
    }
    return [amount ivv_stringWithRoundedDecimals:2];
}

#pragma mark - Mapping

- (NSDictionary *)currencyNameDictionary {
    return @{ @(IVVCurrencyTypeEUR) : @"EUR",
              @(IVVCurrencyTypeUSD) : @"USD",
              @(IVVCurrencyTypeGBP) : @"GBP" };
}

- (NSDictionary *)currencySignDictionary {
    return @{ @(IVVCurrencyTypeEUR) : @"€",
              @(IVVCurrencyTypeUSD) : @"$",
              @(IVVCurrencyTypeGBP) : @"£" };
}

@end
