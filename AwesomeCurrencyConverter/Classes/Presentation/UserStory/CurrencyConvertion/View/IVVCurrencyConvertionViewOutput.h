//
//  Output.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//
#import <Foundation/Foundation.h>

#import "IVVCurrencyConstants.h"

@protocol IVVCurrencyConvertionViewOutput <NSObject>

- (void)didTriggerViewDidLoadEvent;

- (void)didTriggerViewWillDisappearEvent;

- (void)exchangeTextDidChange:(NSString *)exchangeText;

- (void)exchangeCurrencyDidChange:(IVVCurrencyType)currencyType
                        convertTo:(BOOL)convertTo;

- (void)exchangeInitiated;

@end
