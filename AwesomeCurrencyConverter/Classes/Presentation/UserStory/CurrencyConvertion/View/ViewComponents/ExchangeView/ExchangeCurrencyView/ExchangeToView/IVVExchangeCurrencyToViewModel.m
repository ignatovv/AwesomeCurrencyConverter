//
//  IVVExchangeCurrencyFromViewModel.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVExchangeCurrencyToViewModel.h"

#import "IVVExchangeCurrencyToView.h"

@implementation IVVExchangeCurrencyToViewModel

#pragma mark - IVVDynamicViewModel

- (Class)viewClass {
    return [IVVExchangeCurrencyToView class];
}

@end
