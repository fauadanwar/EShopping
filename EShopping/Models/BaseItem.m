//
//  BaseItem.m
//  EShopping
//
//  Created by FauadAnwar on 08/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "BaseItem.h"

@implementation BaseItem

@synthesize itemID;
@synthesize name;
@synthesize image;
@synthesize price;

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self)
    {
        itemID = [dictionary objectForKey:@"Item ID"];
        name = [dictionary objectForKey:@"Name"];
        image = [dictionary objectForKey:@"Image"];
        price = [dictionary objectForKey:@"Price"];
    }
    
    return self;
}
@end
