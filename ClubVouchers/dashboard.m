//
//  dashboard.m
//  Clubvouchers
//
//  Created by pnf on 9/28/15.
//  Copyright © 2015 pnf. All rights reserved.
//

#import "dashboard.h"
#import "login.h"
#import "MTBBarcodeScanner.h"
#import "JSON.h"



@interface dashboard ()

@end

@implementation dashboard

-(void) action_Logout{
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"user_id"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"token"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"business_name"];
    [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"business_identify_id"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    login *objlogin=[[login alloc]init];
    [self.navigationController pushViewController:objlogin animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
        
    //set background color
    self.view.backgroundColor= [UIColor whiteColor];
    
    UIView *header  =[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    [header setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:header];
    
    UIButton *Logout = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-70, 30, 60, 22)];
    [Logout setTitle:@"Logout" forState:UIControlStateNormal];
    [Logout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Logout setBackgroundColor:[UIColor clearColor]];
    [Logout.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [Logout addTarget:self action:@selector(action_Logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Logout];
    
    UILabel *businessName =[[UILabel alloc]init];
    businessName.frame=CGRectMake((self.view.frame.size.width-350)/2, header.frame.origin.y+header.frame.size.height+10, 350, 20);
    businessName.textColor=[UIColor colorWithRed:105/256.0 green:105/256.0 blue:105/256.0 alpha:1.0];
    businessName.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"business_name"];
    businessName.font = [UIFont fontWithName:@"Helvetica" size:16];
    businessName.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:businessName];
    
    UILabel *businessId =[[UILabel alloc]init];
    businessId.frame=CGRectMake((self.view.frame.size.width-350)/2, businessName.frame.origin.y+businessName.frame.size.height+10, 350, 20);
    businessId.textColor=[UIColor colorWithRed:105/256.0 green:105/256.0 blue:105/256.0 alpha:1.0];
    businessId.text=[[NSUserDefaults standardUserDefaults]valueForKey:@"business_identify_id"];
    businessId.font = [UIFont fontWithName:@"Helvetica" size:16];
    businessId.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:businessId];
    
    cameraInput  =[[UIView alloc]initWithFrame:CGRectMake(0, businessId.frame.origin.y+businessId.frame.size.height+20, self.view.frame.size.width, self.view.frame.size.height-(header.frame.origin.y+header.frame.size.height+190))];
    [cameraInput setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:cameraInput];
    
    
    UILabel *pointlabel =[[UILabel alloc]init];
    pointlabel.frame=CGRectMake((self.view.frame.size.width-350)/2, self.view.frame.size.height-100, 350, 18);
    pointlabel.textColor=[UIColor colorWithRed:105/256.0 green:105/256.0 blue:105/256.0 alpha:1.0];
    pointlabel.text=@"Point the camera";
    pointlabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    pointlabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:pointlabel];
    
    UILabel *btnlabel =[[UILabel alloc]init];
    btnlabel.frame=CGRectMake((self.view.frame.size.width-350)/2, self.view.frame.size.height-84, 350, 18);
    btnlabel.textColor=[UIColor colorWithRed:105/256.0 green:105/256.0 blue:105/256.0 alpha:1.0];
    btnlabel.text=@"and click button to activate Scanning";
    btnlabel.font = [UIFont fontWithName:@"Helvetica" size:14];
    btnlabel.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:btnlabel];
    
    
    UIButton *ScanQRButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [ScanQRButton setFrame:CGRectMake(40, self.view.frame.size.height-50, self.view.frame.size.width-80, 40)];
    [ScanQRButton setTitle:@"Scan QR Code" forState: UIControlStateNormal];
    [ScanQRButton setBackgroundColor:[UIColor colorWithRed:0.0f/255.0f green:185.0f/255.0f blue:124.0f/255.0f alpha:1.0]];
    [ScanQRButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ScanQRButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0]];
    ScanQRButton.layer.cornerRadius = 5; // this value vary as per your desire
    ScanQRButton.clipsToBounds = YES;
    [ScanQRButton addTarget:self action:@selector(action_Scan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ScanQRButton];
    
}


- (void)viewWillAppear:(BOOL)animated {
    
   
    scanner = [[MTBBarcodeScanner alloc] initWithPreviewView:cameraInput];
    
    [MTBBarcodeScanner requestCameraPermissionWithSuccess:^(BOOL success) {
        if (success) {
            
            [scanner startScanningWithResultBlock:^(NSArray *codes) {
                
                
                                         }];

            
            
            
        } else {
            
        }
    }];

}

-(void) action_Scan{
    [scanner startScanningWithResultBlock:^(NSArray *codes) {
        AVMetadataMachineReadableCodeObject *code = [codes firstObject];
        NSLog(@"Found code: %@", code.stringValue);
        
        [scanner stopScanning];
        if(![code.stringValue isEqualToString:@""])
            
            [[NSUserDefaults standardUserDefaults]setValue:code.stringValue forKey:@"bar_code"];
            [[NSUserDefaults standardUserDefaults]synchronize];
        
        objSuccess = [[Success_ViewController alloc]init];
        [self.navigationController pushViewController:objSuccess animated:YES];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
