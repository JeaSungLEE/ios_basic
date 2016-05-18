//
//  MYView.h
//  week10
//
//  Created by 이재성 on 2016. 5. 4..
//  Copyright © 2016년 JoyLee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MYView : UIView

-(void)drawLine:(NSMutableArray*)axisPoint;
@property() NSMutableArray* axisPoint;
@property() BOOL rightDown;
@property() BOOL leftDown;
@property() BOOL right;
@property() BOOL rightUp;
@property() BOOL leftUp;
@property() BOOL left;
@property() BOOL up;
@property() BOOL down;
@property() int toRightDown;
@property() int toLeftDown;
@property() int toRight;
@property() int toRightUp;
@property() int toLeftUp;
@property() int toDown;
@property() int toLeft;
@property() int toUp;
@end
