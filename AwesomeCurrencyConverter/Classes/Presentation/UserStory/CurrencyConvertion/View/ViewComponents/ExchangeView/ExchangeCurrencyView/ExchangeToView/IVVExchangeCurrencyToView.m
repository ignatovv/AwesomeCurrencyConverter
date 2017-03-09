//
//  IVVExchangeCurrencyFromView.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVExchangeCurrencyToView.h"

// ViewModel
#import "IVVExchangeCurrencyToViewModel.h"

@implementation IVVExchangeCurrencyToView

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class])
                                      owner:self
                                    options:nil];
        self.view.frame = self.bounds;
        [self addSubview:self.view];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

#pragma mark - Public methods 

- (void)configWithViewModel:(IVVExchangeCurrencyToViewModel *)viewModel {
    self.currencyNameLabel.text = viewModel.name;
    self.currencyAmountLabel.text = viewModel.currencyAmount;
    self.currencyRateLabel.text = viewModel.exchangeRate;
    
    NSString *directionSign = [self directionSignForDirection:viewModel.transferDirection];
    self.currencyExchangeLabel.text = [NSString stringWithFormat:@"%@ %@",directionSign, viewModel.exchangeAmount];
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
