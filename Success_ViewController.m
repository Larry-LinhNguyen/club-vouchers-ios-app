//
//  Success_ViewController.m
//  ClubVouchers
//
//  Created by Bhushan Bawa on 05/10/15.
//  Copyright © 2015 PICNFRAMES TECHNOLOGIES. All rights reserved.
//

#import "Success_ViewController.h"
#import "login.h"
#import "JSON.h"
#import "ConfirmRedeem.h"
#import "dashboard.h"
@interface Success_ViewController ()

@end

@implementation Success_ViewController

- (void)CallServer_api

{
    
    self.view.backgroundColor= [UIColor whiteColor];
    
    
    
    login *objLogin = [[login alloc]init];
    NSString *responseString = [objLogin makeCallPostData_ALL:[NSString stringWithFormat:@"user_id=%@&token=%@&campaign_id=%@",[[NSUserDefaults standardUserDefaults]valueForKey:@"user_id"],[[NSUserDefaults standardUserDefaults]valueForKey:@"token"],[[NSUserDefaults standardUserDefaults]valueForKey:@"bar_code"]]:@"https://www.clubvouchers.com/api/find_campaign?"];
    
    NSLog(@"%@",responseString);
    
    
    NSDictionary *responseDict = [responseString JSONValue];
    dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
    
    
    
//    if([[dict valueForKey:@"status"]isEqualToString:@"true"] && ![[dict valueForKey:@"eVoucher_status"] isEqualToString:@"-1"])
//    {
    
        authTitle = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, 80 ,300, 20)];
        authTitle.text = @"eVoucher Authentication";
        authTitle.textColor = [UIColor blackColor];
        authTitle.font = [UIFont fontWithName:@"Helvetica" size:14];
        authTitle.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:authTitle];
    
        //add message
        message = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, authTitle.frame.origin.y+authTitle.frame.size.height+5 ,300, 20)];
        message.text = [dict valueForKey:@"message"];
        //message.text = @"eVoucher found successfully";
        message.textColor = [UIColor redColor];
        message.font = [UIFont fontWithName:@"Helvetica" size:14];
        message.textAlignment= NSTextAlignmentCenter;
        [self.view addSubview:message];

        
        CALayer *messagebottomBorder = [CALayer layer];
        messagebottomBorder.frame = CGRectMake(20, message.frame.origin.y+message.frame.size.height+10, self.view.frame.size.width-40, 1.0f);
        messagebottomBorder.backgroundColor = [UIColor colorWithRed:227.0f/255.0f green:226.0f/255.0f blue:227.0f/255.0f alpha:1.0].CGColor;
        [self.view.layer addSublayer:messagebottomBorder];
    
    [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"eVoucher_id"] forKey:@"eVoucher_id"];
    [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"eVoucher_status"] forKey:@"eVoucher_status"];
    [[NSUserDefaults standardUserDefaults]synchronize];
        
        //add voucher id
        voucherid = [[UILabel alloc] initWithFrame:CGRectMake(40, messagebottomBorder.frame.origin.y+messagebottomBorder.frame.size.height+10 ,self.view.frame.size.width-80, 22)];
        voucherid.text = [dict valueForKey:@"eVoucher_id"];
        //voucherid.text = @"RRB-5948-465410-710782";
        voucherid.textColor = [UIColor blackColor];
        voucherid.font = [UIFont fontWithName:@"Helvetica" size:18];
        voucherid.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:voucherid];
    
    
    voucherstatus = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width-300)/2, voucherid.frame.origin.y+voucherid.frame.size.height+5 ,300, 20)];
    voucherstatus.text = [[dict valueForKey:@"eVoucher_status"]capitalizedString];
    voucherstatus.textColor = [UIColor redColor];
    voucherstatus.font = [UIFont fontWithName:@"Helvetica" size:16];
    voucherstatus.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:voucherstatus];
    
    
    CALayer *currentLabelbottomBorder = [CALayer layer];
    currentLabelbottomBorder.frame = CGRectMake(20, voucherstatus.frame.origin.y+voucherstatus.frame.size.height+10, self.view.frame.size.width-40, 1.0f);
    currentLabelbottomBorder.backgroundColor = [UIColor colorWithRed:227.0f/255.0f green:226.0f/255.0f blue:227.0f/255.0f alpha:1.0].CGColor;
    [self.view.layer addSublayer:currentLabelbottomBorder];
    
        //add voucher type
        vouchertype = [[UILabel alloc] initWithFrame:CGRectMake(20, currentLabelbottomBorder.frame.origin.y+currentLabelbottomBorder.frame.size.height+10 ,300, 20)];
        vouchertype.text = [@"eVoucher Type: " stringByAppendingString:[dict valueForKey:@"eVoucher_type"]];
        //vouchertype.text = @"eVoucher Type: Gift eVouchers";
        vouchertype.textColor = [UIColor blackColor];
        vouchertype.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self.view addSubview:vouchertype];
        
    
       voucherprice = [[UILabel alloc] initWithFrame:CGRectMake(20, vouchertype.frame.origin.y+vouchertype.frame.size.height+10 ,self.view.frame.size.width-40, 20)];
        //voucherprice.text = @"Price: $20.00";
        voucherprice.text = [@"Price: " stringByAppendingString:[dict valueForKey:@"eVoucher_price"]];
        voucherprice.textColor = [UIColor blackColor];
        voucherprice.font = [UIFont fontWithName:@"Helvetica" size:14];
        [self.view addSubview:voucherprice];
        
    custname = [[UILabel alloc] initWithFrame:CGRectMake(20, voucherprice.frame.origin.y+voucherprice.frame.size.height+10 ,self.view.frame.size.width-40, 20)];
    //custname.text = @"Cust Name: Kais Kassim";
    custname.text = [@"Cust Name: " stringByAppendingString:[dict valueForKey:@"cust_name"]];
    custname.textColor = [UIColor blackColor];
    custname.font = [UIFont fontWithName:@"Helvetica" size:14];
    [self.view addSubview:custname];
    
    custacctno = [[UILabel alloc] initWithFrame:CGRectMake(20, custname.frame.origin.y+custname.frame.size.height+10 ,self.view.frame.size.width-40, 20)];
    //custacctno.text = @"Cust Acc. No.: 4081";
    custacctno.text = [@"Cust Acc. No.: " stringByAppendingString:[dict valueForKey:@"cust_acc_no"]];
    custacctno.textColor = [UIColor blackColor];
    custacctno.font = [UIFont fontWithName:@"Helvetica" size:14];
    [self.view addSubview:custacctno];
    
    buygetdate = [[UILabel alloc] initWithFrame:CGRectMake(20, custacctno.frame.origin.y+custacctno.frame.size.height+10 ,self.view.frame.size.width-40, 20)];
    //buygetdate.text = @"Buy/Get Date: 2016-03-16 12:07:14";
    buygetdate.text = [@"Buy/Get Date: " stringByAppendingString:[dict valueForKey:@"buy_get_date"]];
    buygetdate.textColor = [UIColor blackColor];
    buygetdate.font = [UIFont fontWithName:@"Helvetica" size:14];
    [self.view addSubview:buygetdate];
    
    expirydate = [[UILabel alloc] initWithFrame:CGRectMake(20, buygetdate.frame.origin.y+buygetdate.frame.size.height+10 ,self.view.frame.size.width-40, 20)];
    //expirydate.text = @"Expiry Date: 2017-01-31 06:00:00";
    expirydate.text = [@"Expiry Date: " stringByAppendingString:[dict valueForKey:@"expiry_date"]];
    expirydate.textColor = [UIColor blackColor];
    expirydate.font = [UIFont fontWithName:@"Helvetica" size:14];
    [self.view addSubview:expirydate];
    
    RedeemButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    [RedeemButton setFrame:CGRectMake(50, expirydate.frame.origin.y+expirydate.frame.size.height+20, self.view.frame.size.width-100, 40)];
    [RedeemButton setTitle:@"Redeem" forState: UIControlStateNormal];
    [RedeemButton setBackgroundColor:[UIColor colorWithRed:255.0f/255.0f green:0.0f/255.0f blue:27.0f/255.0f alpha:1.0]];
    [RedeemButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [RedeemButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0]];
    RedeemButton.layer.cornerRadius = 5; // this value vary as per your desire
    RedeemButton.clipsToBounds = YES;
    [RedeemButton addTarget:self action:@selector(action_Redeem) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *ScanQRButton = [UIButton buttonWithType: UIButtonTypeRoundedRect];
    if([[dict valueForKey:@"eVoucher_status"] isEqualToString:@"current"]){
        [self.view addSubview:RedeemButton];
        [ScanQRButton setFrame:CGRectMake(50, RedeemButton.frame.origin.y+RedeemButton.frame.size.height +10, self.view.frame.size.width-100, 40)];
    }else{
        [ScanQRButton setFrame:CGRectMake(50, expirydate.frame.origin.y+expirydate.frame.size.height +20, self.view.frame.size.width-100, 40)];
    }
    [ScanQRButton setTitle:@"Scan Another" forState: UIControlStateNormal];
    [ScanQRButton setBackgroundColor:[UIColor colorWithRed:0.0f/255.0f green:185.0f/255.0f blue:124.0f/255.0f alpha:1.0]];
    [ScanQRButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [ScanQRButton.titleLabel setFont:[UIFont fontWithName:@"Helvetica" size:16.0]];
    ScanQRButton.layer.cornerRadius = 5; // this value vary as per your desire
    ScanQRButton.clipsToBounds = YES;
    [ScanQRButton addTarget:self action:@selector(action_Scan) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ScanQRButton];
    
    
    [loader removeFromSuperview];
    
    
}

- (void)action_Scan{
    dashboard *objdashboard=[[dashboard alloc]init];
    [self.navigationController pushViewController:objdashboard animated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self mActivityIndicater];
    [self performSelector:@selector(CallServer_api) withObject:nil afterDelay:0.5];
    
    
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
    [self.view addSubview:Logout];
    
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
    ConfirmRedeem *objConfirmRedeem=[[ConfirmRedeem alloc]init];
    UINavigationController *HomeNavController =[[UINavigationController alloc]initWithRootViewController:objConfirmRedeem];
    [self presentViewController:HomeNavController animated:YES completion:nil];
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



@end
