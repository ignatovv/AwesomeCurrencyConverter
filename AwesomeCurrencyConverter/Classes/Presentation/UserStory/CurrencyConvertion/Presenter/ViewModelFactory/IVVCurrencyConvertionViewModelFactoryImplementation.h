//
//  IVVCurrencyConvertionViewModelFactory.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConvertionViewModelFactory.h"

@protocol IVVExchangeListViewModelFactory;

@interface IVVCurrencyConvertionViewModelFactoryImplementation : NSObject <IVVCurrencyConvertionViewModelFactory>

@property (nonatomic, strong) id<IVVExchangeListViewModelFactory> exchangeListFactory;

@end
