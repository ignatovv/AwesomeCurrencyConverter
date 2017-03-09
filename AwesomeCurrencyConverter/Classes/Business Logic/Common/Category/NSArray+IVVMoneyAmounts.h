//
//  NSArray+IVVMoneyAmounts.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConstants.h"

@class IVVMoneyAmount;

@interface NSArray<IVVMoneyAmount>(IVVMoneyAmounts)

- (IVVMoneyAmount)moneyAmountWithCurrency:(IVVCurrencyType)type;

@end
