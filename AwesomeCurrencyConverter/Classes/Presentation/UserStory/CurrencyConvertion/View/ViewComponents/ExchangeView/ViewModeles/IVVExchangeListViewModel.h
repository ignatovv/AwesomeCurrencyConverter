//
//  IVVExchangeListViewModel.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@protocol IVVDynamicViewModel;

@protocol IVVExchangeListViewModel <NSObject>

-(NSArray<IVVDynamicViewModel> *)currencyViewModeles;

@end
