//
//  IVVHelperAssemblyImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVHelperAssemblyImplementation.h"

// Factories
#import "IVVServiceAssembly.h"
#import "IVVCoreComponentsAssembly.h"

// Classes
#import "IVVCurrencyConverterImplementation.h"
#import "IVVCurrencyRatesProviderImplementation.h"


@implementation IVVHelperAssemblyImplementationImplementation

- (id<IVVCurrencyConverter>)currencyConverter {
    return [TyphoonDefinition withClass:[IVVCurrencyConverterImplementation class]];
}

- (id<IVVCurrencyRatesProvider>)currencyRatesProvider {
    return [TyphoonDefinition withClass:[IVVCurrencyRatesProviderImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeLazySingleton;
                              
                              [definition injectProperty:@selector(currencyRatesService)
                                                    with:[self.serviceAssembly currencyRatesService]];
                              [definition injectProperty:@selector(scheduler)
                                                    with:[self.coreAssembly scheduler]];
                          }];
}

@end
