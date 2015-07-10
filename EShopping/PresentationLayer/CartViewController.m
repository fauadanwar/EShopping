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
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editCartButton;
@property (weak, nonatomic) IBOutlet UIView *cartEmptyView;

- (IBAction)editCartButtonClicked:(id)sender;
- (IBAction)doneButtonClicked:(id)sender;

@end

@implementation CartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.totalQuantity.text = [[Cart sharedInstance].totalItems stringValue];
    self.totalPrice.text = [[Cart sharedInstance].totalPrice stringValue];
    
    [self toggleCartView];
}

-(void)toggleCartView
{
    _editCartButton.enabled = ([Cart sharedInstance].items.count != 0);
    
    _cartEmptyView.hidden = ([Cart sharedInstance].items.count != 0);
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
    
    cell.subTotalPrice.text = [cartItem.subTotal stringValue];
    
    cell.delegate = self;
    
    cell.indexPath = indexPath;
    
    return  cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [[Cart sharedInstance] removeItem:[[Cart sharedInstance].items objectAtIndex:indexPath.row]];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [self toggleCartView];
        
        self.totalQuantity.text = [[Cart sharedInstance].totalItems stringValue];
        
        self.totalPrice.text = [[Cart sharedInstance].totalPrice stringValue];
    }
}


#pragma mark - Button action handling

- (IBAction)editCartButtonClicked:(id)sender {
    
    if (self.cartTableView.isEditing == NO) {
        
        self.editCartButton.title = @"Done";
        
        [self.cartTableView setEditing:YES animated:YES];
    }
    else {
        
        self.editCartButton.title = @"Edit";
        
        [self.cartTableView setEditing:NO animated:YES];
    }
}

- (IBAction)doneButtonClicked:(id)sender
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - CartItemCell delegate

- (void)quantityChangedForCell:(CartItemCell *)cell withChangeInValue:(NSInteger)value
{
    NSIndexPath *indexPath = cell.indexPath;
    
    CartItem *cartItem = (CartItem *)[[Cart sharedInstance].items objectAtIndex:indexPath.row];
    
    NSInteger newQuantity = [cartItem.quantity integerValue] + value;
    
    
    if (newQuantity > 0 && newQuantity <= 100)
    {
        cartItem.quantity = [NSNumber numberWithInteger:newQuantity];
        
        [self.cartTableView beginUpdates];
        
        [self.cartTableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
        
        [self.cartTableView endUpdates];
        
        self.totalQuantity.text = [[Cart sharedInstance].totalItems stringValue];
        
        self.totalPrice.text = [[Cart sharedInstance].totalPrice stringValue];
    }
}

@end
