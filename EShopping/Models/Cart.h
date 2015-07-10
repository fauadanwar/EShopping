//
//  Cart.h
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "BaseItem.h"


@interface CartItem : BaseItem

/*!
    NSNumber variable to store Item quantity.
*/
@property (readwrite, nonatomic) NSNumber *quantity;

/*!
    NSNumber variable which calculate and store Item subTotal.
*/
@property (readonly, nonatomic) NSNumber *subTotal;

@end


@interface Cart : NSObject

+(instancetype)sharedInstance;


/*!
    NSArray variable store Items.
*/
@property (readonly, atomic) NSArray *items;

/*!
    NSNumber variable which calculate and store total price.
*/
@property (readonly, strong) NSNumber *totalPrice;

/*!
    NSNumber variable which calculate and store total items.
*/
@property (readonly, strong) NSNumber *totalItems;


/*!
    Method to add item in cart list.
*/
- (BOOL) addItem:(CartItem *)item;

/*!
    Method to remove item in cart list.
*/
- (BOOL) removeItem:(CartItem *)item;


/*!
    Method to save cart data in NSUserDefault. Later on replace with CoreData or file storage
*/
- (void)updatePersistentStore;

@end
