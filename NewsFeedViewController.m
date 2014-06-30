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

@property (weak, nonatomic) IBOutlet UIScrollView *newsfeedScrollView;

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
    
    self.newsfeedScrollView.contentSize = CGSizeMake(320, 1100);
    self.navigationItem.title = @"News Feed";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

   //`UINavigationController *messagesNC = [[UINavigationController alloc] initWithRootViewController:messagesVC];


- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

@end
