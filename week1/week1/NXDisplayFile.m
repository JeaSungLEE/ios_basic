//
//  NXDisplayFile.m
//  week1
//
//  Created by 이재성 on 2016. 3. 2..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "NXDisplayFile.h"

@implementation NXDisplayFile

-(void)NXDisplayAllFilesAtPath:(NSString*)path filterByExtension:(NSString*)extension{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    NSArray *shallowFileList = [fileManager contentsOfDirectoryAtPath:path error:nil];
    NSArray *deepFileList = [fileManager subpathsOfDirectoryAtPath:path error:nil];
    NSLog(@"\n\n(shallow search)AllfilesList: %@ \n (shallow search)AllFilesListEnd",shallowFileList);
    NSLog(@"\n\n(Deep search)AllfilesList: %@ \n (Deep search)AllFilesListEnd",deepFileList);
    
    
    NSArray *shallowExtensionList = [shallowFileList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH %@",extension]];
    NSLog(@"\n\(Shallow search)nextension List: %@ \n (Shallow search)extensionListEnd",shallowExtensionList);
    NSArray *deepExtensionList = [deepFileList filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self ENDSWITH %@",extension]];
    NSLog(@"\n\(Deep search)nextension List: %@ \n (Deep search)extensionListEnd",deepExtensionList);
}
@end
