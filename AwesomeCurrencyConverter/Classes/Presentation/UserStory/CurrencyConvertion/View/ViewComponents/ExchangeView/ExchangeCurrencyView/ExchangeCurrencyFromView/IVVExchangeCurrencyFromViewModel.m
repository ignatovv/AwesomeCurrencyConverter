//
//  IVVExchangeCurrencyFromViewModel.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVExchangeCurrencyFromViewModel.h"

#import "IVVExchangeCurrencyFromView.h"

@implementation IVVExchangeCurrencyFromViewModel

#pragma mark - IVVDynamicViewModel

- (Class)viewClass {
    return [IVVExchangeCurrencyFromView class];
}

@end
