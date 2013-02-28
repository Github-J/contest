//
//  FirstViewController.h
//  2zakura
//
//  Created by 伊東 純平 on 2013/02/26.
//  Copyright (c) 2013年 伊東 純平. All rights reserved.
//
#import <AVFoundation/AVFoundation.h>
@interface FirstViewController : UIViewController <UIActionSheetDelegate,UIWebViewDelegate>{
    
    AVAudioPlayer *bgm;
    IBOutlet UIWebView *Home;
    

    
    
   
}


@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)presentMenu:(id)sender;
@end
