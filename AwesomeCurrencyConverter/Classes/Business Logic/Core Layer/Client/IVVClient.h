//
//  Header.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

typedef void(^IVVClientResponse)(NSDictionary *responseObject, NSError *error);

@protocol IVVClient <NSObject>

- (void)getWithEndpoint:(NSString *)endpoint
             parameters:(NSDictionary *)parameters
             completion:(IVVClientResponse)completion;

- (void)cancelAllHTTPOperationsWithEndpoint:(NSString *)endpoint;

@end
