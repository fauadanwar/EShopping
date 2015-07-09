//
//  BaseCategory.h
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseCategory : NSObject

@property(atomic,strong)NSNumber *categoryID;
@property(atomic,strong)NSString *name;
@property(atomic,strong)NSArray *itemArray;


- (id)initWithDictionary:(NSDictionary *)dictionary;

@end
