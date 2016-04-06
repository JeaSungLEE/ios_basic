//
//  SolitaireDeck.h
//  week5
//
//  Created by 이재성 on 2016. 3. 30..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SolitaireDeck : NSObject
@property(strong, nonatomic)NSMutableArray* cardArray;
@property(strong,nonatomic)NSMutableArray* cardDeck;

-(NSString*)cardType:(int)card;
-(NSMutableArray*)shuffleCards;
-(void)displayCards;
-(void)cardMake;
@end
