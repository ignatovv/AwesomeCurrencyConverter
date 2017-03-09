//
//  IVVCurrencyConvertionDataDisplayManager.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCurrencyConvertionDataDisplayManager.h"

// View
#import "IVVExchangeView.h"
#import "iCarousel.h"

// ViewModeles
#import "IVVExchangeToListViewModel.h"
#import "IVVExchangeFromListViewModel.h"

// DynamicView
#import "IVVDynamicViewModel.h"
#import "IVVDynamicView.h"

@interface IVVCurrencyConvertionDataDisplayManager() <IVVExchangeViewDelegate, IVVExchangeViewDataSource>

@property (nonatomic, strong) IVVExchangeView *exchangeToView;
@property (nonatomic, strong) IVVExchangeView *exchangeFromView;

@property (nonatomic, strong) IVVExchangeToListViewModel *exchangeToViewModel;
@property (nonatomic, strong) IVVExchangeFromListViewModel *exchangeFromViewModel;

@end

@implementation IVVCurrencyConvertionDataDisplayManager

#pragma mark - Public methods

- (void)configWithFromView:(IVVExchangeView *)fromView
             fromViewModel:(IVVExchangeFromListViewModel *)fromViewModel
                    toView:(IVVExchangeView *)toView
               toViewModel:(IVVExchangeToListViewModel *)toViewModel {
    self.exchangeFromView = fromView;
    self.exchangeToView = toView;
    self.exchangeFromViewModel = fromViewModel;
    self.exchangeToViewModel = toViewModel;

}

- (id<IVVExchangeViewDelegate>)delegateForExchangeView:(IVVExchangeView *)exchangeView {
    return self;
}

- (id<IVVExchangeViewDataSource>)dataSourceForExchangeView:(IVVExchangeView *)exchangeView {
    return self;
}

#pragma mark - IVVExchangeViewDelegate

- (void)exchangeView:(IVVExchangeView *)exchangeView currentIndexDidChange:(NSInteger)index {
    BOOL exchangeTo = exchangeView == self.exchangeToView;
    IVVCurrencyType currencyType = [self extractCurrencyFromViewModel:exchangeTo
                                                              atIndex:index];
    [self.delegate currencyDidChange:currencyType
                    forConvertToView:exchangeTo];
}

#pragma mark - IVVExchangeViewDataSouce

- (NSInteger)numberOfItemsInExchangeView:(IVVExchangeView *)exchangeView {
    return [[[self listViewModelForView:exchangeView] currencyViewModeles] count];
}

- (UIView *)exchangeView:(IVVExchangeView *)exchangeView
      viewForItemAtIndex:(NSInteger)index
             reusingView:(UIView<IVVDynamicView> *)view {
    id<IVVExchangeListViewModel> listViewModel = [self listViewModelForView:exchangeView];
    id<IVVDynamicViewModel> viewModel = [listViewModel currencyViewModeles][index];
    
    if (view == nil) {
        view = [[[viewModel viewClass] alloc] initWithFrame:exchangeView.carouserlView.bounds];
    }
    
    [view configWithViewModel:viewModel];
    
    return view;
}

#pragma mark - Private methods

- (id<IVVExchangeListViewModel>)listViewModelForView:(IVVExchangeView *)exchangeView {
    if (exchangeView == self.exchangeToView) {
        return self.exchangeToViewModel;
    } else if(exchangeView == self.exchangeFromView) {
        return self.exchangeFromViewModel;
    }
    
    return nil;
}

- (IVVCurrencyType)extractCurrencyFromViewModel:(BOOL)toViewModel
                                        atIndex:(NSInteger)index {
    if (toViewModel) {
        return self.exchangeToViewModel.currencyViewModeles[index].currencyType;
    }
    
    return self.exchangeFromViewModel.currencyViewModeles[index].currencyType;
}

@end
