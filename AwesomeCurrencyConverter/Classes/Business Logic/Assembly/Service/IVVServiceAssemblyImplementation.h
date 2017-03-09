//
//  IVVServiceAssembly.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "IVVServiceAssembly.h"

// Helpers
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol IVVHelperAssembly, IVVCoreComponentsAssembly;
@class IVVStoryboardAssembly;

@interface IVVServiceAssemblyImplementation : TyphoonAssembly <IVVServiceAssembly, RamblerInitialAssembly>

@property (nonatomic, strong) IVVStoryboardAssembly *storyboardAssembly;
@property (nonatomic, strong) TyphoonAssembly<IVVHelperAssembly> *helperAssembly;
@property (nonatomic, strong) TyphoonAssembly<IVVCoreComponentsAssembly> *coreAssembly;

@end
