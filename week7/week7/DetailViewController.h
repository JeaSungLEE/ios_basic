//
//  DetailViewController.h
//  week7
//
//  Created by 이재성 on 2016. 4. 20..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property() NSMutableData *image;
@end

