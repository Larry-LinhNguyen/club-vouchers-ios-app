//
//  login.h
//  Clubvouchers
//
//  Created by pnf on 9/28/15.
//  Copyright © 2015 pnf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface login : UIViewController<UITextFieldDelegate>
{
    
    NSMutableString* mstring;
    UILabel *Title;
    
    
    UITextField *PIN1;
    UITextField *PIN2;
    UITextField *PIN3;
    UITextField *PIN4;
    UITextField *PIN5;
    
    NSMutableDictionary *dict;
    UIImageView *loaderView;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;

 
    BOOL checkcurrenttextfield;
    
   BOOL Not_P;
}

- (NSString *)makeCallPostData_ALL:(NSString *)dict :(NSString *)STR_URL;

@end
