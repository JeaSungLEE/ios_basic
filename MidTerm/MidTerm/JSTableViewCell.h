//
//  JSTableViewCell.h
//  MidTerm
//
//  Created by 이재성 on 2016. 4. 11..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;
@end
