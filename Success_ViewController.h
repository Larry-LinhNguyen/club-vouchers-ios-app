//
//  Success_ViewController.h
//  ClubVouchers
//
//  Created by Bhushan Bawa on 05/10/15.
//  Copyright © 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Success_ViewController : UIViewController<UIAlertViewDelegate>{
    NSMutableDictionary *dict;
    
    
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
    
    UIButton *RedeemButton;
    UIButton *LogoutButton;
 
    UILabel *voucherstatus;
    UILabel *message ;
    UILabel *authTitle;
    UILabel *voucherid;
    UILabel *vouchertype;
    
    UILabel *voucherprice;
    UILabel *custname;
    UILabel *custacctno;
    UILabel *buygetdate;
    UILabel *expirydate;
}

@property (strong, nonatomic) NSString *bar_code;



@end
