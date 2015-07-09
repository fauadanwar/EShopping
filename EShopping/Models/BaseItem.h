//
//  BaseItem.h
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseItem : NSObject

@property(atomic,strong)NSNumber *itemID;
@property(atomic,strong)NSString *name;
@property(atomic,strong)NSNumber *price;
@property(atomic,strong)NSString *image;

- (id)initWithDictionary:(NSDictionary *)dictionary;
@end
