//
//  ViewController.m
//  ECStretchableHeaderViewExample
//
//  Created by Eric Castro on 14/03/15.
//  Copyright (c) 2015 Eric Castro. All rights reserved.
//

#import "ViewController.h"
#import "ECStretchableHeaderView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet ECStretchableHeaderView *headerView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerViewHeightConstraint;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.contentInset = UIEdgeInsetsMake(-100, 0, 0, 0);
//    self.tableView.contentOffset = CGPointMake(0, -100);
    self.tableView.showsVerticalScrollIndicator = NO;
    self.headerView.maxHeight = 320;
    self.headerView.minHeight = 100;
    self.headerView.layer.borderColor = [UIColor redColor].CGColor;
    self.headerView.layer.borderWidth = 3.0f;
    self.headerView.heightConstraint = self.headerViewHeightConstraint;
    [self.headerView attachToScrollView:self.tableView inset:0];
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

#pragma mark UITableViewDataSource -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *c = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier"];
    c.textLabel.text = [NSString stringWithFormat:@"Item %ld", indexPath.row];
    return c;
}


@end
