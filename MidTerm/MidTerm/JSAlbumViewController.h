//
//  JSAlbumViewController.h
//  MidTerm
//
//  Created by 이재성 on 2016. 4. 11..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSTableViewCell.h"
#import "JSDataModel.h"
#import "JSPhotoViewController.h"

@interface JSAlbumViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *tableViews;
@property() NSArray *itemArray;
@end
