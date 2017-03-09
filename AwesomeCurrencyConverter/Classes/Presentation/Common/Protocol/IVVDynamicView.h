//
//  IVVDynamicView.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@protocol IVVDynamicViewModel;

/**
  Dynamic view can be loaded dynamicly from the class provided by the the view model
 */
@protocol IVVDynamicView <NSObject>

- (void)configWithViewModel:(id<IVVDynamicViewModel>)viewModel;

@end
