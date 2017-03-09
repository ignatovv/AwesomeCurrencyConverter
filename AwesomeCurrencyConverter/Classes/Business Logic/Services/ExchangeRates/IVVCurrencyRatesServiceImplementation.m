//
//  IVVCurrencyRatesServiceImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyRatesServiceImplementation.h"

// Client
#import "IVVClient.h"

// Mapper
#import "IVVCurrencyRatesServiceMapper.h"

// Configurator
#import "IVVCurrencyRatesServiceConfigurator.h"

// Model
#import "IVVCurrency.h"

@implementation IVVCurrencyRatesServiceImplementation

- (void)getCurrencyRatesWithSucces:(IVVCurrencyRatesBlock)succes
                           failure:(IVVErrorBlock)failure {
    NSString *endpoint = [self.configurator urlForCurrencyRates];
    [self.client getWithEndpoint:endpoint
                      parameters:nil
                      completion:^(NSDictionary *responseObject, NSError *error) {
                          if (error) {
                              if (failure != nil) {
                                  failure(error);
                              }
                              return;
                          }
                          
                          // TODO: validate response
                          
                          IVVCurrencyRates currencies = [self.mapper mapCurrencyRatesFromResponseObject:responseObject];
                          currencies = [self enrichCurrencyRatesWithEuroCurrency:currencies];
                          
                          succes(currencies);
                      }];
}

// TODO: ask backend to deploy new api
- (IVVCurrencyRates)enrichCurrencyRatesWithEuroCurrency:(IVVCurrencyRates)currencyRates {
    NSDecimalNumber *currencyRate = [NSDecimalNumber decimalNumberWithString:@"1.0000"];
    IVVCurrency *currency = [[IVVCurrency alloc] initWithType:IVVCurrencyTypeEUR
                                                                     rate:currencyRate];
    NSMutableArray *enrichedCurrencyRates = [NSMutableArray arrayWithArray:currencyRates];
    [enrichedCurrencyRates addObject:currency];
    return [enrichedCurrencyRates copy];
}

@end
