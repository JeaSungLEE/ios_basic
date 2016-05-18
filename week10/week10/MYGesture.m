//
//  MYGesture.m
//  week10
//
//  Created by 이재성 on 2016. 5. 4..
//  Copyright © 2016년 JoyLee. All rights reserved.
//

#import "MYGesture.h"

@implementation MYGesture
@synthesize axisPoint;

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches]anyObject];
    axisPoint=[[NSMutableArray alloc]init];
    [axisPoint addObject:[NSValue valueWithCGPoint:[touch locationInView:touch.view]]];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch=[[event allTouches]anyObject];
    CGPoint nowPoint = [touches.anyObject locationInView:touch.view];
    [axisPoint addObject:[NSValue valueWithCGPoint:[touch locationInView:touch.view]]];
}

-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    MYView* myv = [[MYView alloc]init];
    [myv drawLine:axisPoint];
}

@end
