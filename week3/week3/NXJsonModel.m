//
//  NXJsonModel.m
//  week3
//
//  Created by 이재성 on 2016. 3. 16..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "NXJsonModel.h"
@implementation NXJsonModel
-(NSArray*)jsonArray{
    NSString* jsonString =@"[{\"title\":\"\uc0c8\uae001\",\"image\":\"01.jpg\",\"content\":\"\uc601\ud654\ubcf4\ub7ec\uac00\uc790\",\"comments\":[{\"id\":1,\"user\":\"jobs\",\"comment\":\"apple\"},{\"id\":4,\"user\":\"cook\",\"comment\":\"apple\"}]},{\"title\":\"\ud1a0\uc774\uc2a4\ud1a0\ub9ac\",\"image\":\"02.jpg\",\"content\":\"Pixar\",\"comments\":[]},{\"title\":\"ToyStory\",\"image\":\"03.jpg\",\"content\":\"\uc6b0\ub514\uac00\ucd5c\uace0\",\"comments\":[{\"id\":2,\"user\":\"bill\",\"comment\":\"Microsoft\"}]},{\"title\":\"\uadf9\uc7a5\uc740\",\"image\":\"04.jpg\",\"content\":\"\uc5b4\ub514\ub85c\",\"comments\":[{\"id\":4,\"user\":\"cook\",\"comment\":\"apple\"}]}]";
    NXJsonModel* jsonModel = [[NXJsonModel alloc]init];
    NSData* jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
}
@end
