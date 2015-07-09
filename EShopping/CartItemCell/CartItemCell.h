//
//  CartItemCell.h
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CartItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *itemImage;

@property (weak, nonatomic) IBOutlet UILabel *itemName;

@property (weak, nonatomic) IBOutlet UILabel *itemQuantity;

@property (weak, nonatomic) IBOutlet UILabel *itemPrice;

@property (weak, nonatomic) IBOutlet UILabel *subTotalPrice;

@end
