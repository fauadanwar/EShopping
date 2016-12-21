//
//  MasterViewController.m
//  EShopping
//
//  Created by FauadAnwar on 07/07/15.
//  Copyright (c) 2015 Fauad Anwar. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Utility.h"
#import "BaseItem.h"
#import "BaseCategory.h"

@interface MasterViewController ()

@property NSArray *itemsList;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.itemsList = [self getItemsList];
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    if ((UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad))
    {
        self.navigationItem.rightBarButtonItem = nil;
    }
    
    
    BaseCategory *category = [self.itemsList objectAtIndex:0];
    
    BaseItem *item = [category.itemArray objectAtIndex:0];
    
    [self.detailViewController setDetailItem:item];
    
    self.detailViewController.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
    self.detailViewController.navigationItem.leftItemsSupplementBackButton = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        UIBarButtonItem *barButtonItem = [self.splitViewController displayModeButtonItem];
        
        [[UIApplication sharedApplication] sendAction:barButtonItem.action to:barButtonItem.target from:nil forEvent:nil];
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        BaseCategory *category = [self.itemsList objectAtIndex:indexPath.section];
        
        BaseItem *item = [category.itemArray objectAtIndex:indexPath.row];
        
        DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:item];
        controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.itemsList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    BaseCategory *category = [self.itemsList objectAtIndex:section];

    return [category.itemArray count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    BaseCategory *category = [self.itemsList objectAtIndex:section];
    return category.name;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    BaseCategory *category = [self.itemsList objectAtIndex:indexPath.section];
    BaseItem *item = [category.itemArray objectAtIndex:indexPath.row];
    cell.textLabel.text = item.name;
    return cell;
}

#pragma mark - Other Methods

- (NSArray *)getItemsList
{
    NSArray *plistArray = [Utility getArrayFromPlistFile:@"ItemList"];
    
    NSMutableArray *itemsArray = [[NSMutableArray alloc] init];
    
    for (NSDictionary *itemDictionary in plistArray)
    {
        BaseCategory *category = [[BaseCategory alloc] initWithDictionary:itemDictionary];
        [itemsArray addObject:category];
    }
    return itemsArray;
}
@end
