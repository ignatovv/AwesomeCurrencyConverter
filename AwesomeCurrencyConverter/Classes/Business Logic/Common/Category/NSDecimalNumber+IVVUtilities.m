//
//  NSDecimalNumber+IVVUtilities.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "NSDecimalNumber+IVVUtilities.h"

@implementation NSDecimalNumber(IVVUtilities)

+ (NSDecimalNumber *)ivv_decimalNumberWithString:(NSString *)numberValue {
    if ([numberValue isEqualToString:@""]) {
        numberValue = @"0";
    }
    return [self decimalNumberWithString:numberValue];
}

- (NSString *)ivv_stringWithRoundedDecimals:(short)scale {
    NSDecimalNumberHandler *behavior = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                              scale:scale
                                                                                   raiseOnExactness:NO
                                                                                    raiseOnOverflow:NO
                                                                                   raiseOnUnderflow:NO
                                                                                raiseOnDivideByZero:NO];
    
    NSDecimalNumber *roundedNumber = [self decimalNumberByRoundingAccordingToBehavior:behavior];
    return [roundedNumber stringValue];
}

@end
