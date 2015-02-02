//
//  StylTableViewController.m
//  TableViewTest
//
//  Created by wangsl-iMac on 14/11/6.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "StylTableViewController.h"

@interface StylTableViewController ()
{
    NSArray *cellArray;
    NSMutableArray *sectionArray;
    float MainSrceenwidth;
    float MainSrceenHeight;
}
@end




@implementation StylTableViewController


-(void)loadView
{
    [super loadView];
    self.title = @"TabViewCell";
    
//    
//    CGRect rect = self.tableView.frame;
//    
//    rect.origin.y += 144;
//    
//    self.tableView.frame = rect;
    
    
    MainSrceenwidth = [UIScreen mainScreen].bounds.size.width;
    MainSrceenHeight = [UIScreen mainScreen].bounds.size.height;
    

    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 80, MainSrceenwidth, MainSrceenHeight) style:UITableViewStylePlain];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    [self.view addSubview:tableview];
}

- (void)viewDidLoad {
    
    
    
    [super viewDidLoad];
    

  

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

//调用顺序－1 返回节数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


//调用顺序－2 根据section（节数）返回数据个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

//调用顺序－3 设置单元格数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    static NSString * str = @"CellIndextifier";
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc]initWithStyle:indexPath.row reuseIdentifier:str];
//    }
    
    //cell.textLabel.text = fontArray[indexPath.row];
    UITableViewCell * cell = nil;
    switch (indexPath.row) {
        case UITableViewCellStyleDefault:
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
            
            cell.textLabel.text = @"默认样式";
            cell.imageView.image = [UIImage imageNamed:@"IMG_0410"];
            cell.detailTextLabel.text = @"默认样式详细栏";
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
            break;
        case UITableViewCellStyleValue1:
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
            
            cell.textLabel.text = @"样式1";
            cell.imageView.image = [UIImage imageNamed:@"IMG_0410"];
            cell.detailTextLabel.text = @"样式1详细栏";
            break;
        case UITableViewCellStyleValue2:
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil];
            
            cell.textLabel.text = @"样式2";

            //cell.imageView.image = [UIImage imageNamed:@"IMG_0410"];
            cell.detailTextLabel.text = @"样式2详细栏";
            break;
        case UITableViewCellStyleSubtitle:
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
            
            cell.textLabel.text = @"样式3";
            cell.imageView.image = [UIImage imageNamed:@"IMG_0410"];
            cell.detailTextLabel.text = @"样式3详细栏";
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        default:
            break;
    }
    
    
    NSLog(@"NsindexPath : %@", indexPath);

    return cell;
}

//用户点击单元格，调用该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIStoryboard * mainStory  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController * firstView = [mainStory instantiateViewControllerWithIdentifier:@"FirstpushViewController"];
//    
//    [self.navigationController pushViewController:firstView animated:YES];
//    
//    NSLog(@"%@", indexPath);
}



//根据NSIndexPath 设置指定行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
