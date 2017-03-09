//
//  IVVMapper.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

@class EKObjectMapping;

@protocol IVVMapper <NSObject>

- (NSArray *)arrayOfObjectsFromExternalRepresentation:(id)responseObject
                                               forKey:(NSString *)key
                                          withMapping:(EKObjectMapping *)mapping;

@end
