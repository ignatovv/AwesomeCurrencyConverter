//
//  IVVCurrencyConvertionPresenter.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionPresenter.h"

#import "IVVCurrencyConvertionInteractorInput.h"
#import "IVVCurrencyConvertionViewInput.h"

// Factory
#import "IVVCurrencyConvertionViewModelFactory.h"

// Model
#import "IVVCurrencyConvertionExchangeModel.h"
#import "IVVMoneyAmount.h"

// View Model
#import "IVVCurrencyConvertionViewModel.h"
#import "IVVExchangeFromListViewModel.h"
#import "IVVExchangeToListViewModel.h"

// Validator
#import "IVVCurrencyCovertionValidator.h"

// Constants
#import "IVVModelConstants.h"

// Categories
#import "NSDecimalNumber+IVVUtilities.h"

@interface IVVCurrencyConvertionPresenter()

@property (nonatomic, strong) IVVCurrencyConvertionViewModel *viewModel;
@property (nonatomic, strong) IVVCurrencyConvertionExchangeModel *exchangeModel;

@end

@implementation IVVCurrencyConvertionPresenter

#pragma mark - Getters / Setters

- (IVVCurrencyConvertionExchangeModel *)exchangeModel {
    if (_exchangeModel == nil) {
        _exchangeModel = [[IVVCurrencyConvertionExchangeModel alloc] init];
    }
    
    return _exchangeModel;
}

#pragma mark - IVVCurrencyConvertionViewOutput

- (void)didTriggerViewDidLoadEvent {
    [self.view setupInitialState];
    
    [self.interactor loadMoneyAmounts];
    [self.interactor loadCurrencyRates];
    [self.interactor startCurrencyMonitoring];
}

- (void)didTriggerViewWillDisappearEvent {
    [self.interactor stopCurrencyMonitoring];
}

- (void)exchangeTextDidChange:(NSString *)exchangeText {
    NSDecimalNumber *exchangeAmount = [NSDecimalNumber ivv_decimalNumberWithString:exchangeText];
    self.exchangeModel.exchangeAmount = exchangeAmount;
    [self updateView];
}

- (void)exchangeCurrencyDidChange:(IVVCurrencyType)currencyType
                        convertTo:(BOOL)convertTo {
    if (convertTo == YES) {
        self.exchangeModel.currencyToType = currencyType;
    } else {
        self.exchangeModel.currencyFromType = currencyType;
    }
    
    [self updateView];
}

- (void)exchangeInitiated {
    [self.interactor exchangeMoney:self.exchangeModel.exchangeAmount
                      fromCurrency:self.exchangeModel.currencyFromType
                        toCurrency:self.exchangeModel.currencyToType
                     currencyRates:self.exchangeModel.currencyRates];
}

#pragma mark - IVVCurrencyConvertionInteractorOutput

- (void)onMoneyAmountsDidChange:(IVVMoneyAmounts)moneyAmounts {
    self.exchangeModel.moneyAmounts = moneyAmounts;
    self.exchangeModel.exchangeAmount = [NSDecimalNumber zero];
    
    [self.view purgeText];
    if ([self generateViewModelIfNeeded]) {
        [self updateView];
    }
}

- (void)onCurrencyRatesDidChange:(IVVCurrencyRates)currencyRates {
    self.exchangeModel.currencyRates = currencyRates;
    if ([self generateViewModelIfNeeded]) {
        [self updateView];
    }
}

#pragma mark - Private methods

- (BOOL)generateViewModelIfNeeded {
    if (self.viewModel != nil) {
        return YES;
    }
    
    if (self.exchangeModel.moneyAmounts == nil || self.exchangeModel.currencyRates == nil) {
        return NO;
    }
    
    
    [self generateViewModel];
    return YES;
}

- (void)generateViewModel {
    self.viewModel = [self.viewModelFactory generateCurrencyConvertionViewModelWithMoneyAmounts:self.exchangeModel.moneyAmounts
                                                                                  currencyRates:self.exchangeModel.currencyRates];
    
    // TODO: refactor currency type recieving
    IVVCurrencyType initialCurrencyFromType = [[self.viewModel.exchangeFromViewModel.currencyViewModeles firstObject] currencyType];
    IVVCurrencyType initialCurrencyToType = [[self.viewModel.exchangeToViewModel.currencyViewModeles firstObject] currencyType];
    self.exchangeModel.currencyToType = initialCurrencyToType;
    self.exchangeModel.currencyFromType = initialCurrencyFromType;
}

- (void)updateView {
    [self validateExchangeModel];
    BOOL exchangeAvaliable = [self.validator validateExchangeAvailabilityWithTransactionModel:self.exchangeModel];
    
    self.viewModel = [self.viewModelFactory enrichCurrencyConvertionViewModel:self.viewModel
                                                            withExchangeModel:self.exchangeModel
                                                            exchangeAvaliable:exchangeAvaliable];

    [self.view configWithViewModel:self.viewModel];
}

- (void)validateExchangeModel {
    BOOL transactionValid = [self.validator validateTransactionWithTransactionModel:self.exchangeModel];
    self.exchangeModel.transactionValid = transactionValid;
}

@end
