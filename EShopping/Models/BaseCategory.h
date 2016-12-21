//
//  BaseCategory.h
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCategory : NSObject

/*!
    NSNumber variable to store Category ID for future enhancement.
*/
@property(atomic,strong)NSNumber *categoryID;

/*!
    NSString variable to store category name.
*/
@property(atomic,strong)NSString *name;

/*!
    NSArray variable to store Items.
*/
@property(atomic,strong)NSArray *itemArray;


- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
