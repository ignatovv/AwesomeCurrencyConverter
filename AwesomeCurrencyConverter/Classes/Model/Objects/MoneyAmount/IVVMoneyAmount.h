//
//  IVVMoneyAmountObject.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConstants.h"

@interface IVVMoneyAmountObject : NSObject

@property (nonatomic, assign, readonly) IVVCurrencyType currencyType;
@property (nonatomic, strong, readonly) NSDecimalNumber *moneyAmount;

- (instancetype)initWithCurrencyType:(IVVCurrencyType)currencyType
                         moneyAmount:(NSDecimalNumber *)moneyAmount;

@end
