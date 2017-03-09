//
//  IVVExchangeView.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVExchangeView.h"

// Views
#import "iCarousel.h"

// ViewModel
#import "IVVExchangeListViewModel.h"

@interface IVVExchangeView () <iCarouselDataSource, iCarouselDelegate>

@property (nonatomic, strong) id<IVVExchangeListViewModel> viewModel;

@end

@implementation IVVExchangeView

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
    [self setupView];
}

#pragma mark - Public methods 

- (void)reloadData {
    NSInteger numberOfItems = [self.dataSource numberOfItemsInExchangeView:self];
    self.pageControll.numberOfPages = numberOfItems;
    [self.carouserlView reloadData];
}

#pragma mark - Setup

- (void)setupView {
    self.carouserlView.pagingEnabled = YES;
    self.carouserlView.type = iCarouselTypeLinear;
    
    self.carouserlView.delegate = self;
    self.carouserlView.dataSource = self;
}

#pragma mark - iCarouselDataSource

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel {
    return [self.dataSource numberOfItemsInExchangeView:self];
}

- (UIView *)carousel:(iCarousel *)carousel
  viewForItemAtIndex:(NSInteger)index
         reusingView:(nullable UIView *)view {
        return [self.dataSource exchangeView:self
                          viewForItemAtIndex:index
                                 reusingView:view];
}

#pragma mark - iCarouselDelegate

- (CGFloat)carouselItemWidth:(iCarousel *)carousel {
    return CGRectGetWidth(self.view.frame);
}

- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel {
    NSInteger currentIndex = carousel.currentItemIndex;
    self.pageControll.currentPage = currentIndex;
    
    [self.delegate exchangeView:self
           currentIndexDidChange:currentIndex];
}

- (CGFloat)carousel:(iCarousel *)carousel
     valueForOption:(iCarouselOption)option
        withDefault:(CGFloat)value
{
    switch (option) {
        case iCarouselOptionWrap:
            return 1.;
            break;
            
        default:
            return value;
    }
}

@end
