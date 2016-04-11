//
//  JSDataModel.m
//  MidTerm
//
//  Created by 이재성 on 2016. 4. 11..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "JSDataModel.h"

@implementation JSDataModel

char *data = "[{\"title\":\"초록\",\"image\":\"01.jpg\",\"date\":\"20150116\"},\ {\"title\":\"장미\",\"image\":\"02.jpg\",\"date\":\"20160505\"},\ {\"title\":\"낙엽\",\"image\":\"03.jpg\",\"date\":\"20141212\"},\ {\"title\":\"계단\",\"image\":\"04.jpg\",\"date\":\"20140301\"},\ {\"title\":\"벽돌\",\"image\":\"05.jpg\",\"date\":\"20150101\"},\ {\"title\":\"바다\",\"image\":\"06.jpg\",\"date\":\"20150707\"},\ {\"title\":\"벌레\",\"image\":\"07.jpg\",\"date\":\"20140815\"},\ {\"title\":\"나무\",\"image\":\"08.jpg\",\"date\":\"20161231\"},\ {\"title\":\"흑백\",\"image\":\"09.jpg\",\"date\":\"20150102\"},\ {\"title\":\"나비\",\"image\":\"10.jpg\",\"date\":\"20141225\"}]";

-(void)jsonToArray{
    NSData* jsonData = [NSData dataWithBytes:data length:strlen(data)];
    _itemArray = [NSJSONSerialization JSONObjectWithData:jsonData options:nil error:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification"
                                                        object:nil
                                                      userInfo:nil];
}
-(void)sortArray{
    NSData* jsonData = [NSData dataWithBytes:data length:strlen(data)];
    _itemArray = [NSJSONSerialization JSONObjectWithData:jsonData options:nil error:nil];
    NSSortDescriptor *sorter = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:YES];
    _itemArray = [_itemArray sortedArrayUsingDescriptors:@[sorter]];

    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification2"
                                                        object:nil
                                                      userInfo:nil];
}
@end
