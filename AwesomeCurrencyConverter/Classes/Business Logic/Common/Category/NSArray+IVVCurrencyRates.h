//
//  NSArray+IVVCurrencyRates.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConstants.h"

@class IVVCurrencyObject;

@interface NSArray<IVVCurrencyObject>(IVVCurrencyRates)

- (IVVCurrencyObject)currecnyRateWithCurrency:(IVVCurrencyType)type;

@end
