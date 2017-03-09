//
//  IVVCurrencyRatesService.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVServiceConstants.h"

@protocol IVVCurrencyRatesService <NSObject>

- (void)getCurrencyRatesWithSucces:(nonnull IVVCurrencyRatesBlock)succes
                           failure:(nullable IVVErrorBlock)failure;

@end
