//
//  IVVCurrencyConvertionInteractor.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConvertionInteractorInput.h"

@protocol IVVCurrencyConvertionInteractorOutput;
@protocol IVVMoneyTransferService;
@protocol IVVCurrencyRatesProvider;
@protocol IVVMoneyStorageImplementation;

@interface IVVCurrencyConvertionInteractor : NSObject <IVVCurrencyConvertionInteractorInput>

@property (nonatomic, weak) id<IVVCurrencyConvertionInteractorOutput> output;

@property (nonatomic, strong) id<IVVCurrencyRatesProvider> currencyRatesProvider;
@property (nonatomic, strong) id<IVVMoneyTransferService> moneyTransferService;

@end
