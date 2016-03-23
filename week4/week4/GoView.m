//
//  GoView.m
//  week4
//
//  Created by 이재성 on 2016. 3. 23..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "GoView.h"

int oakArray[13][13];
int countStone[13][2];
@implementation GoView

-(void)awakeFromNib{
    _oak = [UIImage imageNamed:@"oak.png"];
    _whitestone = [UIImage imageNamed:@"white.png"];
    _blackstone = [UIImage imageNamed:@"black.png"];

    _count=1;
    
}
- (void)drawRect:(CGRect)rect {
    [_oak drawInRect:CGRectMake(CGRectGetMinX(self.bounds), CGRectGetMinY(self.bounds), CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds))];
    _sizeScreen = (CGRectGetMaxX(self.bounds)-40)/11;
    for(int i=1;i<13;i++){
        [self drawLineX:_sizeScreen pointY:_sizeScreen*i];
        [self drawLineY:_sizeScreen*i pointY:_sizeScreen];
    }
    [self drawCycle:_circlePoint];
    for(int i=0;i<13;i++){
        for(int j=0;j<13;j++){
            if(oakArray[i][j]!=0){
                if(oakArray[i][j]%2==1){
                    [_whitestone drawInRect:CGRectMake(i*_sizeScreen-(_sizeScreen/2), j*_sizeScreen-(_sizeScreen/2), _sizeScreen, _sizeScreen)];
                }else if(oakArray[i][j]%2==0){
                    [_blackstone drawInRect:CGRectMake(i*_sizeScreen-(_sizeScreen/2), j*_sizeScreen-(_sizeScreen/2), _sizeScreen, _sizeScreen)];
                }
            }
        }
        if(countStone[i][0]==countStone[i][1]){
            
        }else if(countStone[i][0]>countStone[i][1]){
            [self drawGraph:i*_sizeScreen-(_sizeScreen/2) score:countStone[i][0] stoneColor:0];
        }else if(countStone[i][0]<countStone[i][1]){
            [self drawGraph:i*_sizeScreen-(_sizeScreen/2) score:countStone[i][1] stoneColor:1];
        }
    }
}

-(void)drawCycle:(CGPoint)arcPoint{
    UIBezierPath* arcPath1 = [UIBezierPath bezierPath];
    [[UIColor redColor]setStroke];
    [[UIColor redColor]setFill];
    int indexI = ((int)(arcPoint.x/_sizeScreen+0.5)*_sizeScreen);
    int indexJ = ((int)(arcPoint.y/_sizeScreen+0.5)*_sizeScreen);
    [arcPath1 moveToPoint:CGPointMake(indexI, indexJ)];
    [arcPath1 addArcWithCenter:CGPointMake(indexI, indexJ) radius:15 startAngle:0 endAngle:6.28 clockwise:YES];
    [arcPath1 stroke];
    [arcPath1 fill];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    _circlePoint = [aTouch locationInView:self];
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    _circlePoint = [aTouch locationInView:self];
    [self setNeedsDisplay];
    
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *aTouch = [touches anyObject];
    CGPoint point = [aTouch locationInView:self];
    NSLog(@"%lf %lf",point.x/_sizeScreen,point.y/_sizeScreen);
    int indexI = (point.x/_sizeScreen+0.5);
    int indexJ = (point.y/_sizeScreen+0.5);
    NSLog(@"%d %d",indexI,indexJ);
    if(indexI<=0||indexJ<=0||indexI>=13||indexJ>=13){
        return;
    }
    if(oakArray[indexI][indexJ]==0){
        oakArray[indexI][indexJ] = _count;
        
        if(oakArray[indexI][indexJ]%2==1){
            countStone[indexI][1]++;
        }else{
            countStone[indexI][0]++;
        }
        _count++;
    }
    [self setNeedsDisplay];
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    if(event.type == UIEventSubtypeMotionShake)
        
        for(int i=0;i<14;i++){
            for(int j=0;j<14;j++){
                oakArray[i][j]=0;
            }
    }
    
    [self setNeedsDisplay];
}

-(void)drawGraph:(double)pointX score:(int)score stoneColor:(int)stoneColor{
    double pointY=CGRectGetMaxY(self.bounds)-30;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pathStartPoint = CGPointMake(pointX, pointY);
    [path moveToPoint:pathStartPoint];
    pointY=pointY-score*10;
    CGPoint nextPoint = CGPointMake(pointX, pointY);
    [path addLineToPoint:nextPoint];
    [path setLineWidth:25.0];
    if(stoneColor==1){
        [[UIColor whiteColor]setStroke];
    }else{
        [[UIColor blackColor]setStroke];
    }
    [path fill];
    [path stroke];
}

-(void)drawLineX:(double)pointX pointY:(double)pointY{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pathStartPoint = CGPointMake(pointX, pointY);
    [path moveToPoint:pathStartPoint];
    pointX=pointX+CGRectGetMaxX(self.bounds)-40;
    CGPoint nextPoint = CGPointMake(pointX, pointY);
    [path addLineToPoint:nextPoint];
    [path setLineWidth:1.0];
    [path stroke];
}

-(void)drawLineY:(double)pointX pointY:(double)pointY{
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint pathStartPoint = CGPointMake(pointX, pointY);
    [path moveToPoint:pathStartPoint];
    pointY=pointY+CGRectGetMaxX(self.bounds)-40;
    CGPoint nextPoint = CGPointMake(pointX, pointY);
    [path addLineToPoint:nextPoint];
    [path setLineWidth:1.0];
    [path stroke];
}


@end
