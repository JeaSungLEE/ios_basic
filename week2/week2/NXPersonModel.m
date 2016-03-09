//
//  NXPersonModel.m
//  week2
//
//  Created by 이재성 on 2016. 3. 9..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "NXPersonModel.h"

@implementation NXPersonModel


- (NSString*)personNameAtIndex:(int)index{
    _personName=[[_personsArray objectAtIndex:index]substringToIndex:3];
    return _personName;
}

- (NSNumber*)personNumberAtIndex:(int)index{
    _personNumber=[[_personsArray objectAtIndex:index]substringWithRange:NSMakeRange(4, 6)];
    return _personNumber;
}
- (BOOL)isMaleAtIndex:(int)index{
    _isMale=[[[_personsArray objectAtIndex:index]substringWithRange:NSMakeRange(11, 1)] isEqualToString:@"M" ];
    if(_isMale==YES){
        return YES;
    }else
        return NO;
}
- (NSNumber*)personTeamAtIndex:(int)index{
    _personTeam=[[_personsArray objectAtIndex:index]substringWithRange:NSMakeRange(13, 1)];
    return _personTeam;
}
- (NSDictionary*)getPersonObjectAtIndex:(int)index{
    return [_personDict objectForKey:[NSString stringWithFormat:@"%d",index]];
}

- (NSString*) findPersonNameByNumber:(NSNumber*)number{
    return nil;
}

@end
