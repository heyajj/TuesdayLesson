//
//  NotificationsViewController.m
//  TuesdayLesson
//
//  Created by Andrew Janich on 6/29/14.
//  Copyright (c) 2014 Google. All rights reserved.
//

#import "NotificationsViewController.h"

@interface NotificationsViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *notificationsScrollView;

@end

@implementation NotificationsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.notificationsScrollView.contentSize = CGSizeMake(320, 826);
    self.navigationItem.title = @"Notifications";
    
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"navBar_DivebarIcon_Highlighted_pre_ios_7"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}*/

@end
