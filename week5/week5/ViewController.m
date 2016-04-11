//
//  ViewController.m
//  week5
//
//  Created by 이재성 on 2016. 3. 30..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize cardDeck;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *refresh = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    NSArray *udCardDeck = [[NSArray alloc]initWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:@"cardDeck"]];
    
    if([udCardDeck count]==0){
        [self buttonPressed];
    }else{
        [self showCard];
    }
    
    refresh.frame = CGRectMake(600, 600, 200, 200);
    [refresh setTitle:[NSString stringWithFormat:@"refresh"]forState:UIControlStateNormal];
    [refresh setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:refresh];
    
    [refresh addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchDown];
}
-(void)buttonPressed{
    SolitaireDeck* solitaireDeck = [[SolitaireDeck alloc]init];
    cardDeck = [solitaireDeck shuffleCards];
    [self showCard];
}
-(void)viewWillAppear:(BOOL)animated{
    [self showCard];
  }

-(void)showCard{
    SolitaireDeck* solitaireDeck = [[SolitaireDeck alloc]init];
    [solitaireDeck displayCards];
    int pickCard;
    for(int i=0;i<7;i++){
        for(int j=0;j<=i;j++){
            pickCard = [[[cardDeck objectAtIndex:i]objectAtIndex:j] integerValue];
            UIImage *image = [UIImage imageNamed:[solitaireDeck cardType:pickCard]];
            UIImageView *cardImage = [[UIImageView alloc] initWithImage:image];
            [cardImage setFrame:CGRectMake(26+i*140, 100+j*40, 130, 150)];
            [self.view addSubview:cardImage];
        }
    }
    
    for(int i=0;i<25;i++){
        pickCard = [[[cardDeck objectAtIndex:7]objectAtIndex:i] integerValue];
        UIImage *image = [UIImage imageNamed:[solitaireDeck cardType:pickCard]];
        UIImageView *cardImage = [[UIImageView alloc] initWithImage:image];
        [cardImage setFrame:CGRectMake(26+i*24, 500, 130, 150)];
        [self.view addSubview:cardImage];
    }
    
    [solitaireDeck.cardArray release];
    [solitaireDeck release];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
