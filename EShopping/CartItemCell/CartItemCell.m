//
//  CartItemCell.m
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "CartItemCell.h"

@interface CartItemCell ()

- (IBAction)numberOfItemsChanged:(UIButton *)sender;

@end

@implementation CartItemCell

@synthesize delegate;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)numberOfItemsChanged:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        /*!
         if -ve button is pressed.
         */
        [delegate quantityChangedForCell:self withChangeInValue:-1];
    }
    else
    {
        /*!
         if +ve button is pressed.
         */
        [delegate quantityChangedForCell:self withChangeInValue:1];
    }
}

@end
