 //
//  AppDelegate.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVAppDelegate.h"

// Services 
#include "IVVStartUpManager.h"

// Typhoon
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@interface IVVAppDelegate ()

@end

@implementation IVVAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    return [self.startupService startUpApplication:application
                                       withOptions:launchOptions];
}

#pragma mark - Typhoon initial assemblies

- (NSArray *)initialAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    NSArray *initialAssemblies = [collector collectInitialAssemblyClasses];
    return initialAssemblies;
}

@end
