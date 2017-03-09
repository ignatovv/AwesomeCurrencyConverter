//
//  IVVCurrencyConvertionViewModel.h
//  AwesomeCurrencyConverter
//
//  Created by Gumo on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IVVExchangeViewModel;

@interface IVVCurrencyConvertionViewModel : NSObject

@property (nonatomic, strong) IVVExchangeViewModel *exchangeToViewModel;
@property (nonatomic, strong) IVVExchangeViewModel *exchangeFromViewModel;

@property (nonatomic, assign) BOOL exchangeEnambled;
#warning todo
@property (nonatomic, assign) BOOL test;

@end
