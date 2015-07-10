//
//  BaseCategory.m
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "BaseCategory.h"
#import "BaseItem.h"

@implementation BaseCategory

@synthesize name;
@synthesize itemArray;
@synthesize categoryID;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        name = [dictionary objectForKey:@"Category"];
        categoryID = [dictionary objectForKey:@"Category ID"];
        itemArray = [self getItemsListFromDictionary:dictionary];
    }
    
    return self;
}

/*!
    Create NSArray of items from NSDictionary for given category.
 */
- (NSArray *)getItemsListFromDictionary:(NSDictionary *)dictionary
{
    NSArray *items = [dictionary objectForKey:@"Items"];
    
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *itemDictionary in items)
    {
        BaseItem *item = [[BaseItem alloc] initWithDictionary:itemDictionary];
        [itemsArray addObject:item];
    }
    
    return itemsArray;
}
@end
