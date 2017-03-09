//
//  IVVStartUpManager.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol IVVStartUpManager <NSObject>

- (BOOL)startUpApplication:(UIApplication *)application
               withOptions:(NSDictionary *)options;

@end
