//
//  NSDecimalNumber+IVVUtilities.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDecimalNumber(IVVUtilities)

+ (NSDecimalNumber *)ivv_decimalNumberWithString:(NSString *)numberValue;

- (NSString *)ivv_stringWithRoundedDecimals:(short)scale;

@end
