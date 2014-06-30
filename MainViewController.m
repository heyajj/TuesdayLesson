//
//  MainViewController.m
//  TuesdayLesson
//
//  Created by Andrew Janich on 6/24/14.
//  Copyright (c) 2014 Google. All rights reserved.
//

#import "MainViewController.h"
#import "NewsFeedViewController.h"
#import "MessagesViewController.h"
#import "RequestsViewController.h"
#import "NotificationsViewController.h"
#import "SettingsViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIView *inputFieldView;
@property (weak, nonatomic) IBOutlet UIView *logoView;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;

- (IBAction)onLoginTap:(id)sender;
- (IBAction)onTap:(id)sender;
- (IBAction)onEditingChanged:(id)sender;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //Customize intitalization
    }
   return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    
    
    
    self.loginButton.alpha = .5;
    [self.loginButton setEnabled:NO];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginTap:(id)sender {
    
    [self.view endEditing:YES];
    [self.indicatorView startAnimating];
    self.loginButton.enabled = NO;
    self.userNameField.enabled = NO;
    self.pwdField.enabled = NO;
    self.signUpButton.alpha=.75;
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:UIControlStateDisabled];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:UIControlStateNormal];
    
    [UIView
     animateWithDuration:1
     delay:1
     options:UIViewAnimationOptionCurveLinear
     animations:^{
         self.logoView.alpha=0;
     }
     completion:^(BOOL finished) {
         if ([self.pwdField.text isEqualToString:@"password"])
             [self loginSucess];
         else
             [self loginFail];
     }];

    
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (IBAction)onEditingChanged:(id)sender {
    if ([self.userNameField.text length] != 0 && [self.pwdField.text length] != 0) {
        [self.loginButton setEnabled:YES];
        self.loginButton.alpha = 1;
    }
    else {
        [self.loginButton setEnabled:NO];
        self.loginButton.alpha = .5;
    }
    
}


-(void) loginSucess{
    
    
    //Import the Tab Bar Views
    UIViewController *newsfeedVC = [[NewsFeedViewController alloc] init];
    UIViewController *requestsVC = [[RequestsViewController alloc] init];
    UIViewController *messagesVC = [[MessagesViewController alloc] init];
    UIViewController *notificationsVC = [[NotificationsViewController alloc] init];
    UIViewController *settingsVC = [[SettingsViewController alloc] init];
    
    
    //Import the Navigation Bars
    UINavigationController *newsfeedNC = [[UINavigationController alloc] initWithRootViewController:newsfeedVC];
    //UINavigationController *requestsNC = [[UINavigationController alloc] initWithRootViewController:requestsVC];
    //UINavigationController *messagesNC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
    //UINavigationController *notificationsNC = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
    //UINavigationController *settingsNC = [[UINavigationController alloc] initWithRootViewController:settingsVC];
    
    
    //Tab Bar Titles and Custom Images
    UIImage *newsFeedImage = [[UIImage imageNamed:@"News_Feed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    newsfeedVC.tabBarItem.image = newsFeedImage;
    newsfeedVC.tabBarItem.title = @"News Feed";
    
    
    
    requestsVC.tabBarItem.title = @"Requests";
    requestsVC.tabBarItem.image = [UIImage imageNamed:@"Requests"];
    
    
    
    messagesVC.tabBarItem.title = @"Messages";
    messagesVC.tabBarItem.image = [UIImage imageNamed:@"tab_messages"];
    
    
    
    notificationsVC.tabBarItem.title = @"Notifications";
    notificationsVC.tabBarItem.image = [UIImage imageNamed:@"tab_notifications"];
    
    
    
    settingsVC.tabBarItem.title = @"Settings";
    settingsVC.tabBarItem.image = [UIImage imageNamed:@"tab_settings"];
    
    
    
    // Create the tab bar controller
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = @[newsfeedNC, requestsVC, messagesVC, notificationsVC, settingsVC];
    
    [self presentViewController:tabBarController animated:YES completion:nil];

    
    
}

-(void) loginFail{
    [self.indicatorView stopAnimating];
    self.loginButton.enabled = YES;
    self.userNameField.enabled = YES;
    self.pwdField.enabled = YES;
    self.signUpButton.alpha =1;
    self.logoView.alpha =1;
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"login_button_disabled"] forState:UIControlStateDisabled];
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"login_button_disabled"] forState:UIControlStateNormal];

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect password" message:@"Make sure you typed the right password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    
}

- (void)keyboardDidShow:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    //    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         CGRect containerFrame = self.loginView.frame;
                         containerFrame.origin.y -= 40;
                         self.loginView.frame = containerFrame;
                         
                         CGRect labelFrame = self.signUpButton.frame;
                         labelFrame.origin.y -= 116;
                         self.signUpButton.frame = labelFrame;
                     }
                     completion:nil
     ];
    
}

-(void)keyboardDidHide:(NSNotification *)notification
{
    NSDictionary *userInfo = [notification userInfo];
    
    // Get the keyboard height and width from the notification
    // Size varies depending on OS, language, orientation
    //    CGSize kbSize = [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    //    NSLog(@"Height: %f Width: %f", kbSize.height, kbSize.width);
    
    // Get the animation duration and curve from the notification
    NSNumber *durationValue = userInfo[UIKeyboardAnimationDurationUserInfoKey];
    NSTimeInterval animationDuration = durationValue.doubleValue;
    NSNumber *curveValue = userInfo[UIKeyboardAnimationCurveUserInfoKey];
    UIViewAnimationCurve animationCurve = curveValue.intValue;
    
    [UIView animateWithDuration:animationDuration
                          delay:0.0
                        options:(animationCurve << 16)
                     animations:^{
                         CGRect containerFrame = self.loginView.frame;
                         containerFrame.origin.y += 40;
                         self.loginView.frame = containerFrame;
                         
                         CGRect labelFrame = self.signUpButton.frame;
                         labelFrame.origin.y += 116;
                         self.signUpButton.frame = labelFrame;
                     } completion:nil ];
    
}



- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
