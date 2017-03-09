//
//  AppDelegate.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IVVStartUpManager;

@interface IVVAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;

@property (nonatomic, strong) id<IVVStartUpManager> startupService;

@end

