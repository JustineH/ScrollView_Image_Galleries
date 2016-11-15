//
//  ViewController.m
//  ScrollView_Image_Galleries
//
//  Created by Justine Herman on 11/14/16.
//  Copyright © 2016 Justine Herman. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *imageScrollView;
@property (strong, nonatomic) UIImageView *lighthouseImageView;
@property (strong, nonatomic, readonly) NSArray<UIImage *> *lighthouseImages;
@property (nonatomic) UITapGestureRecognizer *imageViewTapped;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self scrollViewImages];
    [self imageViewTapped];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewImages
{
    
    CGFloat imageXPosition = 0;
    
    CGFloat scrollViewWidth = CGRectGetWidth(self.view.frame);
    CGFloat scrollViewHeight = CGRectGetHeight(self.imageScrollView.frame);
    
    for (UIImage *lighthouseImage in self.lighthouseImages)
    {
        UIImageView *lighthouseImageView = [[UIImageView alloc] initWithImage:lighthouseImage];
        
        lighthouseImageView.frame = CGRectMake(imageXPosition, 0, scrollViewWidth, scrollViewHeight);
        lighthouseImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        UITapGestureRecognizer *imageViewTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageViewTapped:)];
        
        [lighthouseImageView addGestureRecognizer:imageViewTapped];
        lighthouseImageView.userInteractionEnabled = YES;
        
        [self.imageScrollView addSubview:lighthouseImageView];
        
        imageXPosition += scrollViewWidth;
        
    }
    
    self.imageScrollView.contentSize = CGSizeMake(scrollViewWidth*self.lighthouseImages.count, scrollViewHeight);
    
    self.imageScrollView.pagingEnabled = YES;
    
}

- (NSArray<UIImage *> *)lighthouseImages
{
    return @
    [
        [UIImage imageNamed:@"Lighthouse"],
        [UIImage imageNamed:@"Lighthouse-night"],
        [UIImage imageNamed:@"Lighthouse-in-Field"],
     
     ];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqual: @"detailsViewController"])
    {
        DetailsViewController *vc = segue.destinationViewController;
        vc.detailedImage = sender;
     //   vc.detailedImage = (UIImage *)sender;
     //   [vc setDetailedImage:detailedImage];
       
    }
}

- (void)imageViewTapped:(UITapGestureRecognizer *)sender
{
    UIImageView *imageTapped = (UIImageView *)sender.view;
    
    [self performSegueWithIdentifier:@"detailsViewController" sender:imageTapped.image];
    
}


@end

