//
//  NXDisplayFile.m
//  week1
//
//  Created by 이재성 on 2016. 3. 2..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "NXDisplayFile.h"

@implementation NXDisplayFile

-(void)NXDisplayAllFilesAtPath:(NSString*)path{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSArray *filelist = [fileManager contentsOfDirectoryAtPath: path error:NULL];
    _filelist=filelist;
    NSLog(@"\n\nAllfilesList: %@ \n AllFilesListEnd",filelist);
}

-(void) filterByExtension:(NSString*)extension{
     NSArray *extensionList = [_filelist filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH %@",extension]];
    NSLog(@"\n\nextension List: %@ \n extensionListEnd",extensionList);
}
@end
