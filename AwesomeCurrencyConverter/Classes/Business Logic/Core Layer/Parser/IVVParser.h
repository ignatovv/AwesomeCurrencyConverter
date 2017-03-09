//
//  IVVXMLParser.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IVVParser <NSObject>

- (NSDictionary *)parseResponseObject:(id)responseObject;

@end
