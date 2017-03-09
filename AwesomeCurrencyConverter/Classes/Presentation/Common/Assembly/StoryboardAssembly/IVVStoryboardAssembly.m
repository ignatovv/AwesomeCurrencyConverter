//
//  IVVStoryboardAssembly.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVStoryboardAssembly.h"

// Константы
#import "IVVPresentationConstants.h"

@implementation IVVStoryboardAssembly

- (UIStoryboard *)mainStoryboard {
    return [self storyboardWithName:IVVMainUserStoryName];
}

#pragma mark - Вспомогательные методы

- (UIStoryboard *)storyboardWithName:(NSString *)storyboardName {
    return [TyphoonDefinition withClass:[TyphoonStoryboard class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(storyboardWithName:factory:bundle:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  [initializer injectParameterWith:storyboardName];
                                                  [initializer injectParameterWith:self];
                                                  [initializer injectParameterWith:[NSBundle bundleForClass:[self class]]];
                                              }];
                          }];
}

@end
