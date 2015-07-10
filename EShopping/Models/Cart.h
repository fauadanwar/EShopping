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

@property (readwrite, nonatomic) NSNumber *quantity;
@property (readwrite, nonatomic) NSNumber *subTotal;

@end


@interface Cart : NSObject

+(instancetype)sharedInstance;

@property (readonly, atomic) NSArray *items;

@property (readonly, strong) NSNumber *totalPrice;
@property (readonly, strong) NSNumber *totalItems;

- (BOOL) addItem:(CartItem *)item;

- (BOOL) removeItem:(CartItem *)item;

- (void)updatePersistentStore;

@end
