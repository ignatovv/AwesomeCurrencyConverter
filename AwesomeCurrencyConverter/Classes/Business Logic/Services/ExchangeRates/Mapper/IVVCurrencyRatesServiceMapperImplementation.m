//
//  IVVCurrencyRatesServiceMapperImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyRatesServiceMapperImplementation.h"

// Model
#import "IVVCurrencyObject.h"

// Constants
#import "IVVAPIConstants.h"

@implementation IVVCurrencyRatesServiceMapperImplementation

- (IVVCurrencyRates)mapCurrencyRatesFromResponseObject:(id)responseObject {
    id payload = [responseObject valueForKeyPath:IVVAPIPayloadKeyPath];
    NSArray *currencies = [self arrayOfObjectsFromExternalRepresentation:payload
                                                                  forKey:IVVAPIDataKey
                                                             withMapping:[IVVCurrencyObject objectMapping]];
    
    NSMutableArray *filteredCurrencies = [NSMutableArray array];
    for (IVVCurrencyObject *currency in currencies) {
        if (currency.currencyType != IVVCurrencyTypeUnknown) {
            [filteredCurrencies addObject:currency];
        }
    }
    
    return [filteredCurrencies copy];
}

@end
