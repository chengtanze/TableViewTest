//
//  MyTableViewController.m
//  TableViewTest
//
//  Created by wangsl-iMac on 14/11/6.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "MyTableViewController.h"

@interface MyTableViewController ()
{
    float MainSrceenwidth;
    float MainSrceenHeight;
    
    NSArray *fontArray;
    NSMutableArray *sectionArray;
}
@end

@implementation MyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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

    
    
    UITableViewStyle style = UITableViewStylePlain;
    if (self.stlye == NO) {
        style = UITableViewStyleGrouped;
    }
    
    UITableView * tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, MainSrceenwidth, MainSrceenHeight) style:style];
    
    tableview.delegate = self;
    tableview.dataSource = self;
    
    
    
    [self.view addSubview:tableview];

    
}


//调用顺序－1 返回节数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSLog(@"numberOfSectionsInTableView ;%ld", sectionArray.count);
    return  sectionArray.count;
}


//调用顺序－2 根据section（节数）返回数据个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"numberOfRowsInSection ;%ld", [sectionArray[section] count]);
    return [sectionArray[section] count];
}

//调用顺序－3 设置单元格数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * str = @"CellIndextifier";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:str];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
    }
    
    cell.textLabel.text = sectionArray[indexPath.section][indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:cell.textLabel.text size:14];
    
    NSLog(@"NsindexPath : %@", indexPath);
    //cell.backgroundColor = [UIColor yellowColor];
    return cell;
}

//用户点击单元格，调用该方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSLog(@"didSelectRowAtIndexPath section:%ld, row:%ld", indexPath.section, indexPath.row);
//    UIStoryboard * mainStory  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    UIViewController * firstView = [mainStory instantiateViewControllerWithIdentifier:@"FirstpushViewController"];
//    
//    [self.navigationController pushViewController:firstView animated:YES];
//    
//    NSLog(@"%@", indexPath);
}

//根据section索引 设置的抬头的名称
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    NSString * title = [NSString stringWithFormat:@"第%ld个section", section + 1];
//    return  title;
//}

//根据section索引 设置section的尾的名称
//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    NSString * title = [NSString stringWithFormat:@"第%ld个section", section + 1];
//    return  title;
//}

//根据section索引 设置的抬头的高度
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 44;
//}

//根据section索引 设置的尾的高度
//-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//    return 44;
//}

//根据NSIndexPath 设置指定行的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
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

@end
