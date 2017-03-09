//
//  IVVCurrencyConvertionViewControllerInput.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@class IVVCurrencyConvertionViewModel;

@protocol IVVCurrencyConvertionViewInput <NSObject>

- (void)setupInitialState;

- (void)configWithViewModel:(IVVCurrencyConvertionViewModel *)viewModel;

- (void)purgeText;

@end
