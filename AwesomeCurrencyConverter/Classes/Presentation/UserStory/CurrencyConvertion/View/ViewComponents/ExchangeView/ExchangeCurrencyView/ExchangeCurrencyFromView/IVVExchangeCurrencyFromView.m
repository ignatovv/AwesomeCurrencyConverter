//
//  IVVExchangeCurrencyFromView.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVExchangeCurrencyFromView.h"

// ViewModel
#import "IVVExchangeCurrencyFromViewModel.h"

@implementation IVVExchangeCurrencyFromView

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                      owner:self
                                    options:nil];
        self.view.frame = self.bounds;
        self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth  | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.view];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public methods 

- (void)configWithViewModel:(IVVExchangeCurrencyFromViewModel *)viewModel {
    self.currencyNameLabel.text = viewModel.name;
    self.currencyAmountLabel.text = viewModel.currencyAmount;
    
    NSString *directionSign = [self directionSignForDirection:viewModel.transferDirection];
    self.exchangeAmountLabel.text = [NSString stringWithFormat:@"%@ %@",directionSign, viewModel.exchangeAmount];
    
    self.currencyAmountLabel.textColor = viewModel.errorState ? [UIColor redColor] : [UIColor whiteColor];
}

- (NSString *)directionSignForDirection:(IVVExchangeCurrencyFromViewModelTransferDirection)direction {
    switch (direction) {
        case IVVExchangeCurrencyFromViewModelTransferDirectionNegative:
            return @"-";
        case IVVExchangeCurrencyFromViewModelTransferDirectionPositive:
            return @"+";
    }
    
    return nil;
}

@end
