//
//  IVVCurrencyConvertionDataDisplayManager.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVCurrencyConstants.h"

@protocol IVVExchangeViewDelegate, IVVExchangeViewDataSource;
@class IVVExchangeView;
@class IVVExchangeFromListViewModel, IVVExchangeToListViewModel;

@protocol IVVCurrencyConvertionDataDisplayManagerDelegate <NSObject>

- (void)currencyDidChange:(IVVCurrencyType)currencytype
         forConvertToView:(BOOL)convertTo;

@end

/**
 Manges exchange view delegate and data source
 */
@interface IVVCurrencyConvertionDataDisplayManager : NSObject

@property (nonatomic, weak) id<IVVCurrencyConvertionDataDisplayManagerDelegate>delegate;

- (void)configWithFromView:(IVVExchangeView *)fromView
             fromViewModel:(IVVExchangeFromListViewModel *)fromViewModel
                    toView:(IVVExchangeView *)toView
               toViewModel:(IVVExchangeToListViewModel *)toViewModel;

- (id<IVVExchangeViewDelegate>)delegateForExchangeView:(IVVExchangeView *)exchangeView;

- (id<IVVExchangeViewDataSource>)dataSourceForExchangeView:(IVVExchangeView *)exchangeView;

@end
