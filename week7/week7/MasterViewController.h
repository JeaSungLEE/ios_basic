//
//  MasterViewController.h
//  week7
//
//  Created by 이재성 on 2016. 4. 20..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;
@end

