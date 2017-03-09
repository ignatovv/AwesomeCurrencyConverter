//
//  IVVCurrencyConvertionViewModel.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class IVVExchangeToListViewModel, IVVExchangeFromListViewModel;

@interface IVVCurrencyConvertionViewModel : NSObject

@property (nonatomic, strong) IVVExchangeToListViewModel *exchangeToViewModel;
@property (nonatomic, strong) IVVExchangeFromListViewModel *exchangeFromViewModel;

@property (nonatomic, assign) BOOL exchangeEnambled;

@end
