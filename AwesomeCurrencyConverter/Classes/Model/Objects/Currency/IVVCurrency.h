//
//  IVVCurrency.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "EKMappingProtocol.h"

#import "IVVCurrencyConstants.h"

@interface IVVCurrency : NSObject <EKMappingProtocol>

@property (nonatomic, assign) IVVCurrencyType currencyType;
@property (nonatomic, strong) NSDecimalNumber *currencyRate;

- (instancetype)initWithType:(IVVCurrencyType)type
                        rate:(NSDecimalNumber *)rate;

@end
