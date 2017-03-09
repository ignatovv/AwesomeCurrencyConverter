//
//  IVVMoneyTransferServiceImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVMoneyTransferService.h"

@protocol IVVMoneyStorage;
@protocol IVVCurrencyConverter;

@interface IVVMoneyTransferServiceImplementation : NSObject <IVVMoneyTransferService>

@property (nonatomic, strong) id<IVVMoneyStorage> moneyStorage;
@property (nonatomic, strong) id<IVVCurrencyConverter> currencyConverter;

@end
