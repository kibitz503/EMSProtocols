//
//  ViewController.h
//  EMSProtocols
//
//  Created by Tom Dolan on 2/25/13.
//  Copyright (c) 2013 Tom Dolan. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    kVertical,
    kHorizontal
} ViewOrientation;


@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *pageView;

@end
