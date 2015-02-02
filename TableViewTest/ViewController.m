//
//  ViewController.m
//  TableViewTest
//
//  Created by wangsl-iMac on 14-11-4.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "ViewController.h"
#import "StylTableViewController.h"
#import "MyTableViewController.h"
@interface ViewController ()
{
    NSArray *fontArray;
    NSMutableArray *sectionArray;
    float MainSrceenwidth;
    float MainSrceenHeight;
    
    NSArray *itemArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    fontArray = [UIFont familyNames];
    MainSrceenwidth = [UIScreen mainScreen].bounds.size.width;
    MainSrceenHeight = [UIScreen mainScreen].bounds.size.height;

    sectionArray = [[NSMutableArray alloc]initWithCapacity:20];
    NSMutableArray * tmp = nil;
    for (int nIndex = 0; nIndex < fontArray.count; nIndex++) {
       
        NSString * font = fontArray[nIndex];
        if (nIndex % 5 == 0) {
            tmp = [[NSMutableArray alloc]initWithCapacity:5];
            [sectionArray addObject:tmp];
        }
        
        [tmp addObject:font];
    }
    
    itemArray = @[@"Plain style", @"Group style"];
    
    
        
    
    
    //设置为编辑状态
    //self.tableView.editing = YES;
    
//    self.tableView.allowsSelectionDuringEditing = YES;
    
    //是否可以选中多个单元格
    //self.tableView.allowsMultipleSelection = YES;
    
    
    //设置分割线风格
    //self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    //设置分割线颜色
//    self.tableView.separatorColor = [UIColor redColor];
    
    //设置表视图的头部视图
//    UIView * backGroup = [[UIView alloc]initWithFrame:CGRectMake(0, 0, MainSrceenwidth, 50)];
//    backGroup.backgroundColor = [UIColor redColor];
//    self.tableView.tableHeaderView = backGroup;
  
    //设置表视图的尾部视图
//    UIView * footView = [[UIView alloc]initWithFrame:CGRectMake(0, MainSrceenHeight - 100, MainSrceenwidth, 50)];
//    footView.backgroundColor = [UIColor purpleColor];
//    self.tableView.tableFooterView = footView;
    
    
    //设置表视图背景
//    UIView * backView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, MainSrceenwidth, 150)];
//    backView.backgroundColor = [UIColor blueColor];
//    self.tableView.backgroundView = backView;
    
//    self.tableView.backgroundColor = [UIColor yellowColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//调用顺序－1 返回节数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    //NSLog(@"numberOfSectionsInTableView ;%ld", sectionArray.count);
    //return  sectionArray.count;
}


//调用顺序－2 根据section（节数）返回数据个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //NSLog(@"numberOfRowsInSection ;%ld", [sectionArray[section] count]);
    //return [sectionArray[section] count];
    return [itemArray count];
}

//调用顺序－3 设置单元格数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"CellIndextifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    //cell.textLabel.text = fontArray[indexPath.row];
    //cell.textLabel.font = [UIFont fontWithName:cell.textLabel.text size:14];
    
    cell.textLabel.text = itemArray[indexPath.row];
    
    NSLog(@"NsindexPath : %@", indexPath);
    //cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

//用户点击单元格，调用该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UIStoryboard * mainStory  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //StylTableViewController * firstView = [mainStory instantiateViewControllerWithIdentifier:@"StylTableViewController"];

    MyTableViewController * talbeview = [[MyTableViewController alloc]init];
    if (indexPath.row == 0) {
        talbeview.stlye = YES;
    }else
    {
        talbeview.stlye = NO;
    }
    [self.navigationController pushViewController:talbeview animated:YES];
    
    NSLog(@"%@", indexPath);
}

////根据section索引 设置的抬头的名称
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    NSString * title = [NSString stringWithFormat:@"第%ld个section", section + 1];
//    return  title;
//}
//
////根据section索引 设置section的尾的名称
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    NSString * title = [NSString stringWithFormat:@"第%ld个section", section + 1];
//    return  title;
//}
//
////根据section索引 设置的抬头的高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 44;
//}
//
////根据section索引 设置的尾的高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 44;
//}
//
////根据NSIndexPath 设置指定行的高度
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 44;
//}




@end
