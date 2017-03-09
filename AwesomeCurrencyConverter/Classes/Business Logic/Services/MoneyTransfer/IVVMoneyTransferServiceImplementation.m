//
//  IVVMoneyTransferServiceImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVMoneyTransferServiceImplementation.h"

// Model
#import "IVVMoneyAmount.h"

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
        [self setInitialMoneyAmounts];
    });
    
    NSMutableArray *moneyAmounts = [NSMutableArray array];
    IVVMoneyAmount *EURAmount = [self moneyAmountForCurrency:IVVCurrencyTypeEUR];
    [moneyAmounts addObject:EURAmount];
    IVVMoneyAmount *GBPAmount = [self moneyAmountForCurrency:IVVCurrencyTypeGBP];
    [moneyAmounts addObject:GBPAmount];
    IVVMoneyAmount *USDAmount = [self moneyAmountForCurrency:IVVCurrencyTypeUSD];
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

- (IVVMoneyAmount *)moneyAmountForCurrency:(IVVCurrencyType)currency {
    NSDecimalNumber *amount = [self.moneyStorage getMoneyAmountForCurrency:currency];
    IVVMoneyAmount *amountObject =[[IVVMoneyAmount alloc] initWithCurrencyType:currency
                                                                               moneyAmount:amount];
    return amountObject;
}

- (void)setInitialMoneyAmounts {
    NSDecimalNumber *initalMoneyAmount = [NSDecimalNumber decimalNumberWithString:IVVInitialMoneyAmount];
    [self.moneyStorage setMoneyAmount:initalMoneyAmount
                          forCurrency:IVVCurrencyTypeUSD];
    [self.moneyStorage setMoneyAmount:initalMoneyAmount
                          forCurrency:IVVCurrencyTypeGBP];
    [self.moneyStorage setMoneyAmount:initalMoneyAmount
                          forCurrency:IVVCurrencyTypeEUR];
}

@end
