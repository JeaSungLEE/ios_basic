//
//  ViewController.m
//  week9
//
//  Created by 이재성 on 2016. 4. 27..
//  Copyright © 2016년 JoyLee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)wordCount:(NSString*)contents{
    JSData* jsd = [[JSData alloc]init];
    [jsd jsonToUrl];
    _dataArray=[jsd itemArray];
    __block int countArray[_dataArray.count];
    __block int max=0,min=0,sum=0;
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    for(int i=0;i<_dataArray.count;i++){
    [queue addOperationWithBlock: ^{
    
        countArray[i]=[self countOfSubstring:_dataArray[i] atContents:contents];
        sum+=countArray[i];
        if(countArray[i]>countArray[max])
            max=i;
        if(countArray[i]<countArray[min])
            min=i;
    
    }];
    }
    // 전부 오퍼레이션이 끝날때까지 대기.
  
    [[[UIAlertView alloc]initWithTitle:@"완료" message:[NSString stringWithFormat:@"최대 %d개,%@\n최소%d개,%@\n전체 %d개",countArray[max],_dataArray[max],countArray[min],_dataArray[min],sum] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];

}

-(NSUInteger)countOfSubstring:(NSString*)substring atContents:(NSString*)contents {
    NSRegularExpression *re = [[NSRegularExpression alloc]initWithPattern:[NSString stringWithFormat:@"(%@)",substring] options:0 error:nil];
    NSUInteger numberOfMatches = [re numberOfMatchesInString:contents options:0 range:NSMakeRange(0, [contents length])];
    return numberOfMatches;
}
- (IBAction)minmaxCountBtn:(id)sender {
    NSString *bookfile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bookfile" ofType:@".txt"] encoding:NSUTF8StringEncoding error:nil];
    [self wordCount:bookfile];
}

- (IBAction)countBtn:(id)sender {
    NSString *bookfile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bookfile" ofType:@".txt"] encoding:NSUTF8StringEncoding error:nil];
    [[[UIAlertView alloc]initWithTitle:@"완료" message:[NSString stringWithFormat:@"찾았다 %lu개",(unsigned long)[self countOfSubstring:@"유시민" atContents:bookfile]] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];

    
}

- (IBAction)touchBtn:(id)sender {
    _progressBar.progress = 0;
    dispatch_queue_t aQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(aQueue, ^{
        [self workingProgress];
    });
}
-(void)workingProgress {
    NSString *bookfile = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bookfile" ofType:@".txt"] encoding:NSUTF8StringEncoding error:nil];
    int length = bookfile.length;
    int spaceCount = 0;
    float progress = 0;
    unichar aChar;
    for (int nLoop=0; nLoop<length; nLoop++){
        aChar = [bookfile characterAtIndex:nLoop];
        if(aChar==' ')spaceCount++;
        progress = (float)nLoop / (float)length;
        dispatch_async(dispatch_get_main_queue(), ^{
            _progressBar.progress = progress;});
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[[UIAlertView alloc]initWithTitle:@"완료" message:[NSString stringWithFormat:@"찾았다 %d개",spaceCount] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]show];
    });
}
      
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
