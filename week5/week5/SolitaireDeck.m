//
//  SolitaireDeck.m
//  week5
//
//  Created by 이재성 on 2016. 3. 30..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "SolitaireDeck.h"

@implementation SolitaireDeck
@synthesize cardArray;
@synthesize cardDeck;

-(void)cardMake{
    cardDeck= [[NSMutableArray alloc]initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52", nil];
}

-(NSString*)pickCard{
    int randPick=arc4random_uniform([cardDeck count]);
    NSString *cardPick = [cardDeck objectAtIndex:randPick];
    [cardDeck removeObjectAtIndex:randPick];
    return cardPick;
}

-(NSMutableArray*)shuffleCards{
    cardArray = [[NSMutableArray alloc]init];
    [self cardMake];
    
    
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],nil] atIndex:0];
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],[self pickCard],nil] atIndex:1];
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],[self pickCard],[self pickCard],nil] atIndex:2];
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],[self pickCard],[self pickCard],[self pickCard],nil] atIndex:3];
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],nil] atIndex:4];
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],nil] atIndex:5];
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],nil] atIndex:6];
    [cardArray insertObject:[NSArray arrayWithObjects:[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],[self pickCard],nil] atIndex:7];
    [cardDeck release];
    return cardArray;
}

-(void)displayCards{
    NSLog(@"%@",cardArray);
}

-(NSString*)cardType:(int)card{
    switch (card) {
        case 1:
            return @"cA";
        case 2:
            return @"c2";
        case 3:
            return @"c3";
        case 4:
            return @"c4";
        case 5:
            return @"c5";
        case 6:
            return @"c6";
        case 7:
            return @"c7";
        case 8:
            return @"c8";
        case 9:
            return @"c9";
        case 10:
            return @"cJ";
        case 11:
            return @"cQ";
        case 12:
            return @"cK";
        case 13:
            return @"dA";
        case 14:
            return @"d2";
        case 15:
            return @"d3";
        case 16:
            return @"d4";
        case 17:
            return @"d5";
        case 18:
            return @"d6";
        case 19:
            return @"d7";
        case 20:
            return @"d8";
        case 21:
            return @"d9";
        case 22:
            return @"dJ";
        case 23:
            return @"dQ";
        case 24:
            return @"dK";
        case 25:
            return @"hA";
        case 26:
            return @"h2";
        case 27:
            return @"h3";
        case 28:
            return @"h4";
        case 29:
            return @"h5";
        case 30:
            return @"h6";
        case 31:
            return @"h7";
        case 32:
            return @"h8";
        case 33:
            return @"h9";
        case 34:
            return @"hJ";
        case 35:
            return @"hQ";
        case 36:
            return @"hK";
        case 37:
            return @"sA";
        case 38:
            return @"s2";
        case 39:
            return @"s3";
        case 40:
            return @"s4";
        case 41:
            return @"s5";
        case 42:
            return @"s6";
        case 43:
            return @"s7";
        case 44:
            return @"s8";
        case 45:
            return @"s9";
        case 46:
            return @"sJ";
        case 47:
            return @"sQ";
        case 48:
            return @"sK";
        case 49:
            return @"c10";
        case 50:
            return @"d10";
        case 51:
            return @"h10";
        case 52:
            return @"s10";
        default:
            return @"";
    }
}
@end

