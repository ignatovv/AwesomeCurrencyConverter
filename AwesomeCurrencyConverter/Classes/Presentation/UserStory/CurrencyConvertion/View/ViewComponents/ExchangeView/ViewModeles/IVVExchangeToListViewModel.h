//
//  IVVExchangeViewModel.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVExchangeListViewModel.h"

#import "IVVExchangeCurrencyToViewModel.h"

@interface IVVExchangeToListViewModel : NSObject <IVVExchangeListViewModel>

@property (nonatomic, strong) NSArray<IVVExchangeCurrencyToViewModel *> *currencyViewModeles;

@end
