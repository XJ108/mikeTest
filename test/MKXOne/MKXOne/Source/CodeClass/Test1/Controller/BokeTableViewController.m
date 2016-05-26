//
//  BokeTableViewController.m
//  MKXOne
//
//  Created by mike on 16/5/12.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "BokeTableViewController.h"

@interface BokeTableViewController ()

@property (nonatomic, strong) MJRefreshAutoFooter *footer;
@property (nonatomic, strong) MJRefreshStateHeader *header;
@property (nonatomic, strong) NSMutableArray *dataArray;


@end

@implementation BokeTableViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setup];
        _dataArray = [NSMutableArray array];
    }
    return self;
}

-(void)setDataArray:(NSMutableArray *)dataArray {
    if (_dataArray != dataArray) {
        _dataArray = nil;
        _dataArray = dataArray;
    }
}

#pragma mark  ---- 上拉加载 下拉刷新 ----
- (void)setup {
    _footer = [MJRefreshAutoStateFooter footerWithRefreshingTarget:self refreshingAction:@selector(autoFooterAction:)];
    _header = [MJRefreshStateHeader headerWithRefreshingTarget:self refreshingAction:@selector(stateHeaderAction:)];
    self.tableView.mj_footer = _footer;
    self.tableView.mj_header = _header;
}

- (void) autoFooterAction: (MJRefreshAutoFooter *)footer {
    [footer endRefreshing];
}

- (void) stateHeaderAction: (MJRefreshStateHeader *)header {
    [header endRefreshing];
}


#pragma mark  -----
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self.tableView registerClass:[BokeTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.allowsMultipleSelection = YES;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"setting" style:UIBarButtonItemStyleDone target:self action:@selector(settingAction)];
    
    
}

#pragma mark -  删除
- (void) settingAction {
    self.tableView.editing = !self.tableView.editing;
}
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete ;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle ==UITableViewCellEditingStyleDelete) {
        
        NSLog(@"delete");
        self.tableView.editing = !self.tableView.editing;
        
    }
}
//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    // get the row number
//    if (indexPath.section == 1) {
//        NSInteger row = [indexPath row];
//        if (editingStyle==UITableViewCellEditingStyleDelete) {
//            //   remove the value of  array
//            [listData removeObjectAtIndex:row];
//            //   remove the row of the cell
//            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//        }
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BokeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[BokeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    if (indexPath.row % 2 != 0) {
        cell.index = 1;
        cell.isAppearHotImageView = NO;
    }else {
        cell.index = 2;
        cell.isAppearHotImageView = YES;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.selectedBackgroundView.backgroundColor = [UIColor clearColor];
    cell.multipleSelectionBackgroundView = [[UIView alloc] initWithFrame:cell.frame];
    cell.multipleSelectionBackgroundView.backgroundColor = [UIColor clearColor];


    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.row % 2 != 0) {
//        return 115;
//    }
    return [tableView cellHeightForIndexPath:indexPath model:nil keyPath:nil cellClass:[BokeTableViewCell class] contentViewWidth:kScreenWidth];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    BokeTableViewCell *cell = [tableView  cellForRowAtIndexPath:indexPath];
//    cell.selected = NO;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
