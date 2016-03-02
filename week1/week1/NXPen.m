//
//  NXPen.m
//  week1
//
//  Created by 이재성 on 2016. 3. 2..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "NXPen.h"

@implementation NXPen

- (id)initWithBrand:(NSString*)brand
{
    if (self = [super init]) {
        self.brand=brand;
    }
    return(self);
}

-(void)setBrand:(NSString*)brand{
    _brand=brand;
}
-(void)setColor:(NSString*)color{
    _color=color;
}
-(void)setUsage:(int)usage{
    _usage=usage;
}

-(void)printDescription {
    NSLog(@"Brand: %@, Color: %@, Usage: %d\n",_brand,_color,_usage);
}
@end