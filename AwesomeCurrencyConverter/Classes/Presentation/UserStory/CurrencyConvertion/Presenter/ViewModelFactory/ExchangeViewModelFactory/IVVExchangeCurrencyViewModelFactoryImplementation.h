//
//  IVVExchangeCurrencyViewModelFactoryImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVExchangeCurrencyViewModelFactory.h"

@protocol IVVCurrencyConverter;

@interface IVVExchangeCurrencyViewModelFactoryImplementation : NSObject <IVVExchangeCurrencyViewModelFactory>

@property (nonatomic, strong) id<IVVCurrencyConverter> currencyConverter;

@end
