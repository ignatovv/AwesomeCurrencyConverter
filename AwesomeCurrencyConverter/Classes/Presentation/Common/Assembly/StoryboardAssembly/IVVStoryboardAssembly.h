//
//  IVVStoryboardAssembly.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Typhoon/Typhoon.h>

// Helpers
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@interface IVVStoryboardAssembly : TyphoonAssembly  <RamblerInitialAssembly>

- (UIStoryboard *)mainStoryboard;

@end
