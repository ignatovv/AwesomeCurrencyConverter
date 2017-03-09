//
//  IVVCoreComponentsAssemblyImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 08/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVCoreComponentsAssemblyImplementation.h"

// Storage
#import "IVVPresistentStoreImplementation.h"

// Client
#import "IVVClientImplementation.h"

// Parser
#import "IVVXMLParserImplementation.h"

// Scheduler
#import "IVVSchedulerImplementation.h"

// Constants
#import "IVVAPIConstants.h"

@implementation IVVCoreComponentsAssemblyImplementation

#pragma mark - Storage 

- (id<IVVPresistentStore>)presistentStore {
    return [TyphoonDefinition withClass:[IVVPresistentStoreImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeLazySingleton;
                          }];
}

#pragma mark - Scheduler 

- (id<IVVScheduler>)scheduler {
    return [TyphoonDefinition withClass:[IVVSchedulerImplementation class]];
}

#pragma mark - Client

- (id<IVVClient>)XMLCapableClient {
    return [TyphoonDefinition withClass:[IVVClientImplementation class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition useInitializer:@selector(initWithStringBaseUrl:responseSerializer:parser:)
                                              parameters:^(TyphoonMethod *initializer) {
                                                  definition.scope = TyphoonScopeLazySingleton;
                                                  
                                                  [initializer injectParameterWith:IVVAPIBaseURL];
                                                  [initializer injectParameterWith:[self XMLResponseSerializer]];
                                                  [initializer injectParameterWith:[self XMLParser]];
                                              }];
                          }];
}

- (AFHTTPResponseSerializer<AFURLResponseSerialization> *)XMLResponseSerializer {
    return [TyphoonDefinition withClass:[AFXMLParserResponseSerializer class]];
}

- (id<IVVParser>)XMLParser {
    return [TyphoonDefinition withClass:[IVVXMLParserImplementation class]];
}

@end
