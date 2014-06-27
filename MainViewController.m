//
//  MainViewController.m
//  TuesdayLesson
//
//  Created by Andrew Janich on 6/24/14.
//  Copyright (c) 2014 Google. All rights reserved.
//

#import "MainViewController.h"
//#import <TTTAttributedLabel/TTTAttributedLabel.h>

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIView *inputFieldView;
@property (weak, nonatomic) IBOutlet UIView *logoView;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIButton *signUpButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *indicatorView;


//textfield actions
- (IBAction)onTap:(id)sender;
- (IBAction)onEditingBegin:(id)sender;

//login actions
- (IBAction)onLoginTap:(id)sender;





//- (void)willShowKeyboard:(NSNotification *)notification;
//- (void)willHideKeyboard:(NSNotification *)notification;

@end

@implementation MainViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
  //  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    //if (self) {
        // Register the methods for the keyboard hide/show events
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
    //}
   // return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.loginButton.alpha = .5;
    [self.loginButton setEnabled:YES];
    [self.indicatorView stopAnimating];
    
}

//- (void)doNothing {
    
//}

//- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
   // [self.inputFieldView resignFirstResponder];

//}

//- (BOOL)textFieldShouldReturn:(UITextField *)textField {
   // if (textField) {
   //     [textField resignFirstResponder];
   // }
    //return NO;
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLoginTap:(id)sender {
    
    //[self.view endEditing:YES];
    [self.indicatorView startAnimating];
    self.loginButton.alpha = .5;
    self.loginButton.enabled = NO;
    //self.userNameField.enabled = NO;
    //self.pwdField.enabled = NO;
    self.signUpButton.enabled = NO;
    self.signUpButton.alpha=.75;
    
    //[self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:UIControlStateDisabled];
    //[self.loginButton setBackgroundImage:[UIImage imageNamed:@"logging_in_button"] forState:UIControlStateNormal];
    
    
}


//Motion up
- (IBAction)onEditingBegin:(id)sender {
    NSLog(@"Start Editing");
    self.loginButton.alpha = 1;
    [self.indicatorView stopAnimating];
    [UIView animateWithDuration :0.2 animations:^{self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, -50, self.loginView.frame.size.width, self.loginView.frame.size.height);}];
    
    [UIView animateWithDuration :0.2 animations:^{self.signUpButton.frame = CGRectMake(self.signUpButton.frame.origin.x, 290, self.signUpButton.frame.size.width, self.signUpButton.frame.size.height);}];
}
//Motion down
- (IBAction)onTap:(id)sender {
    NSLog(@"End Editing");
    self.loginButton.alpha = .5;
    [self.indicatorView stopAnimating];
    [self.view endEditing:YES];
    [UIView animateWithDuration :0.2 animations:^{self.loginView.frame = CGRectMake(self.loginView.frame.origin.x, 30, self.loginView.frame.size.width, self.loginView.frame.size.height);}];
    
    [UIView animateWithDuration :0.2 animations:^{self.signUpButton.frame = CGRectMake(self.signUpButton.frame.origin.x, 464, self.signUpButton.frame.size.width, self.signUpButton.frame.size.height);}];
}






- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
