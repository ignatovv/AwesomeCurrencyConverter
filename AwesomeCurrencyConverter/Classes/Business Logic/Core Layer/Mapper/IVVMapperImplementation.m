//
//  IVVMapperImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVMapperImplementation.h"

#import <EasyMapping/EasyMapping.h>

@implementation IVVMapperImplementation

- (NSArray *)arrayOfObjectsFromExternalRepresentation:(id)responseObject
                                               forKey:(NSString *)key
                                          withMapping:(EKObjectMapping *)mapping {
    NSParameterAssert(responseObject);
    NSParameterAssert(key);
    NSParameterAssert(mapping);
    
    NSArray *responseArray = responseObject[key];
    NSArray *objects = [EKMapper arrayOfObjectsFromExternalRepresentation:responseArray
                                                              withMapping:mapping];
    
    return objects;
}


@end
