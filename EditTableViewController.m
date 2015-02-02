//
//  EditTableViewController.m
//  TableViewTest
//
//  Created by wangsl-iMac on 14/11/10.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "EditTableViewController.h"

@interface EditTableViewController ()
{
    NSArray *fontArray;
    NSMutableArray *EditArray;
    float MainSrceenwidth;
    float MainSrceenHeight;
    
    int selectRow;
}
@end

@implementation EditTableViewController

static int count = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置是否进入编辑模式
    //[self.tableView setEditing:YES animated:YES];
    selectRow = -1;
    
    fontArray = [UIFont familyNames];
    EditArray = [[NSMutableArray alloc]initWithArray:fontArray];
    MainSrceenwidth = [UIScreen mainScreen].bounds.size.width;
    MainSrceenHeight = [UIScreen mainScreen].bounds.size.height;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [EditArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"edit"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"edit"];
        
    }
    
    cell.textLabel.text = EditArray[indexPath.row];
    // Configure the cell...
    
    return cell;
}


//1    设置是否能编辑，返回NO 表示不能编辑
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    if (indexPath.row == 0) {
        return NO;
    }
    return YES;
}

//2     设置编辑类型（删除，新增）
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        return UITableViewCellEditingStyleInsert;
    }
    
    return UITableViewCellEditingStyleDelete;
}


//3 添加或删除
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        
        [EditArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        
        NSString * strFont = [NSString stringWithFormat:@"New Font %d", count++];
        [EditArray insertObject:strFont atIndex:indexPath.row + 1];
        
        
        NSIndexPath * index = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


// 设置移动单元格属性
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    
    NSString * strMove = [EditArray objectAtIndex:fromIndexPath.row];
    
    [EditArray removeObjectAtIndex:fromIndexPath.row];
    
    //[self.tableView deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:fromIndexPath.row inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
    
    [EditArray insertObject:strMove atIndex:toIndexPath.row];
    
    //[self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:toIndexPath.row
    //                                                          inSection:0]] withRowAnimation:UITableViewRowAnimationFade];
}

// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"字体" message:EditArray[indexPath.row] delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    alert.delegate = self;
    UITextField * text = [alert textFieldAtIndex:0];
    text.text = EditArray[indexPath.row];
    
    selectRow = (int)indexPath.row;
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString * str = [alertView textFieldAtIndex:0].text;
        
        EditArray[selectRow] = str;
        
        NSIndexPath * indexpath = [NSIndexPath indexPathForRow:selectRow inSection:0];
        [self.tableView reloadRowsAtIndexPaths:@[indexpath] withRowAnimation:UITableViewRowAnimationFade];
        //[self.tableView reloadData];

    }
    
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
