//
//  dashboard.h
//  Clubvouchers
//
//  Created by pnf on 9/28/15.
//  Copyright © 2015 pnf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Success_ViewController.h"
#import "MTBBarcodeScanner.h"
@interface dashboard : UIViewController

{
    Success_ViewController *objSuccess;
    MTBBarcodeScanner *scanner;
    UIView *cameraInput;
}

@property (strong, nonatomic) NSArray *scanner;

@end
