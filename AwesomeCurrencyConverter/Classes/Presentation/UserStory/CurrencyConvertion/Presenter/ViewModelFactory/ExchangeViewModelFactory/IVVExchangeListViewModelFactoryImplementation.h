//
//  IVVExchangeListViewModelFactoryImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVExchangeListViewModelFactory.h"

@protocol IVVCurrencyConverter;

@interface IVVExchangeListViewModelFactoryImplementation : NSObject <IVVExchangeListViewModelFactory>

@property (nonatomic, strong) id<IVVCurrencyConverter> currencyConverter;

@end
