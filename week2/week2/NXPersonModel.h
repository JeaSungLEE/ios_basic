//
//  NXPersonModel.h
//  week2
//
//  Created by 이재성 on 2016. 3. 9..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NXPersonModel : NSObject{
}

@property() NSString* personName;
@property() NSNumber* personNumber;
@property() BOOL isMale;
@property() NSNumber* personTeam;
@property() NSMutableDictionary* personDict;
@property() NSMutableArray* personsArray;

- (NSString*)personNameAtIndex:(int)index;
- (NSNumber*)personNumberAtIndex:(int)index;
- (BOOL)isMaleAtIndex:(int)index;
- (NSNumber*)personTeamAtIndex:(int)index;
- (NSDictionary*)getPersonObjectAtIndex:(int)index;
- (NSString*) findPersonNameByNumber:(NSNumber*)number;
@end