//
//  DetailsViewController.m
//  ScrollView_Image_Galleries
//
//  Created by Justine Herman on 11/14/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "DetailsViewController.h"
#import "ViewController.h"


@interface DetailsViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *lighthouseImageView;
@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;


@end

@implementation DetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupPanningAndZoomingImage];
    self.imageScrollView.delegate = self;
    self.lighthouseImageView = [[UIImageView alloc] initWithImage:self.detailedImage];
    self.lighthouseImageView.frame = self.view.frame;
    self.lighthouseImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.imageScrollView addSubview:self.lighthouseImageView];
    self.imageScrollView.contentSize = self.lighthouseImageView.bounds.size;
    
}

- (void)setupPanningAndZoomingImage
{
    self.imageScrollView.minimumZoomScale = 0.5;
    self.imageScrollView.maximumZoomScale = 3.0;
    
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.lighthouseImageView;
}


@end
