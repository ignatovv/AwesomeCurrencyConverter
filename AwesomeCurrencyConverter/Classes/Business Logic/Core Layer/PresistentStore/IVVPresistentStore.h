//
//  IVVPresistentStore.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 06/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@protocol IVVPresistentStore <NSObject>

- (id)getObjectForKey:(NSString *)key;
- (void)setObject:(id)object
           forKey:(NSString *)key;

@end
