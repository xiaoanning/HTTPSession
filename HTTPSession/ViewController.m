//
//  ViewController.m
//  HTTPSession
//
//  Created by 安宁 on 2017/7/31.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "ViewController.h"
#import "HTTPCookiesUtil.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    
    [self testHttp];
}

static int i = 0 ;
-(void)testHttp
{
    i += 1 ;
    
    if (i == 3 )
    {
        return ;
    }

    __weak __block typeof(self) weakSelf = self ;
    
    [HTTPCookiesUtil setCookieWithName:@"JSESSIONID" value:@"120" domain:@"test.hccb.cc" originURL:@"test.hccb.cc" path:@"/" version:@"1" expiresDate:@"2017-07-31 02:54:32 +0000" createdDate:@"2017-07-31 02:44:32 +0000" sessionOnly:YES isSecure:YES];
    
    NSURLSessionConfiguration * configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    [configuration setHTTPShouldSetCookies:YES];
    NSURLSession * session = [NSURLSession sessionWithConfiguration:configuration];

    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://test.hccb.cc"] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:5];

    NSURLSessionTask * task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@", [HTTPCookiesUtil getCookies]);
        
        [weakSelf testHttp];
        
    }];
    
    [task resume];
    

}

@end
