//
//  Cart.m
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "Cart.h"

@implementation CartItem

@end


@implementation Cart

+(instancetype)sharedInstance
{
    static Cart *_sharedInstance;
    
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        
        _sharedInstance = [[Cart alloc] init];
    });
    
    return _sharedInstance;
}

-(instancetype)init
{
    self = [super init];
    
    if (self) {
        
        _items = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(NSNumber *)totalPrice
{
    CGFloat totalPrice = 0;
    
    for (CartItem *cartItem in _items) {
        
        totalPrice += ([cartItem.price floatValue] * [cartItem.quantity floatValue]);
    }
    
    return [NSNumber numberWithFloat:totalPrice];
}

@end
