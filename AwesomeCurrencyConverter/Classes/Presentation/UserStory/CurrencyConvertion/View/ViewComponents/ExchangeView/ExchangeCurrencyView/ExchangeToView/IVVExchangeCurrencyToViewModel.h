//
//  IVVExchangeCurrencyFromViewModel.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

// Protocols
#import "IVVDynamicViewModel.h"

// Constants
#import "IVVExchangeCurrencyConstants.h"
#import "IVVCurrencyConstants.h"

NS_ASSUME_NONNULL_BEGIN

@interface IVVExchangeCurrencyToViewModel : NSObject <IVVDynamicViewModel>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *currencyAmount;
@property (nonatomic, copy) NSString *exchangeRate;
@property (nonatomic, copy) NSString *exchangeAmount;
@property (nonatomic, assign) IVVExchangeCurrencyFromViewModelTransferDirection transferDirection;
@property (nonatomic, assign) IVVCurrencyType currencyType;

@end

NS_ASSUME_NONNULL_END
