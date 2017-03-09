//
//  IVVCurrencyConvertionPresenter.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionViewOutput.h"
#import "IVVCurrencyConvertionInteractorOutput.h"

@protocol IVVCurrencyConvertionViewInput, IVVCurrencyConvertionInteractorInput, IVVCurrencyConvertionRouterInput;
@protocol IVVCurrencyConvertionViewModelFactory;
@protocol IVVCurrencyCovertionValidator;

#import <Foundation/Foundation.h>

@interface IVVCurrencyConvertionPresenter : NSObject <IVVCurrencyConvertionViewOutput, IVVCurrencyConvertionInteractorOutput>

@property (nonatomic, weak) id<IVVCurrencyConvertionViewInput> view;
@property (nonatomic, strong) id<IVVCurrencyConvertionInteractorInput> interactor;
@property (nonatomic, strong) id<IVVCurrencyConvertionRouterInput> router;

@property (nonatomic, strong) id<IVVCurrencyConvertionViewModelFactory> viewModelFactory;
@property (nonatomic, strong) id<IVVCurrencyCovertionValidator> validator;

@end
