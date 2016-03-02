//
//  main.m
//  week1
//
//  Created by 이재성 on 2016. 3. 2..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "NXPen.h"
#import "NXDisplayFile.h"



int main(int argc, const char * argv[]) {
    
    NXPen *firstRedPen = [[NXPen alloc]initWithBrand:@"monami"];
    [firstRedPen setColor:@"RED" ];
    [firstRedPen setUsage:30];
    [firstRedPen printDescription];
    NXPen *secondRedPen = [[NXPen alloc]initWithBrand:@"monami"];
    [secondRedPen setColor:@"RED" ];
    [secondRedPen setUsage:90];
    [secondRedPen printDescription];
    NXPen *firstBluePen = [[NXPen alloc]initWithBrand:@"monami"];
    [firstBluePen setColor:@"BLUE" ];
    [firstBluePen setUsage:40];
    [firstBluePen printDescription];
    NXPen *secondBluePen = [[NXPen alloc]initWithBrand:@"monami"];
    [secondBluePen setColor:@"BLUE" ];
    [secondBluePen setUsage:70];
    [secondBluePen printDescription];
    NXPen *thirdBluePen = [[NXPen alloc]initWithBrand:@"monami"];
    [thirdBluePen setColor:@"BLUE" ];
    [thirdBluePen setUsage:20];
    [thirdBluePen printDescription];
    NXPen *fourthBluePen = [[NXPen alloc]initWithBrand:@"monami"];
    [fourthBluePen setColor:@"BLUE" ];
    [fourthBluePen setUsage:50];
    [fourthBluePen printDescription];
    NXPen *firstBlackPen = [[NXPen alloc]initWithBrand:@"monami"];
    [firstBlackPen setColor:@"BLACk" ];
    [firstBlackPen setUsage:10];
    [firstBlackPen printDescription];
    NXPen *secondBlackPen = [[NXPen alloc]initWithBrand:@"monami"];
    [secondBlackPen setColor:@"BLACk" ];
    [secondBlackPen setUsage:20];
    [secondBlackPen printDescription];
    NXPen *thirdBlackPen = [[NXPen alloc]initWithBrand:@"monami"];
    [thirdBlackPen setColor:@"BLACk" ];
    [thirdBlackPen setUsage:30];
    [thirdBlackPen printDescription];
    NXPen *fourthBlackPen = [[NXPen alloc]initWithBrand:@"monami"];
    [fourthBlackPen setColor:@"BLACk" ];
    [fourthBlackPen setUsage:40];
    
    NXDisplayFile *currentFiles = [[NXDisplayFile alloc]init];
    [currentFiles NXDisplayAllFilesAtPath:@"/Users/JoyLee/Documents"
                        filterByExtension:@".mov"];
    return 0;
}