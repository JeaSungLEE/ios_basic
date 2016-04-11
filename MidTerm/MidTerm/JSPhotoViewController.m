//
//  JSPhotoViewController.m
//  MidTerm
//
//  Created by 이재성 on 2016. 4. 11..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "JSPhotoViewController.h"

@interface JSPhotoViewController ()

@end

@implementation JSPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    _imageLabel.image = [UIImage imageNamed:_imageName];
    _titleLabel.text = _titleName;
    _dateLabel.text = _detailName;
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
