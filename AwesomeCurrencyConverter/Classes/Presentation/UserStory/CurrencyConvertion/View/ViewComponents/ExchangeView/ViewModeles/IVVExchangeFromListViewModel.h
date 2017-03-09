//
//  IVVExchangeFromListViewModel.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "IVVExchangeListViewModel.h"
#import "IVVExchangeCurrencyFromViewModel.h"

@interface IVVExchangeFromListViewModel : NSObject <IVVExchangeListViewModel>

@property (nonatomic, strong) NSArray<IVVExchangeCurrencyFromViewModel *> *currencyViewModeles;

@end
