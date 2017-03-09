//
//  IVVClientImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVClientImplementation.h"

#import "IVVParser.h"

@interface IVVClientImplementation()

@property (nonatomic, strong) id<IVVParser> parser;

@end

@implementation IVVClientImplementation

- (instancetype)initWithStringBaseUrl:(NSString *)baseUrlString
                   responseSerializer:(AFHTTPResponseSerializer<AFURLResponseSerialization> *)responseSerializer
                               parser:(id<IVVParser>)parser{
    NSURL *baseUrl = [NSURL URLWithString:baseUrlString];
    
    if (self = [super initWithBaseURL:baseUrl]) {
        _parser = parser;
        self.responseSerializer = responseSerializer;
    }
    
    return self;
}

- (void)getWithEndpoint:(NSString *)endpoint
             parameters:(NSDictionary *)parameters
             completion:(IVVClientResponse)completionBlock {
    [self GET:endpoint
   parameters:parameters
      success:^(NSURLSessionDataTask *task, id responseObject) {
          NSDictionary *parsedResponse = [self.parser parseResponseObject:responseObject];
          
          dispatch_async(dispatch_get_main_queue(), ^{
              completionBlock(parsedResponse, nil);
          });
      }
      failure:^(NSURLSessionDataTask *task, NSError *error) {
          dispatch_async(dispatch_get_main_queue(), ^{
              completionBlock(nil, error);
          });
      }];
}

- (void)cancelAllHTTPOperationsWithEndpoint:(NSString *)endpoint {
    for (NSURLSessionTask *task in self.tasks) {
        NSRange range = [[[[task currentRequest] URL] absoluteString] rangeOfString:endpoint];
        if (range.location != NSNotFound) {
            [task cancel];
        }
    }
}

@end
