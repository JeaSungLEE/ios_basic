//
//  ViewController.m
//  week10
//
//  Created by 이재성 on 2016. 5. 4..
//  Copyright © 2016년 JoyLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MYGesture *myg=[[MYGesture alloc]init];
    [self.view addGestureRecognizer:myg];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
