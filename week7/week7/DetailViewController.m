//
//  DetailViewController.m
//  week7
//
//  Created by 이재성 on 2016. 4. 20..
//  Copyright © 2016년 이재성. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <NSStreamDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *detailImageView;

@end

@implementation DetailViewController
NSOutputStream *outputStream;
#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)readRequestToServer:(NSString*)hostAddress {
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    
    CFStreamCreatePairWithSocketToHost(NULL,
                                       (__bridge CFStringRef)hostAddress,
                                       8000, &readStream, &writeStream);
    NSInputStream *inputStream = (__bridge_transfer NSInputStream *)readStream;
    outputStream = (__bridge_transfer NSOutputStream *)writeStream;
    [inputStream setDelegate:self];
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [inputStream open];
    [outputStream setDelegate:self];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream open];
}

- (void)stream:(NSStream *)stream handleEvent:(NSStreamEvent)eventCode {
    switch(eventCode) {
        case NSStreamEventHasBytesAvailable:
        {
            uint8_t buf[8];
            unsigned int len = 0;
            len=[(NSInputStream *)stream read:buf maxLength:8];
            int length = atol((const char *)buf);
            if(len) {
                uint8_t buffer[length];
                len=[(NSInputStream *)stream read:buffer maxLength:length];
                if(len) {
                    _image = [NSMutableData dataWithBytesNoCopy:buffer length:length freeWhenDone:NO];
                    _detailImageView.image = [UIImage imageWithData:_image];
                    // bytesRead is an instance variable of type NSNumber.
                    NSString* str = @"ACK";
                    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
                    uint8_t *readBytes = (uint8_t *)[data bytes];
                    length = data.length;
                    uint8_t buff[length];
                    (void)memcpy(buff, readBytes, length);
                    len = [(NSOutputStream *)outputStream write:(const uint8_t *)buff maxLength:length];
                    break;
                }
            } else {
                NSLog(@"no buffer!");
            }
            break;
            
        }
        case NSStreamEventEndEncountered:
        {
            [stream close];
            [stream removeFromRunLoop:[NSRunLoop currentRunLoop]
                              forMode:NSDefaultRunLoopMode];
            stream = nil; // stream is ivar, so reinit it
            break;
        }
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self readRequestToServer:@"127.0.0.1"];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
