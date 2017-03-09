//
//  IVVMoneyTransferServiceImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVMoneyTransferServiceImplementation.h"

// Model
#import "IVVMoneyAmountObject.h"

// Storage
#import "IVVMoneyStorage.h"

// Converter
#import "IVVCurrencyConverter.h"

static NSString * const IVVInitialMoneyAmount = @"100.00";

@implementation IVVMoneyTransferServiceImplementation

#pragma mark - Public methods

- (IVVCurrencyRates)obtainCurrentMoneyAmounts {
    
    // inital amountInitialization
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDecimalNumber *initalMoneyAmount = [NSDecimalNumber decimalNumberWithString:IVVInitialMoneyAmount];
        [self.moneyStorage setMoneyAmount:initalMoneyAmount
                              forCurrency:IVVCurrencyTypeUSD];
        [self.moneyStorage setMoneyAmount:initalMoneyAmount
                              forCurrency:IVVCurrencyTypeGBP];
        [self.moneyStorage setMoneyAmount:initalMoneyAmount
                              forCurrency:IVVCurrencyTypeEUR];
    });
    
    NSMutableArray *moneyAmounts = [NSMutableArray array];
    IVVMoneyAmountObject *EURAmount = [self moneyAmountForCurrency:IVVCurrencyTypeEUR];
    [moneyAmounts addObject:EURAmount];
    IVVMoneyAmountObject *GBPAmount = [self moneyAmountForCurrency:IVVCurrencyTypeGBP];
    [moneyAmounts addObject:GBPAmount];
    IVVMoneyAmountObject *USDAmount = [self moneyAmountForCurrency:IVVCurrencyTypeUSD];
    [moneyAmounts addObject:USDAmount];
    
    return [moneyAmounts copy];
}

- (BOOL)exchangeMoney:(NSDecimalNumber *)amount
         fromCurrency:(IVVCurrencyType)fromCurrency
           toCurrency:(IVVCurrencyType)toCurrency
        currencyRates:(NSArray *)currencyRates {
    NSDecimalNumber *toAmount = [self.currencyConverter convertCurrency:fromCurrency
                                                             toCurrency:toCurrency
                                                      withCurrencyRates:currencyRates
                                                                 amount:amount];
    
    BOOL transferSucces = [self.moneyStorage subtractMoney:amount
                                               forCurrency:fromCurrency];
    if (transferSucces == NO) {
        return NO;
    }
    
    transferSucces = [self.moneyStorage addMoney:toAmount
                                     forCurrency:toCurrency];
    if (transferSucces == NO) {
        [self.moneyStorage addMoney:amount
                        forCurrency:fromCurrency];
        return NO;
    }
    
    return YES;
}

#pragma mark - Private methods

- (IVVMoneyAmountObject *)moneyAmountForCurrency:(IVVCurrencyType)currency {
    NSDecimalNumber *amount = [self.moneyStorage getMoneyAmountForCurrency:currency];
    IVVMoneyAmountObject *amountObject =[[IVVMoneyAmountObject alloc] initWithCurrencyType:currency
                                                                               moneyAmount:amount];
    return amountObject;
}

@end
