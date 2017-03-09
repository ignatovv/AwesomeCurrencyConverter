//
//  IVVMoneyStorage.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConstants.h"

@protocol IVVMoneyStorage <NSObject>

- (BOOL)addMoney:(NSDecimalNumber *)amount
     forCurrency:(IVVCurrencyType)currency;

- (BOOL)subtractMoney:(NSDecimalNumber *)amount
          forCurrency:(IVVCurrencyType)currency;

- (NSDecimalNumber *)getMoneyAmountForCurrency:(IVVCurrencyType)currency;

// inital initialization

- (void)setMoneyAmount:(NSDecimalNumber *)amount
           forCurrency:(IVVCurrencyType)currency;

@end
