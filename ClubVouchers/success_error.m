//
//  success_error.m
//  ClubMerchant
//
//  Created by pnf on 4/7/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "success_error.h"
#import "dashboard.h"
@interface success_error ()

@end

@implementation success_error
@synthesize status;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor= [UIColor whiteColor];
    status = @"false";
    UIView *header  =[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    [header setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:header];
    
    UILabel *welcome = [[UILabel alloc]initWithFrame:CGRectMake(10, 30, 100, 22)];
    welcome.text = @"Scanning";
    [welcome setTextColor:[UIColor whiteColor]];
    [welcome setBackgroundColor:[UIColor clearColor]];
    welcome.font = [UIFont fontWithName:@"Helvetica" size:18];
    [self.view addSubview:welcome];
    
    UIButton *Logout = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width-70, 30, 60, 22)];
    [Logout setTitle:@"Logout" forState:UIControlStateNormal];
    [Logout setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [Logout setBackgroundColor:[UIColor clearColor]];
    [Logout.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:18]];
    [Logout addTarget:self action:@selector(action_Logout) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Logout];
        
    UILabel *voucherid = [[UILabel alloc] initWithFrame:CGRectMake(40, 80 ,self.view.frame.size.width-80, 22)];
    voucherid.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"eVoucher_id"];
    voucherid.textColor = [UIColor blackColor];
    voucherid.font = [UIFont fontWithName:@"Helvetica" size:18];
    voucherid.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:voucherid];
    
    UILabel *voucherstatus = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, voucherid.frame.origin.y+voucherid.frame.size.height+5 ,300, 20)];
    if ([status isEqualToString:@"true"]) {
        voucherstatus.text = @"Redeemed Successfully";
    }else{
        voucherstatus.text = @"Error Redeeming";
    }
    voucherstatus.textColor = [UIColor redColor];
    voucherstatus.font = [UIFont fontWithName:@"Helvetica" size:16];
    voucherstatus.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:voucherstatus];
    
    UIImageView *tick;
    if (![status isEqualToString:@"true"]) {
    //add message
    UILabel *message1 = [[UILabel alloc] initWithFrame:CGRectMake(20, voucherstatus.frame.origin.y+voucherstatus.frame.size.height ,self.view.frame.size.width-40, 16)];
    message1.text = @"Try again or use manual redemption";
    message1.textColor = [UIColor blackColor];
    message1.font = [UIFont fontWithName:@"Helvetica" size:10];
    message1.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message1];
    
    //add message
    UILabel *message2 = [[UILabel alloc] initWithFrame:CGRectMake(20, message1.frame.origin.y+message1.frame.size.height ,self.view.frame.size.width-40, 16)];
    message2.text = @"from another computer";
    message2.textColor = [UIColor blackColor];
    message2.font = [UIFont fontWithName:@"Helvetica" size:10];
    message2.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message2];
        
        tick = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-138)/2,  message2.frame.origin.y+message2.frame.size.height +20, 138, 138)];
        tick.image = [UIImage imageNamed:@"close.png"];
        [self.view addSubview:tick];
    
    }else{
    
        tick = [[UIImageView alloc]initWithFrame:CGRectMake((self.view.frame.size.width-138)/2,  voucherstatus.frame.origin.y+voucherstatus.frame.size.height+20, 138, 138)];
        tick.image = [UIImage imageNamed:@"tick.png"];
        [self.view addSubview:tick];
    }
    UIButton *ScanQRButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [ScanQRButton setFrame:CGRectMake(40, tick.frame.origin.y+tick.frame.size.height +20, self.view.frame.size.width-80, 40)];
    [ScanQRButton setTitle:@"Scan Another" forState: UIControlStateNormal];
    [ScanQRButton setBackgroundColor:[UIColor colorWithRed:0.0f/255.0f green:185.0f/255.0f blue:124.0f/255.0f alpha:1.0]];
    [ScanQRButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ScanQRButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0]];
    ScanQRButton.layer.cornerRadius = 5; // this value vary as per your desire
    ScanQRButton.clipsToBounds = YES;
    [ScanQRButton addTarget:self action:@selector(action_Scan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ScanQRButton];
    
}
- (void)action_Scan{
    dashboard *objdashboard=[[dashboard alloc]init];
    [self.navigationController pushViewController:objdashboard animated:YES];
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1111)
    {
        if (buttonIndex==1) {
            
            [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"user_id"];
            [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"token"];
            [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"business_name"];
            [[NSUserDefaults standardUserDefaults]setValue:@"" forKey:@"business_identify_id"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            
        }
    }
}

- (void)action_Logout{
    
    
    UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Please Confirm" message:@"Are you sure you want to log out?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes",nil];
    alter.tag=1111;
    
    [alter show];
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
