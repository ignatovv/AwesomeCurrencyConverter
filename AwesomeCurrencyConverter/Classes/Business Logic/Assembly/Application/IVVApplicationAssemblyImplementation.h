//
//  IVVApplicationAssembly.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "TyphoonAssembly.h"
#import "IVVApplicationAssembly.h"

// Helpers
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol IVVServiceAssembly;

@interface IVVApplicationAssemblyImplementation : TyphoonAssembly <IVVApplicationAssembly,RamblerInitialAssembly>

@property (nonatomic, strong) TyphoonAssembly <IVVServiceAssembly> *serviceAssebmbly;

@end
