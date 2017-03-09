//
//  IVVCurrencyRatesServiceMapper.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVModelConstants.h"

@class IVVCurrencyObject;

@protocol IVVCurrencyRatesServiceMapper <NSObject>

- (IVVCurrencyRates)mapCurrencyRatesFromResponseObject:(id)responseObject;

@end
