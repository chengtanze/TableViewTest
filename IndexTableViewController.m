//
//  IndexTableViewController.m
//  TableViewTest
//
//  Created by wangsl-iMac on 14/11/7.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "IndexTableViewController.h"

@interface IndexTableViewController ()
{
    NSDictionary * dic;
    NSArray * keyArray;
}
@end

@implementation IndexTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    dic = [NSDictionary dictionaryWithObjectsAndKeys:@"A", @"Austra", @"A", @"Amain",@"A", @"Ann", @"B", @"Brasil", @"B", @"Balama",nil];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ListData" ofType:@"plist"];
    
    dic = [[NSDictionary alloc]initWithContentsOfFile:path];
    
    NSArray * key =  [[NSArray alloc]initWithArray:[dic allKeys]];

    keyArray = [key sortedArrayUsingSelector:@selector(compare:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return [keyArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return  [[dic objectForKey:[keyArray objectAtIndex:section]] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    
    NSArray * tmp =  [dic objectForKey:[keyArray objectAtIndex:indexPath.section]];
    
    NSString * str = tmp[indexPath.row];
    
    cell.textLabel.text = str;

    return cell;
}

// 返回索引的内容
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keyArray;
}


// 选中时，跳转表视图
-(NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
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
