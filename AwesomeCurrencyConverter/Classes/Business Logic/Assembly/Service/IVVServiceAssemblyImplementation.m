//
//  IVVStartUpManagerAssembly.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVServiceAssemblyImplementation.h"

// Factories
#import "IVVCurrencyConvertionAssembly.h"
#import "IVVHelperAssembly.h"
#import "IVVCoreComponentsAssembly.h"

// Services
#import "IVVStartUpManagerImplementation.h"
#import "IVVCurrencyRatesServiceImplementation.h"
#import "IVVMoneyTransferServiceImplementation.h"

// Mapper
#import "IVVCurrencyRatesServiceMapperImplementation.h"

// Configurator
#import "IVVCurrencyRatesServiceConfiguratorImplementation.h"

// Storage
#import "IVVMoneyStorageImplementation.h"

@implementation IVVServiceAssemblyImplementation

#pragma mark - Services

- (id<IVVStartUpManager>)startupService {
    return [TyphoonDefinition withClass:[IVVStartUpManagerImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeLazySingleton;
                              [definition injectProperty:@selector(storyboardAssembly)
                                                    with:self.storyboardAssembly];
                          }];
}

- (id<IVVCurrencyRatesService>)currencyRatesService {
    return [TyphoonDefinition withClass:[IVVCurrencyRatesServiceImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeLazySingleton;
                              
                              [definition injectProperty:@selector(client)
                                                    with:[self.coreAssembly XMLCapableClient]];
                              [definition injectProperty:@selector(mapper)
                                                    with:[[IVVCurrencyRatesServiceMapperImplementation alloc] init]];
                              [definition injectProperty:@selector(configurator)
                                                    with:[[IVVCurrencyRatesServiceConfiguratorImplementation alloc] init]];
                          }];
}

- (id<IVVMoneyTransferService>)moneyTransferService {
    return [TyphoonDefinition withClass:[IVVMoneyTransferServiceImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeLazySingleton;
                              
                              [definition injectProperty:@selector(moneyStorage)
                                                    with:[self.helperAssembly moneyStorage]];
                              [definition injectProperty:@selector(currencyConverter)
                                                    with:[self.helperAssembly currencyConverter]];
                          }];
}

@end
