//
//  IVVAPIConstants.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVAPIConstants.h"

#pragma mark - API endpoints

NSString * const IVVAPIBaseURL = @"https://www.ecb.europa.eu/";

NSString * const IVVCurrencyRatesURL = @"stats/eurofxref/eurofxref-daily.xml";

#pragma mark - API response keys

NSString * const IVVAPIPayloadKeyPath = @"Cube.Cube";
NSString * const IVVAPIDataKey = @"Cube";
