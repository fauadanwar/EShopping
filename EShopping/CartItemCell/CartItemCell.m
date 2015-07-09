//
//  CartItemCell.m
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "CartItemCell.h"

@interface CartItemCell ()

- (IBAction)numberOfItemsChanged:(id)sender;

@end

@implementation CartItemCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)numberOfItemsChanged:(id)sender {
    
    
}

@end
