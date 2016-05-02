//
//  JSData.m
//  week9
//
//  Created by 이재성 on 2016. 4. 27..
//  Copyright © 2016년 JoyLee. All rights reserved.
//

#import "JSData.h"
NSData *jsonData;

@implementation JSData
-(void)jsonToUrl{
    NSURL *url = [NSURL URLWithString:@"http://125.209.194.123/wordlist.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSData *jsonData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    //    NSData* jsonData = [NSData dataWithBytes:data length:strlen(data)];
    _itemArray = [NSJSONSerialization JSONObjectWithData:jsonData options:nil error:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notification"
                                                        object:nil
                                                      userInfo:nil];
}
@end
