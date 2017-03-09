//
//  IVVCurrencyRatesServiceConfigurator.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

/**
 Configurator provides urls and parameters for service requests
 */
@protocol IVVCurrencyRatesServiceConfigurator <NSObject>

- (NSString *)urlForCurrencyRates;

@end
