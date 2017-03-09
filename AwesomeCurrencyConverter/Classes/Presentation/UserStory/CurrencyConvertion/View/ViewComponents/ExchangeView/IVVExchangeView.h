//
//  IVVExchangeView.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class iCarousel, IVVExchangeView;
@protocol IVVExchangeListViewModel;

@protocol IVVExchangeViewDelegate <NSObject>

- (void)exchangeView:(IVVExchangeView *)exchangeView currentIndexDidChange:(NSInteger)index;

@end

@protocol IVVExchangeViewDataSource <NSObject>

- (NSInteger)numberOfItemsInExchangeView:(IVVExchangeView *)exchangeView;

- (UIView *)exchangeView:(IVVExchangeView *)exchangeView
      viewForItemAtIndex:(NSInteger)index
             reusingView:(UIView *)view;

@end

@interface IVVExchangeView : UIView

@property (nonatomic, weak) id<IVVExchangeViewDelegate> delegate;
@property (nonatomic, weak) id<IVVExchangeViewDataSource> dataSource;

@property (nonatomic, strong) IBOutlet UIView *view;
@property (nonatomic, weak) IBOutlet iCarousel *carouserlView;
@property (nonatomic, weak) IBOutlet UIPageControl *pageControll;

- (void)reloadData;

@end
