//
//  IVVStartUpManager.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVStartUpManager.h"

@class IVVWelocmeAssembly, IVVStoryboardAssembly;

@interface IVVStartUpManagerImplementation : NSObject <IVVStartUpManager>

@property (nonatomic, strong) IVVStoryboardAssembly *storyboardAssembly;

@end
