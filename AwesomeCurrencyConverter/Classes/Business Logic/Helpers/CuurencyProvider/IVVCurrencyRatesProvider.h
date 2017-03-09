//
//  IVVCurrencyProvider.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVServiceConstants.h"
#import "IVVModelConstants.h"

@protocol IVVCurrencyRatesProviderSubscriber <NSObject>

- (void)currencyRatesDidChange:(IVVCurrencyRates)currencyRates;

@end

@protocol IVVCurrencyRatesProvider <NSObject>

- (void)getCurrencyRatesWithSucces:(IVVCurrencyRatesBlock)succes
                           failure:(IVVErrorBlock)failure;

- (void)subscibeToCurrencyRatesChanges:(id<IVVCurrencyRatesProviderSubscriber>)subscriber;
- (void)unSubscibeToCurrencyRatesChanges:(id<IVVCurrencyRatesProviderSubscriber>)subscriber;

@end

