//
//  IVVCurrencyTransacrionModel.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConstants.h"
#import "IVVModelConstants.h"

@interface IVVCurrencyTransacrionModel : NSObject

@property (nonatomic, strong) NSDecimalNumber *exchangeAmount;
@property (nonatomic, assign) IVVCurrencyType currencyTypeFrom;
@property (nonatomic, assign) IVVCurrencyType currencyTypeTo;
@property (nonatomic, assign) BOOL transactionValid;

@property (nonatomic, strong) IVVCurrencyRates currencyRates;
@property (nonatomic, strong) IVVMoneyAmounts moneyAmounts;

@end
