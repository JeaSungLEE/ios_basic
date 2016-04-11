//
//  JSAlbumViewController.m
//  MidTerm
//
//  Created by 이재성 on 2016. 4. 11..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "JSAlbumViewController.h"

@interface JSAlbumViewController ()

@end

@implementation JSAlbumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self notificationAdd];
    [self indexSortArray];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)buttonClick:(UIBarButtonItem *)sender {
    [self dateSortArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)indexSortArray{
    JSDataModel* jsd = [[JSDataModel alloc]init];
    [jsd jsonToArray];
    _itemArray = [jsd itemArray];
}
-(void)dateSortArray{
    JSDataModel* jsd = [[JSDataModel alloc]init];
    [jsd sortArray];
    _itemArray = [jsd itemArray];
}
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventSubtypeMotionShake)
    {
        [self indexSortArray];
        [_tableViews reloadData];;
    }
}

-(void)notificationAdd{
    [[NSNotificationCenter defaultCenter] addObserverForName:@"notification"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [_tableViews reloadData];;
                                                  }];
    [[NSNotificationCenter defaultCenter] addObserverForName:@"notification2"
                                                      object:nil
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      [_tableViews reloadData];;
                                                  }];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JSTableCell" forIndexPath:indexPath];
    
    cell.backgroundImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[[_itemArray objectAtIndex:indexPath.row]objectForKey:@"image"]]];
    cell.titleLabel.text = [NSString stringWithFormat:@"%@",[[_itemArray objectAtIndex:indexPath.row]objectForKey:@"title" ]];
    cell.detailLabel.text = [NSString stringWithFormat:@"%@",[[_itemArray objectAtIndex:indexPath.row]objectForKey:@"date"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JSPhotoViewController* jspc = [[JSPhotoViewController alloc]init];
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    jspc = [storyboard instantiateViewControllerWithIdentifier:@"JSPhotoViewController"];
    jspc.titleName = [NSString stringWithFormat:@"%@",[[_itemArray objectAtIndex:indexPath.row]objectForKey:@"title"]];
    jspc.detailName = [NSString stringWithFormat:@"%@",[[_itemArray objectAtIndex:indexPath.row]objectForKey:@"date"]];
    jspc.imageName =[NSString stringWithFormat:@"%@",[[_itemArray objectAtIndex:indexPath.row]objectForKey:@"image"]];
    [[self navigationController] pushViewController:jspc animated:YES];
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
