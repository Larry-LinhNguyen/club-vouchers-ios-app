//
//  ConfirmRedeem.m
//  ClubMerchant
//
//  Created by pnf on 4/7/16.
//  Copyright © 2016 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "ConfirmRedeem.h"
#import "login.h"
#import "JSON.h"
#import "success_error.h"
#import "dashboard.h"
@interface ConfirmRedeem ()

@end

@implementation ConfirmRedeem

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden=YES;
    self.view.backgroundColor= [UIColor whiteColor];
    
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

    
    //add message
    UILabel *message = [[UILabel alloc] initWithFrame:CGRectMake(20, 80 ,self.view.frame.size.width-40, 16)];
    message.text = @"DO NOT ACCEPT ALREADY REDEEMED EVOUCHERS";
    message.textColor = [UIColor redColor];
    message.font = [UIFont fontWithName:@"Helvetica" size:10];
    message.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message];
    
    //add message
    UILabel *message1 = [[UILabel alloc] initWithFrame:CGRectMake(20, message.frame.origin.y+message.frame.size.height ,self.view.frame.size.width-40, 16)];
    message1.text = @"Please check eVoucher status before redeeming";
    message1.textColor = [UIColor blackColor];
    message1.font = [UIFont fontWithName:@"Helvetica" size:10];
    message1.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message1];
    
    //add message
    UILabel *message2 = [[UILabel alloc] initWithFrame:CGRectMake(20, message1.frame.origin.y+message1.frame.size.height ,self.view.frame.size.width-40, 16)];
    message2.text = @"only Currrent eVouchers maybe redeemed";
    message2.textColor = [UIColor blackColor];
    message2.font = [UIFont fontWithName:@"Helvetica" size:10];
    message2.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message2];
    
    //add message
    UILabel *message3 = [[UILabel alloc] initWithFrame:CGRectMake(20, message2.frame.origin.y+message2.frame.size.height ,self.view.frame.size.width-40, 16)];
    message3.text = @"and cannot be used again";
    message3.textColor = [UIColor blackColor];
    message3.font = [UIFont fontWithName:@"Helvetica" size:10];
    message3.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message3];
    
    
    //add message
    UILabel *message4 = [[UILabel alloc] initWithFrame:CGRectMake(20, message3.frame.origin.y+message3.frame.size.height+10 ,self.view.frame.size.width-40, 18)];
    message4.text = @"ARE YOU SURE";
    message4.textColor = [UIColor blackColor];
    message4.font = [UIFont fontWithName:@"Helvetica" size:14];
    message4.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message4];
    
    //add message
    UILabel *message5 = [[UILabel alloc] initWithFrame:CGRectMake(20, message4.frame.origin.y+message4.frame.size.height ,self.view.frame.size.width-40, 18)];
    message5.text = @"YOU WISH TO CONTINUE";
    message5.textColor = [UIColor blackColor];
    message5.font = [UIFont fontWithName:@"Helvetica" size:14];
    message5.textAlignment= NSTextAlignmentCenter;
    [self.view addSubview:message5];
    
    CALayer *messagebottomBorder = [CALayer layer];
    messagebottomBorder.frame = CGRectMake(20, message5.frame.origin.y+message5.frame.size.height+10, self.view.frame.size.width-40, 1.0f);
    messagebottomBorder.backgroundColor = [UIColor colorWithRed:227.0f/255.0f green:226.0f/255.0f blue:227.0f/255.0f alpha:1.0].CGColor;
    [self.view.layer addSublayer:messagebottomBorder];
    
    
    
    //add voucher id
    UILabel *voucherid = [[UILabel alloc] initWithFrame:CGRectMake(40, messagebottomBorder.frame.origin.y+messagebottomBorder.frame.size.height+10 ,self.view.frame.size.width-80, 22)];
    voucherid.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"eVoucher_id"];
    voucherid.textColor = [UIColor blackColor];
    voucherid.font = [UIFont fontWithName:@"Helvetica" size:18];
    voucherid.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:voucherid];
    
    
    UILabel *voucherstatus = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, voucherid.frame.origin.y+voucherid.frame.size.height+5 ,300, 20)];
    voucherstatus.text = [[NSUserDefaults standardUserDefaults] valueForKey:@"eVoucher_status"];
    voucherstatus.textColor = [UIColor redColor];
    voucherstatus.font = [UIFont fontWithName:@"Helvetica" size:16];
    voucherstatus.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:voucherstatus];
    
    
    CALayer *currentLabelbottomBorder = [CALayer layer];
    currentLabelbottomBorder.frame = CGRectMake(20, voucherstatus.frame.origin.y+voucherstatus.frame.size.height+10, self.view.frame.size.width-40, 1.0f);
    currentLabelbottomBorder.backgroundColor = [UIColor colorWithRed:227.0f/255.0f green:226.0f/255.0f blue:227.0f/255.0f alpha:1.0].CGColor;
    [self.view.layer addSublayer:currentLabelbottomBorder];
    
    UIButton *RedeemButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [RedeemButton setFrame:CGRectMake(50, currentLabelbottomBorder.frame.origin.y+currentLabelbottomBorder.frame.size.height+15, self.view.frame.size.width-100, 40)];
    [RedeemButton setTitle:@"Confirm Redeem" forState: UIControlStateNormal];
    [RedeemButton setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:27.0f/255.0f alpha:1.0]];
    [RedeemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RedeemButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0]];
    RedeemButton.layer.cornerRadius = 5; // this value vary as per your desire
    RedeemButton.clipsToBounds = YES;
    [RedeemButton addTarget:self action:@selector(action_Redeem) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:RedeemButton];
    
    UIButton *ScanQRButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [ScanQRButton setFrame:CGRectMake(50, RedeemButton.frame.origin.y+RedeemButton.frame.size.height +10, self.view.frame.size.width-100, 40)];
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

- (void)CallServer

{
    
    login *objLogin = [[login alloc]init];
    NSString *responseString = [objLogin makeCallPostData_ALL:[NSString stringWithFormat:@"user_id=%@&token=%@&campaign_id=%@&redeem_btn=%@&eVoucher_status=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"user_id"],[[NSUserDefaults standardUserDefaults] valueForKey:@"token"],[[NSUserDefaults standardUserDefaults] valueForKey:@"bar_code"], @"redeemed",[[NSUserDefaults standardUserDefaults] valueForKey:@"eVoucher_status"]]:@"https://www.clubvouchers.com/api/redeem?"];
    
    NSLog(@"%@",responseString);
    
    
    NSDictionary *responseDict = [responseString JSONValue];
    NSMutableDictionary *dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
    
    if([[dict valueForKey:@"status"] isEqualToString:@"true"]){
        success_error *objsuccess_error=[[success_error alloc]init];
        objsuccess_error.status = @"true";
        [self.navigationController pushViewController:objsuccess_error animated:YES];
        
    }else{
        success_error *objsuccess_error=[[success_error alloc]init];
        objsuccess_error.status = @"false";
        [self.navigationController pushViewController:objsuccess_error animated:YES];
    }
    
    [loader removeFromSuperview];
    
}

#pragma mark - -*********************
#pragma mark Activity Indicater
#pragma mark - -*********************

-(void)mActivityIndicater
{
    loader = [[UIView alloc] initWithFrame:CGRectMake((self.view.frame.size.width-64)/2,(self.view.frame.size.height-64)/2,64,64)];
    
    loader.backgroundColor=[UIColor colorWithRed:61.0f/255.0f green:61.0f/255.0f blue:61.0f/255.0f alpha:1.0];
    loader.layer.cornerRadius=5;
    spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGRect frame = spinner.frame;
    frame.origin.x = loader.frame.size.width / 2 - frame.size.width / 2;
    frame.origin.y = loader.frame.size.height / 2 - frame.size.height / 2;
    spinner.frame = frame;
    [loader addSubview:spinner];
    [spinner startAnimating];
    [self.view addSubview:loader];
}



- (void)action_Redeem{
    [self mActivityIndicater];
    [self performSelector:@selector(CallServer) withObject:nil afterDelay:0.5];
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==000) {
        
        
        if (buttonIndex==0) {
            
        }
        else
        {
            [self mActivityIndicater];
            [self performSelector:@selector(CallServer) withObject:nil afterDelay:0.5];
            
        }
        
        
    }
    
    else if (alertView.tag==1111)
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
