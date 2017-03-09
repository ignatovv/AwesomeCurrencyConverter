//
//  IVVCurrencyConvertionAssembly.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Typhoon/Typhoon.h>

// Helpers
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class IVVStoryboardAssembly;
@protocol IVVServiceAssembly, IVVHelperAssembly;

@interface IVVCurrencyConvertionAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property (nonatomic, strong, readonly) IVVStoryboardAssembly *storyboardAssembly;
@property (nonatomic, strong, readonly) TyphoonAssembly<IVVServiceAssembly> *serviceAssembly;
@property (nonatomic, strong, readonly) TyphoonAssembly<IVVHelperAssembly> *helperAssembly;

- (UIViewController *)viewCurrencyConvertionModule;

@end
