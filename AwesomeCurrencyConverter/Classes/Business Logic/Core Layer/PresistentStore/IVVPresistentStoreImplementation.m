//
//  IVVPresistentStoreImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVPresistentStoreImplementation.h"

@implementation IVVPresistentStoreImplementation

- (id)getObjectForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

- (void)setObject:(id)object
           forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:object
                                              forKey:key];
}

@end
