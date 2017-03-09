//
//  IVVServiceConstants.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVModelConstants.h"

@class IVVCurrency;

typedef void (^IVVSuccessBlock)(void);
typedef void (^IVVErrorBlock)(NSError *error);
typedef void (^IVVCurrencyRatesBlock)(IVVCurrencyRates currencyRates);
