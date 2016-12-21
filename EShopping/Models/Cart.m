//
//  Cart.m
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "Cart.h"

@implementation CartItem

- (id)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    if(self)
    {
        //Decode properties, other class vars
        
        self.name = [decoder decodeObjectForKey:@"name"];
        self.price = [decoder decodeObjectForKey:@"price"];
        self.image = [decoder decodeObjectForKey:@"image"];
        self.itemID = [decoder decodeObjectForKey:@"itemID"];
        self.quantity = [decoder decodeObjectForKey:@"quantity"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    //Encode properties, other class variables, etc
    
    [encoder encodeObject:self.name forKey:@"name"];
    [encoder encodeObject:self.price forKey:@"price"];
    [encoder encodeObject:self.image forKey:@"image"];
    [encoder encodeObject:self.itemID forKey:@"itemID"];
    [encoder encodeObject:self.quantity forKey:@"quantity"];
}

- (NSNumber *)subTotal
{   
    return [NSNumber numberWithFloat:[self.price floatValue] * [self.quantity floatValue]];
}

@end


@implementation Cart

+ (instancetype)sharedInstance
{
    static Cart *_sharedInstance;
    
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        
        _sharedInstance = [[Cart alloc] init];
    });
    
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [self retrivePersistentStore];
    }
    
    return self;
}

- (NSNumber *)totalPrice
{
    CGFloat totalPrice = 0;
    
    for (CartItem *cartItem in _items) {
        
        totalPrice += ([cartItem.price floatValue] * [cartItem.quantity floatValue]);
    }
    
    return [NSNumber numberWithFloat:totalPrice];
}

- (NSNumber *)totalItems
{
    CGFloat totalItems = 0;
    
    for (CartItem *cartItem in _items) {
        
        totalItems += [cartItem.quantity floatValue];
    }
    
    return [NSNumber numberWithFloat:totalItems];
}

-(BOOL)addItem:(CartItem *)item
{
    BOOL addStatus = NO;
    
    CartItem *existingItem = nil;
    
    
    for (CartItem *cartItem in _items) {
        
        if ([cartItem.itemID isEqualToNumber:item.itemID]) {
            
            existingItem = cartItem;
            
            break;
        }
    }
    
    
    if (existingItem == nil) {
        
        NSMutableArray *mutableItems = [NSMutableArray arrayWithArray:_items];
        
        [mutableItems addObject:item];
        
        _items = [NSArray arrayWithArray:mutableItems];
        
        addStatus = YES;
    }
    else {
        
        existingItem.quantity = [NSNumber numberWithInteger:([existingItem.quantity integerValue] + 1)];
    }
    
    
    return addStatus;
}

-(BOOL)removeItem:(CartItem *)item
{
    BOOL removeStatus = NO;
    
    CartItem *existingItem = nil;
    
    
    for (CartItem *cartItem in _items) {
        
        if ([cartItem.itemID isEqualToNumber:item.itemID]) {
            
            existingItem = cartItem;
            
            break;
        }
    }
    
    
    if (existingItem != nil) {
        
        NSMutableArray *mutableItems = [NSMutableArray arrayWithArray:_items];
        
        [mutableItems removeObject:existingItem];
        
        _items = [NSArray arrayWithArray:mutableItems];
        
        removeStatus = YES;
    }
    
    
    return removeStatus;
}

- (void)updatePersistentStore
{
    if ([_items count] != 0)
    {
        NSData *encodedObject = [NSKeyedArchiver archivedDataWithRootObject:_items];
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        
        [defaults setObject:encodedObject forKey:NSStringFromClass([self class])];
        
        [defaults synchronize];
    }
}

/*!
    Method to retrive cart data in NSUserDefault. Later on replace with CoreData or file storage
*/
- (void)retrivePersistentStore
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSData *encodedObject = [defaults objectForKey:NSStringFromClass([self class])];
    
    
    if (encodedObject != nil)
    {
        _items = [NSKeyedUnarchiver unarchiveObjectWithData:encodedObject];
    }
    else
    {
        _items = [[NSArray alloc] init];
    }
}

@end
