//
//  NXPen.h
//  week1
//
//  Created by 이재성 on 2016. 3. 2..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPen:NSObject{
    NSString *_brand;
    NSString *_color;
    int _usage;
}

-(id)initWithBrand:(NSString*)abrand;
-(void)setBrand:(NSString*)brand;
-(void)setColor:(NSString*)color;
-(void)setUsage:(int)usage;
-(void)printDescription;
@end