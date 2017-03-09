//
//  IVVCoreComponentsAssembly.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@protocol IVVClient;
@protocol IVVPresistentStore;
@protocol IVVScheduler;

@protocol IVVCoreComponentsAssembly <NSObject>

- (id<IVVClient>)XMLCapableClient;

- (id<IVVPresistentStore>)presistentStore;

- (id<IVVScheduler>)scheduler;


@end
