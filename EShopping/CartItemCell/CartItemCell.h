//
//  CartItemCell.h
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <UIKit/UIKit.h>


@class CartItemCell;

@protocol CartItemCellDelegate <NSObject>

@required
/*!
 Called when user change quantity of items in cart.
 */
- (void)quantityChangedForCell:(CartItemCell *)cell withChangeInValue:(NSInteger)value;

@end

@interface CartItemCell : UITableViewCell

@property (nonatomic, weak) id<CartItemCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;

@property (weak, nonatomic) IBOutlet UILabel *itemName;

@property (weak, nonatomic) IBOutlet UILabel *itemQuantity;

@property (weak, nonatomic) IBOutlet UILabel *itemPrice;

@property (weak, nonatomic) IBOutlet UILabel *subTotalPrice;

/*!
    NSIndexPath for the cell.
 */
@property (strong, atomic) NSIndexPath *indexPath;

@end
