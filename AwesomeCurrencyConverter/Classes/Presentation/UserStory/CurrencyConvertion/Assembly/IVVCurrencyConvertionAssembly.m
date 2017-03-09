//
//  IVVCurrencyConvertionAssembly.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionAssembly.h"

// Factories
#import "IVVServiceAssembly.h"
#import "IVVHelperAssembly.h"

// Components of VIPER моdule
#import "IVVCurrencyConvertionViewController.h"
#import "IVVCurrencyConvertionPresenter.h"
#import "IVVCurrencyConvertionInteractor.h"
#import "IVVCurrencyConvertionRouter.h"

// Factory
#import "IVVCurrencyConvertionViewModelFactoryImplementation.h"
#import "IVVExchangeListViewModelFactoryImplementation.h"

// Validator
#import "IVVCurrencyCovertionValidatorImplementation.h"

// View
#import "IVVExchangeView.h"

// DDM
#import "IVVCurrencyConvertionDataDisplayManager.h"

@implementation IVVCurrencyConvertionAssembly

- (UIViewController *)viewCurrencyConvertionModule {
    return [TyphoonDefinition withClass:[IVVCurrencyConvertionViewController class]
                                 configuration:^(TyphoonDefinition *definition) {
                                     [definition injectProperty:@selector(output)
                                                           with:[self presenterCurrencyConvertionModule]];
                                     [definition injectProperty:@selector(dataDisplayManager)
                                                           with:[self dataDisplayManager]];
                                        }];
}

- (IVVCurrencyConvertionInteractor *)interactorCurrencyConvertionModule {
    return [TyphoonDefinition withClass:[IVVCurrencyConvertionInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterCurrencyConvertionModule]];
                              [definition injectProperty:@selector(currencyRatesProvider)
                                                    with:[self.helperAssembly currencyRatesProvider]];
                              [definition injectProperty:@selector(moneyTransferService)
                                                    with:[self.serviceAssembly moneyTransferService]];
                          }];
}

- (id<IVVCurrencyConvertionViewOutput, IVVCurrencyConvertionInteractorOutput>)presenterCurrencyConvertionModule {
    return [TyphoonDefinition withClass:[IVVCurrencyConvertionPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewCurrencyConvertionModule]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorCurrencyConvertionModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerCurrencyConvertionModule]];
                              
                              [definition injectProperty:@selector(viewModelFactory)
                                                    with:[self currencyConvertionViewModelFactory]];
                              [definition injectProperty:@selector(validator)
                                                    with:[[IVVCurrencyCovertionValidatorImplementation alloc] init]];
                          }];
}

- (IVVCurrencyConvertionRouter *)routerCurrencyConvertionModule {
    return [TyphoonDefinition withClass:[IVVCurrencyConvertionRouter class]];
}

#pragma mark - Data display manager 

- (IVVCurrencyConvertionDataDisplayManager *)dataDisplayManager {
    return [TyphoonDefinition withClass:[IVVCurrencyConvertionDataDisplayManager class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(delegate)
                                                    with:[self viewCurrencyConvertionModule]];
                          }];
}

#pragma mark - View model factories

- (id<IVVCurrencyConvertionViewModelFactory>)currencyConvertionViewModelFactory {
    return [TyphoonDefinition withClass:[IVVCurrencyConvertionViewModelFactoryImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(exchangeCurrencyFactory)
                                                    with:[self exchangeCurrencyViewModelFactory]];
                          }];
}

- (id<IVVExchangeListViewModelFactory>)exchangeCurrencyViewModelFactory {
    return [TyphoonDefinition withClass:[IVVExchangeListViewModelFactoryImplementation class] configuration:^(TyphoonDefinition *definition) {
            definition.scope = TyphoonScopeWeakSingleton;
            [definition injectProperty:@selector(currencyConverter)
                                  with:[self.helperAssembly currencyConverter]];
        }];
}

#pragma mark - Views 

- (IVVExchangeView *)exchangeFormView {
    return [TyphoonDefinition withClass:[IVVExchangeView class]];
}

- (IVVExchangeView *)exchangeToView {
    return [TyphoonDefinition withClass:[IVVExchangeView class]];
}

@end
