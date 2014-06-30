//
//  NewsFeedViewController.m
//  TuesdayLesson
//
//  Created by Andrew Janich on 6/29/14.
//  Copyright (c) 2014 Google. All rights reserved.
//

#import "NewsFeedViewController.h"
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface NewsFeedViewController ()


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *newsfeedActivityIndicator;
@property (weak, nonatomic) IBOutlet UIScrollView *newsfeedScrollView;

- (void)loadFeed;

@end

@implementation NewsFeedViewController

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
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.newsfeedScrollView.alpha =0;
    self.newsfeedScrollView.contentSize = CGSizeMake(320, 1150);
    self.navigationItem.title = @"News Feed";
    
    // Configure the left button
    UIImage *leftButtonImage = [[UIImage imageNamed:@"search"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:leftButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    // Configure the right button
    UIImage *rightButtonImage = [[UIImage imageNamed:@"navBar_DivebarIcon_Highlighted_pre_ios_7"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:rightButtonImage style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    [self performSelector:@selector(loadFeed) withObject:nil afterDelay:2];
    
 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)loadFeed
{
    self.newsfeedScrollView.alpha = 1;
    [self.newsfeedActivityIndicator stopAnimating];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
