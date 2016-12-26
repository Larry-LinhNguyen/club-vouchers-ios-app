//
//  ConfirmRedeem.h
//  ClubMerchant
//
//  Created by pnf on 4/7/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConfirmRedeem : UIViewController<UIAlertViewDelegate>{
    NSMutableDictionary *mUserResponseDict;
    UIActivityIndicatorView *spinner;
    UIAlertView *alert;
    UIView *loader;
    UILabel *ActivityLabel;
}

@end
