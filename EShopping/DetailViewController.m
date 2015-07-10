//
//  DetailViewController.m
//  EShopping
//
//  Created by FauadAnwar on 07/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UIButton *addToCartButton;
@property (weak, nonatomic) IBOutlet UIView *addvertisementView;
- (IBAction)addToCartButtonClicked:(id)sender;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(BaseItem *)newDetailItem {
    
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.itemImageView.image = [UIImage imageNamed:self.detailItem.image];
        self.nameLabel.text = self.detailItem.name;
        self.priceLabel.text = [self.detailItem.price stringValue];
        [self.addToCartButton setTitle:NSLocalizedString(@"Add to cart", @"Add to cart") forState:UIControlStateNormal];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))
    {
        if (_detailItem)
        {
            self.addvertisementView.hidden = YES;
        }
        else
        {
            self.addvertisementView.hidden = NO;
        }
    }
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToCartButtonClicked:(id)sender {
    
    CartItem *cartItem = [[CartItem alloc] init];
    
    cartItem.itemID = self.detailItem.itemID;
    
    cartItem.name = self.detailItem.name;
    
    cartItem.image = self.detailItem.image;
    
    cartItem.price = self.detailItem.price;
    
    cartItem.quantity = @1;
    
    [[Cart sharedInstance].items addObject:cartItem];
}
@end
