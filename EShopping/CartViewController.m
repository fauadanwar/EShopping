//
//  CartViewController.m
//  EShopping
//
//  Created by FauadAnwar on 09/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "CartViewController.h"

@interface CartViewController ()

@property (weak, nonatomic) IBOutlet UITableView *cartTableView;
@property (weak, nonatomic) IBOutlet UILabel *totalQuantity;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;

- (IBAction)editCartButtonClicked:(id)sender;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [Cart sharedInstance].items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CartItemCell *cell = (CartItemCell *)[tableView dequeueReusableCellWithIdentifier:@"CartItemCell" forIndexPath:indexPath];
    
    CartItem *cartItem = (CartItem *)[[Cart sharedInstance].items objectAtIndex:indexPath.row];
    
    
    cell.itemImage.image = [UIImage imageNamed:cartItem.image];
    
    cell.itemName.text = cartItem.name;
    
    cell.itemPrice.text = [cartItem.price stringValue];
    
    cell.itemQuantity.text = [cartItem.quantity stringValue];
    
    
    return cell;
}

- (IBAction)editCartButtonClicked:(id)sender {
}
@end
