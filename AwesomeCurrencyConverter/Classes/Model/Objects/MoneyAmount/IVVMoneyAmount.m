//
//  IVVMoneyAmount.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVMoneyAmount.h"

#import "IVVModelConstants.h"

@implementation IVVMoneyAmount

- (instancetype)initWithCurrencyType:(IVVCurrencyType)currencyType
                         moneyAmount:(NSDecimalNumber *)moneyAmount {
    if (self = [super init]) {
        _currencyType = currencyType;
        _moneyAmount = moneyAmount;
    }
    
    return self;
}

#pragma mark - Equality

- (BOOL)isEqual:(id)object {
    if (object == self)
        return YES;
    
    if (!object || ![[object class] isEqual:[self class]])
        return NO;
    
    return [self isEqualToObject:object];
}

- (BOOL)isEqualToObject:(IVVMoneyAmount *)object {
    if (self == object)
        return YES;
    
    if (object == nil)
        return NO;
    
    if (self.moneyAmount != object.moneyAmount && ![self.moneyAmount isEqual:object.moneyAmount])
        return NO;
    
    if (self.currencyType != object.currencyType)
        return NO;
    
    return YES;
}

- (NSUInteger)hash {
    NSUInteger hash = [self.moneyAmount hash];
    hash = hash * IVVHashPrimeNumber + self.currencyType;
    return hash;
}

@end
