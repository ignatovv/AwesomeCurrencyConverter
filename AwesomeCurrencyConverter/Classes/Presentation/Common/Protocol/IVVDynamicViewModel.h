//
//  IVVViewObject.h
//  AwesomeCurrencyConverter
//
//  Created by Vladimir Ignatov on 05/03/2017.
//  Copyright © 2017 Ignatov inc. All rights reserved.
//

/**
 Dynamic view model provides the class of the view to configurate with 
 */
@protocol IVVDynamicViewModel <NSObject>

- (Class)viewClass;

@end
