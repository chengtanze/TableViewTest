//
//  FontHeightTableViewController.m
//  TableViewTest
//
//  Created by wangsl-iMac on 14/11/7.
//  Copyright (c) 2014年 chengtz-iMac. All rights reserved.
//

#import "FontHeightTableViewController.h"

@interface FontHeightTableViewController ()
{
    NSArray * fontArray;
    NSDictionary * fontDict;
}
@end

@implementation FontHeightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *key =@[@"one",@"two",@"three",@"four"];
    
    fontArray = @[@"宋朝（960—1279年）是中国历史上承五代十国、下启元朝的时代，分北宋和南宋，历十八帝三百二十年。",
                  @"宋朝是中国古代历史上经济、文化教育与科学创新高度繁荣的时代[3] ，北宋咸平三年（1000年）中国GDP总量为265.5亿美元，占世界经济总量的22.7%，人均GDP为2280美元，[4] 西亚人均GDP为621美元；两者都超过当时西欧人均GDP427美元，而1820年清朝时中国人均GDP为600美元，当时经过第一次工业革命的英国人均GDP为1250美元。[5]宋朝时，出现了宋明理学，儒家复兴，社会上弥漫尊师重道之风，科技发展亦突飞猛进，政治也较开明廉洁，终宋没有严重的宦官乱政和地方割据，兵变、民乱次数与规模在中国历史上也相对较少，[6-7]   人口从太平兴国五年（980年）的3250万增至大观四年（1110年）的1亿1275万",
                  @"著名史学家陈寅恪：“华夏民族之文化，历数千载之演进，造极于赵宋之世。”[9] 而西方与日本史学界中认为宋朝是中国历史上的文艺复兴与经济革命的人不在少数。",
                  @"赵光义去世后，宋真宗赵恒接替即位。宋真宗上台后勤政治国，北宋由此进入咸平之治。[26-27]   自从雍熙北伐之后赵恒，辽朝就经常在宋辽交界处抢劫杀掠[28] ，到景德元年（1004年）终于演变成大规模侵宋战争[29] 。宰相寇准力主抗战，结果宋真宗亲征，宋军士气大振，与辽军相持在澶州城下，辽军被迫求和。经过几番交涉，两国议和成功。和约主要内容是：宋每年给辽绢二十万匹，银十万两，开放边境贸易，双方为兄弟之国。史称该和约为“澶渊之盟”[30] 。[31]后来，寇准渐渐失宠，宋真宗开始信用王钦若。王钦若擅长逢迎，宋真宗赵恒宋真宗赵恒[32]深知赵恒希望营造天下太平的氛围，于是极力鼓吹宋真宗封禅。王钦若本人也与另外一位宰相王旦联手，在各地制造很多“祥瑞”之象，深得宋真宗之意。结果宋真宗在大中祥符元年（1008年）先后三次封禅。[31] [33]宋真宗与皇后刘氏无子。一次宋真宗偶尔临幸刘氏的一名侍女李氏，结果李氏与于大中祥符三年（1010年）产下一子（赵受益），也就是后来的宋仁宗。后来刘氏与另外一名嫔妃杨氏共同抚养这名孩子。天禧二年（1018年）中秋，宋真宗正式封赵受益为太子，并改名为赵祯。乾兴元年（1022年）二月廿日，宋真宗驾崩。太子赵祯即位，刘皇后被尊为皇太后，在赵祯成年前代理军国大事。从此开始了刘太后十六年的垂帘听政时代。[31] [34] ",
                  @"宋仁宗执政早期一直处在刘氏的阴影之下，直到刘氏死后他才得以施展抱负"];
    

    //fontDict = [[NSDictionary alloc]initWithObjects:fontArray forKeys:key];
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
    return [fontArray count];
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
   // return  80;
    NSString *text = fontArray[indexPath.row];
    NSLog(@"%f",[UIScreen mainScreen].bounds.size.width);
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(300, MAXFLOAT)
                                              options:NSStringDrawingUsesLineFragmentOrigin
                                              attributes:attributes
                                              context:nil];
    
    
    NSLog(@"Text width:%f, height:%f", rect.size.width, rect.size.height);
    return rect.size.height + 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"123"];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"123"];
    }
    
    cell.textLabel.text = fontArray[indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:14];
    cell.textLabel.numberOfLines = 0;
    //cell.textLabel.font = UIFont.fontWithSize=18;
    return cell;
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
