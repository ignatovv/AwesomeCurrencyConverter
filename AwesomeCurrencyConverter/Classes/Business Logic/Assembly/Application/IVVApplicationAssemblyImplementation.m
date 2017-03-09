//
//  IVVApplicationAssembly.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVApplicationAssemblyImplementation.h"

// AppDelegate
#import "IVVAppDelegate.h"

// Factories
#import "IVVServiceAssembly.h"

@implementation IVVApplicationAssemblyImplementation

- (IVVAppDelegate *)appDelegate {
    return [TyphoonDefinition withClass:[IVVAppDelegate class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(startupService)
                                                    with:[self.serviceAssebmbly startupService]];
                          }];
}

@end
