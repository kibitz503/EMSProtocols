//
//  ViewController.m
//  EMSProtocols
//
//  Created by Tom Dolan on 2/25/13.
//  Copyright (c) 2013 Tom Dolan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) ViewOrientation previousOrientation;
@property (nonatomic) ViewOrientation currentOrientation;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self orientationOnLoad];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PageRotation

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [self setOrientation:&_currentOrientation With:toInterfaceOrientation];
    [self resizeView];
}



#pragma  mark - handle view orientation change
-(void)setOrientation:(ViewOrientation*)viewOrientation With:(UIInterfaceOrientation)interfaceOrientation
{
    switch (interfaceOrientation) {
        case 1:
        case 2:
            *viewOrientation = kVertical;
            break;
        default:
            *viewOrientation = kHorizontal;
            break;
    }
}


-(void)resizeView
{
    if (self.currentOrientation == kVertical)
    {
        [self setupVerticalView];
    }
    else
    {
        [self setupHorizontalView];
    }
}

-(void)setupVerticalView
{
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height - 20;
    self.pageView.frame = CGRectMake(0, 0, width, height );
//    self.pageView.image = [UIImage imageNamed:@"2013EMSProtocols121.png"];
    self.scrollView.contentSize = CGSizeMake(width, height);
    self.scrollView.scrollEnabled = NO;
}

-(void)setupHorizontalView
{
    float width = self.view.frame.size.width;
    float height = self.view.frame.size.height;
    self.pageView.frame = CGRectMake(0, 0, height, width*2);
//    self.pageView.image = [UIImage imageNamed:@"2013EMSProtocols121.png"];
    self.scrollView.contentSize = CGSizeMake(height, width*2);
    self.scrollView.scrollEnabled = YES;
}
-(void)orientationOnLoad
{
    [self setOrientation:&_currentOrientation With:[[UIApplication sharedApplication] statusBarOrientation]];
    if (self.currentOrientation == kVertical)
    {
        [self setupVerticalView];
    }
    else
    {
        [self setupHorizontalView];
    }
}
@end
