//
//  IVVCurrencyConvertionViewModelFactory.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConvertionViewModelFactory.h"

@protocol IVVExchangeCurrencyViewModelFactory;

@interface IVVCurrencyConvertionViewModelFactoryImplementation : NSObject <IVVCurrencyConvertionViewModelFactory>

@property (nonatomic, strong) id<IVVExchangeCurrencyViewModelFactory> exchangeCurrencyFactory;

@end
