//
//  FirstViewController.m
//  2zakura
//
//  Created by 伊東 純平 on 2013/02/26.
//  Copyright (c) 2013年 伊東 純平. All rights reserved.
//

#import "SVProgressHUD.h"
#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 「http://classmethod.jp/」の読み込みを開始する
    NSURLRequest *req = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www49.atpages.jp/poritan6479/html/kokoroe.php"]];
    [self.webView loadRequest:req];
}

- (void)webViewDidStartLoad:(UIWebView*)webView{
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [SVProgressHUD showWithStatus:@"ロード中です…。" maskType:SVProgressHUDMaskTypeGradient];
    NSString *bgmPath = [[NSBundle mainBundle]
                         pathForResource:@"Kokoroe" ofType:@"mp3"];
    NSURL *bgmUrl = [NSURL fileURLWithPath:bgmPath];
    bgm = [[AVAudioPlayer alloc] initWithContentsOfURL:bgmUrl error:nil];
    [bgm setNumberOfLoops:-1]; // 0なら1回だけ。－1ならエンドレスリピート。
    [bgm play];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [bgm stop];
    [super viewWillDisappear:animated];
}

-(void)webViewDidFinishLoad:(UIWebView*)webView{
    //[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [SVProgressHUD dismiss];
    
}

// ページ読込エラー時に呼ばれるデリゲートメソッド
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    // 4.読み込みに失敗した旨を表示し、SVProgressHUDを非表示にする
    [SVProgressHUD showErrorWithStatus:@"ロード失敗．．．"];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
