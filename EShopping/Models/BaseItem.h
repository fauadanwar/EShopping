//
//  BaseItem.h
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseItem : NSObject

/*!
    NSNumber variable itemID to identify item.
*/
@property(atomic,strong)NSNumber *itemID;

/*!
    NSString variable to store Item name.
*/
@property(atomic,strong)NSString *name;

/*!
    NSNumber variable to store Item price.
*/

@property(atomic,strong)NSNumber *price;

/*!
    NSNumber variable to store Item image.
*/

@property(atomic,strong)NSString *image;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
