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
#import "IVVCurrencyTransacrionModel.h"
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
@property (nonatomic, strong) IVVCurrencyTransacrionModel *transactionModel;

@end

@implementation IVVCurrencyConvertionPresenter

#pragma mark - Getters / Setters

- (IVVCurrencyTransacrionModel *)transactionModel {
    if (_transactionModel == nil) {
        _transactionModel = [[IVVCurrencyTransacrionModel alloc] init];
    }
    
    return _transactionModel;
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
    self.transactionModel.exchangeAmount = exchangeAmount;
    [self updateView];
}

- (void)exchangeCurrencyDidChange:(IVVCurrencyType)currencyType
                        convertTo:(BOOL)convertTo {
    if (convertTo == YES) {
        self.transactionModel.currencyTypeTo = currencyType;
    } else {
        self.transactionModel.currencyTypeFrom = currencyType;
    }
    
    [self updateView];
}

- (void)exchangeInitiated {
    [self.interactor exchangeMoney:self.transactionModel.exchangeAmount
                      fromCurrency:self.transactionModel.currencyTypeFrom
                        toCurrency:self.transactionModel.currencyTypeTo
                     currencyRates:self.transactionModel.currencyRates];
}

#pragma mark - IVVCurrencyConvertionInteractorOutput

- (void)onMoneyAmountsDidChange:(IVVMoneyAmounts)moneyAmounts {
    self.transactionModel.moneyAmounts = moneyAmounts;
    self.transactionModel.exchangeAmount = [NSDecimalNumber zero];
    
    [self.view purgeText];
    if ([self generateViewModelIfNeeded]) {
        [self updateView];
    }
}

- (void)onCurrencyRatesDidChange:(IVVCurrencyRates)currencyRates {
    self.transactionModel.currencyRates = currencyRates;
    if ([self generateViewModelIfNeeded]) {
        [self updateView];
    }
}

#pragma mark - Private methods

- (BOOL)generateViewModelIfNeeded {
    if (self.viewModel != nil) {
        return YES;
    }
    
    if (self.transactionModel.moneyAmounts == nil || self.transactionModel.currencyRates == nil) {
        return NO;
    }
    
    
    [self generateViewModel];
    return YES;
}

- (void)generateViewModel {
    self.viewModel = [self.viewModelFactory generateCurrencyConvertionViewModelWithMoneyAmounts:self.transactionModel.moneyAmounts
                                                                                  currencyRates:self.transactionModel.currencyRates];
    
    // TODO: refactor currency type recieving
    IVVCurrencyType initialCurrencyTypeFrom = [[self.viewModel.exchangeFromViewModel.currencyViewModeles firstObject] currencyType];
    IVVCurrencyType initialCurrencyTypeTo = [[self.viewModel.exchangeToViewModel.currencyViewModeles firstObject] currencyType];
    self.transactionModel.currencyTypeTo = initialCurrencyTypeTo;
    self.transactionModel.currencyTypeFrom = initialCurrencyTypeFrom;
}

- (void)updateView {
    [self validateTransactionModel];
    BOOL exchangeAvaliable = [self.validator validateExchangeAvailabilityWithTransactionModel:self.transactionModel];
    
    self.viewModel = [self.viewModelFactory enrichCurrencyConvertionViewModel:self.viewModel
                                                            withTransactionModel:self.transactionModel
                                                            exchangeAvaliable:exchangeAvaliable];

    [self.view configWithViewModel:self.viewModel];
}

- (void)validateTransactionModel {
    BOOL transactionValid = [self.validator validateTransactionWithTransactionModel:self.transactionModel];
    self.transactionModel.transactionValid = transactionValid;
}

@end
