//
//  IVVCurrency.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrency.h"

static const NSUInteger IVVHashPrimeNumber = 31u;

@implementation IVVCurrency

#pragma mark - Public methods 

- (instancetype)initWithType:(IVVCurrencyType)type
                        rate:(NSDecimalNumber *)rate {
    if (self = [super init]) {
        _currencyType = type;
        _currencyRate = rate;
    }
    
    return self;
}

#pragma mark - EKMappingProtocol

+ (EKObjectMapping *)objectMapping {
    EKObjectMapping *mapping = [[EKObjectMapping alloc] initWithObjectClass:[self class]];
    
    [mapping mapKeyPath:@"rate"
             toProperty:NSStringFromSelector(@selector(currencyRate))
         withValueBlock:^id(NSString *key, NSString *value) {
             return [NSDecimalNumber decimalNumberWithString:value];
         }];
    
    [mapping mapKeyPath:@"currency"
             toProperty:NSStringFromSelector(@selector(currencyType))
         withValueBlock:^id(NSString *key, id value) {
             NSNumber *currencyType = [self currencyTypeWithCurrency:value];
             return currencyType;
         }];
    
    return mapping;
}

+ (NSNumber *)currencyTypeWithCurrency:(NSString *)currency {
    NSNumber *currencyType = [[self currencyMappingDictionary] valueForKey:currency];
    if (currencyType == nil) {
        currencyType = @(IVVCurrencyTypeUnknown);
    }
    
    return currencyType;
}

+ (NSDictionary *)currencyMappingDictionary {
    return @{@"USD" : @(IVVCurrencyTypeUSD),
             @"GBP" : @(IVVCurrencyTypeGBP)};
}

#pragma mark - Equality

- (BOOL)isEqual:(id)object {
    if (object == self)
        return YES;
    
    if (!object || ![[object class] isEqual:[self class]])
        return NO;
    
    return [self isEqualToObject:object];
}

- (BOOL)isEqualToObject:(IVVCurrency *)object {
    if (self == object)
        return YES;
    
    if (object == nil)
        return NO;
    
    if (self.currencyRate != object.currencyRate && ![self.currencyRate isEqual:object.currencyRate])
        return NO;
    
    if (self.currencyType != object.currencyType)
        return NO;
    
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = [self.currencyRate hash];
    hash = hash * IVVHashPrimeNumber + self.currencyType;
    return hash;
}


@end
