//
//  ViewController.m
//  GKImagePicker
//
//  Created by Shenghua Wang on 9/18/12.
//  Copyright (c) 2012 Shenghua Wang. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "ViewController.h"
#import "GKImagePicker.h"

@interface ViewController () <GKImagePickerDelegate> {
    IBOutlet UIImageView *myImageView;
    GKImagePicker *imagePicker;
}
@property (nonatomic, retain) GKImagePicker *imagePicker;
- (IBAction)handleImageButton:(id)sender;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - User interaction methods

- (IBAction)handleImageButton:(id)sender {
    self.imagePicker = [[GKImagePicker alloc] init];
    self.imagePicker.delegate = self;
    self.imagePicker.cropper.cropSize = CGSizeMake(300,200.);   // (Optional) Default: CGSizeMake(320., 320.)
    self.imagePicker.cropper.rescaleImage = YES;                // (Optional) Default: YES
    self.imagePicker.cropper.rescaleFactor = 2.0;               // (Optional) Default: 1.0
    self.imagePicker.cropper.dismissAnimated = YES;              // (Optional) Default: YES
    self.imagePicker.cropper.overlayColor = [UIColor colorWithRed:0/255. green:0/255. blue:0/255. alpha:0.7];  // (Optional) Default: [UIColor colorWithRed:0/255. green:0/255. blue:0/255. alpha:0.7]
    self.imagePicker.cropper.innerBorderColor = [UIColor colorWithRed:255./255. green:255./255. blue:255./255. alpha:0.7];   // (Optional) Default: [UIColor colorWithRed:0/255. green:0/255. blue:0/255. alpha:0.7]
    [self.imagePicker showCameraImagePicker];
}

#pragma mark - GKImagePicker delegate methods

- (void)imagePickerDidFinish:(GKImagePicker *)imagePicker withImage:(UIImage *)image {
//    myImageView.contentMode = UIViewContentModeCenter;
    myImageView.image = image;
}

@end
