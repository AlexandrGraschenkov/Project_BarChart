//
//  ViewController.m
//  TestAutoresizing123
//
//  Created by Alexander on 20.11.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"

#define NUMBERS_OF_CATS 24

static NSString * const kSomeConst = @"fsdfsdfs";

@interface ViewController ()
{
}
@property (nonatomic, weak) IBOutlet UIView *chartView;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
//    NSString *baseUrlStr = @"http://vk.com/";
//    NSString *str = [baseUrlStr stringByAppendingString:@"feed"];
    NSInteger a = 5;
    NSInteger b = 6;
    NSString *str = [NSString stringWithFormat:@"Если мы сложим %d c %d получим %d", a, b, a + b];
    
    UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(30, 30, 200, 200)];
    circle.backgroundColor = [UIColor redColor];
    circle.layer.cornerRadius = circle.frame.size.width / 2.0;
    
    [self.view addSubview:circle];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (IBAction)handlePan:(UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateChanged) {
        CGPoint point = [pan locationInView:self.chartView];
        
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionLayoutSubviews | UIViewAnimationOptionCurveEaseOut animations:^{
            CGRect frame = self.chartView.frame;
            frame.size = CGSizeMake(point.x, point.y);
            self.chartView.frame = frame;
        } completion:nil];
        
    }
}

- (void)runInfiniteAnimation
{
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        CGRect frame = self.chartView.frame;
        frame.size.width -= 100;
        self.chartView.frame = frame;
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:0.5 delay:0.6 options:UIViewAnimationOptionLayoutSubviews animations:^{
        CGRect frame = self.chartView.frame;
        frame.size.height -= 100;
        self.chartView.frame = frame;
    } completion:^(BOOL finished) {
    }];
    
    [UIView animateWithDuration:0.5 delay:1.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
        CGRect frame = self.chartView.frame;
        frame.size.height += 100;
        frame.size.width += 100;
        self.chartView.frame = frame;
    } completion:^(BOOL finished) {
        [self runInfiniteAnimation];
    }];
    
}

@end
