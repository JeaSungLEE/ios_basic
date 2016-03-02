//
//  NXDisplayFile.h
//  week1
//
//  Created by 이재성 on 2016. 3. 2..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXDisplayFile : NSObject{
}
-(void)NXDisplayAllFilesAtPath:(NSString*)path filterByExtension:(NSString*)extension;
@end
