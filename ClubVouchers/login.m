//
//  login.m
//  Clubvouchers
//
//  Created by pnf on 9/28/15.
//  Copyright © 2015 pnf. All rights reserved.
//

#import "login.h"
#import "dashboard.h"


#import "JSON.h"



@interface login ()

@end

@implementation login

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Not_P=NO;
    //set background color
    self.view.backgroundColor= [UIColor whiteColor];
    
    UILabel *welcome = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 40)];
    welcome.text = @"WELCOME";
    [welcome setTextColor:[UIColor whiteColor]];
    [welcome setBackgroundColor:[UIColor blackColor]];
    welcome.font = [UIFont fontWithName:@"Helvetica" size:18];
    welcome.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:welcome];
    
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.frame=CGRectMake((self.view.frame.size.width-250)/2, welcome.frame.origin.y+welcome.frame.size.height+40 , 250, 65);
    
    imageView.image=[UIImage imageNamed:@"250_71.png"];
    
    [self.view addSubview:imageView];
    

    
    
    
    Title=[[UILabel alloc]init];
    Title.frame=CGRectMake((self.view.frame.size.width-300)/2, imageView.frame.origin.y+imageView.frame.size.height+30, 300, 20);
    Title.textColor=[UIColor colorWithRed:171/256.0 green:171/256.0 blue:171/256.0 alpha:1.0];
    Title.text=@"ClubMerchant";
    Title.font = [UIFont fontWithName:@"Helvetica" size:16];
    Title.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:Title];
    
    UILabel *enterPIN =[[UILabel alloc]init];
    enterPIN.frame=CGRectMake((self.view.frame.size.width-350)/2, Title.frame.origin.y+Title.frame.size.height+5, 350, 20);
    enterPIN.textColor=[UIColor colorWithRed:171/256.0 green:171/256.0 blue:171/256.0 alpha:1.0];
    enterPIN.text=@"Enter PIN to login";
    enterPIN.font = [UIFont fontWithName:@"Helvetica" size:16];
    enterPIN.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:enterPIN];
    
    
    
    PIN1 = [[UITextField alloc] initWithFrame:CGRectMake((self.view.frame.size.width-170)/2, enterPIN.frame.origin.y+enterPIN.frame.size.height+20 , 30, 30)];
    PIN1.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    PIN1.font = [UIFont fontWithName:@"Helvetica-Normal" size:16];
    PIN1.delegate=self;
    PIN1.backgroundColor=[UIColor whiteColor];
    PIN1.layer.borderColor=[[UIColor colorWithRed:171/256.0 green:171/256.0 blue:171/256.0 alpha:1.0]CGColor];
    PIN1.layer.borderWidth= 1.0f;
    PIN1.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:PIN1];
    [PIN1 becomeFirstResponder];
    PIN1.tag=1;
    
    PIN1.textAlignment=NSTextAlignmentCenter;

    PIN2 = [[UITextField alloc] initWithFrame:CGRectMake(PIN1.frame.origin.x+PIN1.frame.size.width+5, enterPIN.frame.origin.y+enterPIN.frame.size.height+20 , 30, 30)];
    PIN2.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    PIN2.font = [UIFont fontWithName:@"Helvetica-Normal" size:16];
    PIN2.delegate=self;
    PIN2.backgroundColor=[UIColor whiteColor];
    PIN2.layer.borderColor=[[UIColor colorWithRed:171/256.0 green:171/256.0 blue:171/256.0 alpha:1.0]CGColor];
    PIN2.layer.borderWidth= 1.0f;
    PIN2.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:PIN2];
    PIN2.tag=2;
    PIN2.textAlignment=NSTextAlignmentCenter;
    
    PIN3 = [[UITextField alloc] initWithFrame:CGRectMake(PIN2.frame.origin.x+PIN2.frame.size.width+5, enterPIN.frame.origin.y+enterPIN.frame.size.height+20 , 30, 30)];
    PIN3.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    PIN3.font = [UIFont fontWithName:@"Helvetica-Normal" size:16];
    PIN3.delegate=self;
    PIN3.backgroundColor=[UIColor whiteColor];
    PIN3.layer.borderColor=[[UIColor colorWithRed:171/256.0 green:171/256.0 blue:171/256.0 alpha:1.0]CGColor];
    PIN3.layer.borderWidth= 1.0f;
    PIN3.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:PIN3];
    PIN3.tag=3;
    PIN3.textAlignment=NSTextAlignmentCenter;
    
    PIN4 = [[UITextField alloc] initWithFrame:CGRectMake(PIN3.frame.origin.x+PIN3.frame.size.width+5, enterPIN.frame.origin.y+enterPIN.frame.size.height+20 , 30, 30)];
    PIN4.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    PIN4.font = [UIFont fontWithName:@"Helvetica-Normal" size:16];
    PIN4.delegate=self;
    PIN4.backgroundColor=[UIColor whiteColor];
    PIN4.layer.borderColor=[[UIColor colorWithRed:171/256.0 green:171/256.0 blue:171/256.0 alpha:1.0]CGColor];
    PIN4.layer.borderWidth= 1.0f;
    PIN4.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:PIN4];
    PIN4.tag=4;
    PIN4.textAlignment=NSTextAlignmentCenter;
    
    PIN5 = [[UITextField alloc] initWithFrame:CGRectMake(PIN4.frame.origin.x+PIN4.frame.size.width+5, enterPIN.frame.origin.y+enterPIN.frame.size.height+20 , 30, 30)];
    PIN5.textColor = [UIColor colorWithRed:0/256.0 green:84/256.0 blue:129/256.0 alpha:1.0];
    PIN5.font = [UIFont fontWithName:@"Helvetica-Normal" size:16];
    PIN5.delegate=self;
    PIN5.backgroundColor=[UIColor whiteColor];
    PIN5.layer.borderColor=[[UIColor colorWithRed:171/256.0 green:171/256.0 blue:171/256.0 alpha:1.0]CGColor];
    PIN5.layer.borderWidth= 1.0f;
    PIN5.keyboardType=UIKeyboardTypeNumberPad;
    [self.view addSubview:PIN5];
    PIN5.tag=5;
    PIN5.textAlignment=NSTextAlignmentCenter;
  
}

-(void)viewWillAppear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden=YES;
    checkcurrenttextfield = NO;
    [PIN1 becomeFirstResponder];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
//    NSLog(@"%hhd",checkcurrenttextfield);
//    
//    
//    
//    [PIN1 becomeFirstResponder];
//    
//    [self validateInput];
    
    return YES;
}

-(void)validateInput{
     if ([PIN2.text isEqualToString:@""] || PIN2.text==nil )
    {
        [PIN2 becomeFirstResponder];
    }
    else if ([PIN3.text isEqualToString:@""] || PIN3.text==nil )
    {
        [PIN3 becomeFirstResponder];
    }
    else if ([PIN4.text isEqualToString:@""] || PIN4.text==nil )
    {
        [PIN4 becomeFirstResponder];
    }
    else if ([PIN5.text isEqualToString:@""] || PIN5.text==nil )
    {
        [PIN5 becomeFirstResponder];
    }
    
    
    //return  retvalue;
    
}


- (void)deleteBackward
{
    
}



-(void)textFieldDidEndEditing:(UITextField *)textField{
    
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    return YES;
}


- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    BOOL shouldProcess = NO; //default to reject
    BOOL shouldMoveToNextField = NO; //default to remaining on the current field
    
    NSInteger insertStringLength = [string length];
    
    if(insertStringLength == 0){ //backspace
        
        
        Not_P=NO;
        
        shouldProcess = NO; //Process if the backspace character was pressed
    }
    else {
        
        Not_P=YES;
        
        
        if([[textField text] length] == 0) {
            shouldProcess = YES; //Process if there is only 1 character right now
        }
    }
    
    
    
    
    if(shouldProcess)
    {
        
        //grab a mutable copy of what's currently in the UITextField
        mstring = [[textField text] mutableCopy];
        if([mstring length] == 0){
            //nothing in the field yet so append the replacement string
            [mstring appendString:string];
            
            shouldMoveToNextField = YES;
        }
        else{
            //adding a char or deleting?
            if(insertStringLength > 0){
                [mstring insertString:string atIndex:range.location];
            }
            else {
                //delete case - the length of replacement string is zero for a delete
                [mstring deleteCharactersInRange:range];
            }
        }
        
        
        
        if (textField.tag==1) {
            
            PIN1.text=mstring;
            
            
        }
        else
        {
            
            if ([PIN1.text isEqualToString:@""] || PIN1.text==nil )
            {
                PIN1.text=mstring;
                [PIN1 becomeFirstResponder];
                
            }
            
            else   if ([PIN2.text isEqualToString:@""] || PIN2.text==nil )
            {
                PIN2.text=mstring;
                [PIN2 becomeFirstResponder];
                
            }
            
            
            else  if ([PIN3.text isEqualToString:@""] || PIN3.text==nil )
            {
                PIN3.text=mstring;
                [PIN3 becomeFirstResponder];
                
            }
            
            else  if ([PIN4.text isEqualToString:@""] || PIN4.text==nil )
            {
                PIN4.text=mstring;
                [PIN4 becomeFirstResponder];
                
            }
            else
            {
                [textField setText:mstring];
            }
        }
        
        
        
        
        if([PIN1 isFirstResponder]){ [PIN2 becomeFirstResponder]; }
        else if([PIN2 isFirstResponder]){ [PIN3 becomeFirstResponder]; }
        else if([PIN3 isFirstResponder]){ [PIN4 becomeFirstResponder]; }
        else if([PIN4 isFirstResponder]){ [PIN5 becomeFirstResponder]; }
        else if([PIN5 isFirstResponder]){
            
        }
        
    }
    
    else
        
    {
        if (textField.tag==1) {
            if (Not_P==YES)
            {
                PIN2.text=string;
                
                [PIN2 becomeFirstResponder];
                
            }
            else
            {
                
                PIN1.text=@"";
            }
            
            
        }
        else
        {
            
            if (textField.tag==1 )
            {
                
                if (Not_P==YES)
                {
                    PIN2.text=string;
                    
                    [PIN2 becomeFirstResponder];
                    
                }
                else
                {
                    PIN1.text=@"";
                    [PIN1 becomeFirstResponder];
                }
                
            }
            
            else   if (textField.tag==2)
            {
                
                
                if (Not_P==YES)
                {
                    PIN3.text=string;
                    
                    [PIN3 becomeFirstResponder];
                    
                }
                else
                {
                    
                    PIN2.text=@"";
                    [PIN1 becomeFirstResponder];
                }
                
            }
            
            
            else  if (textField.tag==3 )
            {
                
                
                if (Not_P==YES)
                {
                    PIN4.text=string;
                    [PIN4 becomeFirstResponder];
                    
                }
                else
                {
                    PIN3.text=@"";
                    [PIN2 becomeFirstResponder];
                }
                
            }
            
            else  if (textField.tag==4 )
            {
                if (Not_P==YES)
                {
                    PIN5.text=string;
                    [PIN5 becomeFirstResponder];
                    
                }
                else
                {
                    
                    
                    PIN4.text=@"";
                    [PIN3 becomeFirstResponder];
                }
                
            }
            else
            {
                //                if ([PIN5.text isEqualToString:@""] || PIN5.text==nil )
                //                {
                //                    PIN5.text=mstring;
                //                    [PIN5 becomeFirstResponder];
                //
                //                }
                //                else
                //                {
                if (Not_P==YES)
                {
                    [self action_checkForLogin];
                }
                else
                {
                    
                    [PIN4 becomeFirstResponder];
                    
                    [textField setText:@""];
                }
                //}
            }
        }
        
        
        
        
        //        if([PIN1 isFirstResponder])
        //        { [PIN1 becomeFirstResponder];
        //        }
        //        else if([PIN2 isFirstResponder])
        //        {
        //            [PIN1 becomeFirstResponder];
        //        }
        //        else if([PIN3 isFirstResponder])
        //        {
        //            [PIN2 becomeFirstResponder];
        //        }
        //        else if([PIN4 isFirstResponder])
        //        {
        //            [PIN3 becomeFirstResponder];
        //        }
        //        else if([PIN5 isFirstResponder])
        //        {
        //            [PIN4 becomeFirstResponder];
        //        }
        
    }
    // }
    
    //Not_P = YES;
    
    
    //always return no since we are manually changing the text field
    return NO;
}



//-(IBAction)action_Save{
//    
//    //NSLog(@"Hello");
//    
//    BOOL check=[self validateInput];
//    
//    if (check==true) {
//        
//        
//        [self mActivityIndicater];
//        [self performSelector:@selector(action_checkForLogin) withObject:nil afterDelay:0.5];
//        
//       // [self action_checkForLogin];
//    }
//    else
//    {
//        
//    }
//    
//    
//}



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




- (NSString *)makeCallPostData_ALL:(NSString *)dict :(NSString *)STR_URL

{
    NSData *postData = [dict dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:STR_URL];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    
    [request setValue:@"application/x-www-form-urlencoded charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [request setHTTPBody:postData];
    
    
    
    NSError *error = nil;
    
    NSHTTPURLResponse *response = nil;
    
    NSData *retData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSString *dataValue=nil;
    
    if (error)
        
    {
        
        //error
        
    }
    
    else
        
    {
        
        dataValue = [[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
        
    }
    return dataValue;
    
}



- (void)action_checkForLogin
{
    
    
    
    NSString *responseString = [self makeCallPostData_ALL:[NSString stringWithFormat:@"pin=%@",[NSString stringWithFormat:@"%@%@%@%@%@",PIN1.text,PIN2.text,PIN3.text,PIN4.text,PIN5.text]]:@"https://www.clubvouchers.com/api/sign_in"];
    
    //NSLog(@"%@",responseString);
    
    
    NSDictionary *responseDict = [responseString JSONValue];
    dict = [[NSMutableDictionary alloc ]  initWithDictionary:responseDict];
    
    
    //NSLog(@"%@",dict);
    
    
    if([[dict valueForKey:@"status"]isEqualToString:@"true"])
    {
        
        
        
        
        dashboard *objDashboard = [[dashboard alloc]init];
        
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"user_id"] forKey:@"user_id"];
         [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"token"] forKey:@"token"];
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"business_name"] forKey:@"business_name"];
        [[NSUserDefaults standardUserDefaults]setValue:[dict valueForKey:@"business_identify_id"] forKey:@"business_identify_id"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        PIN1.text = @"";
        PIN2.text = @"";
        PIN3.text = @"";
        PIN4.text = @"";
        PIN5.text = @"";
        
        
               [self.navigationController pushViewController:objDashboard animated:YES];
  
        
    }
    else{
        
        
        
        UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"Alert" message:[dict valueForKey:@"message"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        
        [alter show];
        
    }
    
    [loader removeFromSuperview];
    
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    
    return YES;

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
