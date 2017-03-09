//
//  IVVHelperAssemblyImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "IVVHelperAssembly.h"

// Helpers
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol IVVServiceAssembly, IVVCoreComponentsAssembly;

@interface IVVHelperAssemblyImplementationImplementation : TyphoonAssembly <RamblerInitialAssembly, IVVHelperAssembly>

@property (nonatomic, strong, readonly) TyphoonAssembly<IVVServiceAssembly> *serviceAssembly;
@property (nonatomic, strong, readonly) TyphoonAssembly<IVVCoreComponentsAssembly> *coreAssembly;

@end
