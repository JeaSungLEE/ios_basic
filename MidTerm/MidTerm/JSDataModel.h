//
//  JSDataModel.h
//  MidTerm
//
//  Created by 이재성 on 2016. 4. 11..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"

@interface JSDataModel : NSObject

@property() NSMutableArray* itemArray;
-(void)jsonToArray;
-(void)sortArray;
-(void)jsonToUrl;
@end
