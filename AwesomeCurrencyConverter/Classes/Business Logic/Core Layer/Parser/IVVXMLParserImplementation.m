//
//  IVVXMLParserImplementation.m
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 04/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

#import "IVVXMLParserImplementation.h"

#import "XMLDictionary.h"

@implementation IVVXMLParserImplementation

- (NSDictionary *)parseResponseObject:(id)responseObject {
    NSAssert([responseObject isKindOfClass:[NSXMLParser class]], @"response object must me NSXMLParser class");
    
    XMLDictionaryParser *parser = [XMLDictionaryParser sharedInstance];
    parser.attributesMode = XMLDictionaryAttributesModeUnprefixed;
    NSDictionary *parsedRespince = [parser dictionaryWithParser:responseObject];
    return parsedRespince;
}

@end
