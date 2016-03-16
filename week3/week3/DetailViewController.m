//
//  DetailViewController.m
//  week3
//
//  Created by 이재성 on 2016. 3. 16..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "DetailViewController.h"
#import "SecondViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *contentLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.titleLabel setText:[_jsonDict objectForKey:@"title"]];
    [self.contentLabel setText:[_jsonDict objectForKey:@"content"]];
    [self.imageView setImage:[UIImage imageNamed:[_jsonDict objectForKey:@"image"]]];
    
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
