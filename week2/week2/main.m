//
//  main.m
//  week2
//
//  Created by 이재성 on 2016. 3. 9..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "NXPersonModel.h"

int main(int argc, const char * argv[]) {
    
    NSURL *URL = [NSURL fileURLWithPath:@"/Users/JoyLee/Desktop/persons.txt"];
    NSString *content = [NSString stringWithContentsOfURL:URL encoding:NSUTF8StringEncoding error:nil];
    NSMutableArray *persons = [[NSMutableArray alloc]initWithArray:[content componentsSeparatedByString:@"\n"]];
    NSLog(@"%@", persons);
    
    NSMutableDictionary *personDict = [[NSMutableDictionary alloc]init];
    NSMutableDictionary *personsDict = [[NSMutableDictionary alloc]init];
    NXPersonModel *Person = [[NXPersonModel alloc]init];
    [Person setPersonsArray:persons];
    NSUInteger count = [persons count];
    for (int index=0; index<count; index++) {
        NSLog(@"%@",[Person personNameAtIndex:index]);
        NSLog(@"%@",[Person personNumberAtIndex:index]);
        NSLog(@"%@",[Person personTeamAtIndex:index]);
        NSLog([Person isMaleAtIndex:index]?@"YES":@"NO");
        [personDict setObject:[Person personName] forKey:@"name"];
        [personDict setObject:[Person personNumber] forKey:@"number"];
        [personDict setObject:[Person personTeam] forKey:@"team"];
        [personDict setObject:[Person isMale]?@"M":@"F" forKey:@"isMale"];
        [personsDict setObject:personDict forKey:[NSString stringWithFormat:@"%d",index]];
    }
    [Person setPersonDict:personsDict];
    
    for (int index=0; index<count; index++) {
        NSLog(@"%@",[Person getPersonObjectAtIndex:1]);
    }
    return 0;
}