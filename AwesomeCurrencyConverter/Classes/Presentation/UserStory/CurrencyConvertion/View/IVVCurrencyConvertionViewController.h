//
//  IVVCurrencyConvertionViewController.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IVVCurrencyConvertionViewInput.h"

@protocol IVVCurrencyConvertionViewOutput;
@class IVVExchangeView;
@class IVVCurrencyConvertionDataDisplayManager;

@interface IVVCurrencyConvertionViewController : UIViewController <IVVCurrencyConvertionViewInput>

@property (nonatomic, strong) id<IVVCurrencyConvertionViewOutput> output;
@property (nonatomic, strong) IVVCurrencyConvertionDataDisplayManager *dataDisplayManager;

@property (weak, nonatomic) IBOutlet IVVExchangeView *convertFromView;
@property (weak, nonatomic) IBOutlet IVVExchangeView *convertToView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *exchangeButton;

// proxy text field used to keep keyboard onscreen
@property (weak, nonatomic) IBOutlet UITextField *textFieldProxy;

@end

