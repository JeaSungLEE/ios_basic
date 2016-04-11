//
//  JSPhotoViewController.h
//  MidTerm
//
//  Created by 이재성 on 2016. 4. 11..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JSPhotoViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property()NSString *imageName;
@property()NSString *titleName;
@property()NSString *detailName;

@end
