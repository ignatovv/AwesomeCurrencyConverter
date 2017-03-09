//
//  IVVExchangeCurrencyFromView.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "IVVDynamicView.h"

@interface IVVExchangeCurrencyFromView : UIView <IVVDynamicView>

@property (strong, nonatomic) IBOutlet UIView *view;

@property (weak, nonatomic) IBOutlet UILabel *exchangeAmountLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *currencyAmountLabel;

@end
