//
//  IVVMoneyStorageImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVMoneyStorage.h"

@protocol IVVPresistentStore;

@interface IVVMoneyStorageImplementation : NSObject <IVVMoneyStorage>

@property (nonatomic, strong) id<IVVPresistentStore> presistentStore;

@end
