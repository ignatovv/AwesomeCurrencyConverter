//
//  IVVClientImplementation.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "AFHTTPSessionManager.h"

#import "IVVClient.h"

@protocol IVVParser;

@interface IVVClientImplementation : AFHTTPSessionManager <IVVClient>

- (instancetype)initWithStringBaseUrl:(NSString *)baseUrl
                   responseSerializer:(AFHTTPResponseSerializer *)responseSerializer
                               parser:(id<IVVParser>) parser;

@end
