//
//  IVVHelperAssembly.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@protocol IVVCurrencyConverter;
@protocol IVVCurrencyRatesProvider;
@protocol IVVMoneyStorage;

/**
 Factory for helper object
 */
@protocol IVVHelperAssembly <NSObject>

- (id<IVVCurrencyConverter>)currencyConverter;

- (id<IVVCurrencyRatesProvider>)currencyRatesProvider;

- (id<IVVMoneyStorage>)moneyStorage;

@end
