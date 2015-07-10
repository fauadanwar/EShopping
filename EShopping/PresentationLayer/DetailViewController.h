//
//  DetailViewController.h
//  EShopping
//
//  Created by FauadAnwar on 07/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Cart.h"

@interface DetailViewController : UIViewController

/*!
    BaseItem cariable to store selected item. Later on replace thsi with base BaseCategory item.
*/
@property (strong, nonatomic) BaseItem *detailItem;

@end

