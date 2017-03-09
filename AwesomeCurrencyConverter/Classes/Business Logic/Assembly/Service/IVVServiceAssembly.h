//
//  IVVServiceAssembly.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@protocol IVVStartUpManager, IVVCurrencyRatesService, IVVMoneyTransferService;
@protocol IVVMoneyStorage;

@protocol IVVServiceAssembly <NSObject>

- (id<IVVStartUpManager>)startupService;

- (id<IVVCurrencyRatesService>)currencyRatesService;

- (id<IVVMoneyTransferService>)moneyTransferService;

@end
