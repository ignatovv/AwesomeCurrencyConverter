//
//  IVVStartUpManager.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVStartUpManagerImplementation.h"

// Factories
#import "IVVStoryboardAssembly.h"

static NSString * const IVVInitialViewControllerIdentifier = @"IVVWelocmeViewController";

@interface IVVStartUpManagerImplementation()

@property (nonatomic, strong) UINavigationController *navigationController;

@end

@implementation IVVStartUpManagerImplementation

- (BOOL)startUpApplication:(UIApplication *)application
               withOptions:(NSDictionary *)options {
    self.navigationController = (UINavigationController *)application.delegate.window.rootViewController;
    
    UIViewController *startUpViewController = [[self.storyboardAssembly mainStoryboard] instantiateViewControllerWithIdentifier:IVVInitialViewControllerIdentifier];
    [self.navigationController setViewControllers:@[startUpViewController]
                                         animated:NO];
    
    return YES;
}

@end
