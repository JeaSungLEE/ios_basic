//
//  SecondViewController.m
//  week3
//
//  Created by 이재성 on 2016. 3. 16..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "SecondViewController.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NXJsonModel* jsonModel = [[NXJsonModel alloc]init];
    _jsonArray = [jsonModel jsonArray];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"detailSegue"]){
        DetailViewController* detailVc = (DetailViewController*)segue.destinationViewController;
        detailVc.jsonDict = [self itemAtIndex:rand()%4];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSDictionary*)itemAtIndex:(int)index{
    NSDictionary *dictionary = [_jsonArray objectAtIndex:index];
    return dictionary;
}@end
