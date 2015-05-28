//
//  TOActivitySafari.m
//
//  Copyright 2014 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "TOActivitySafari.h"

NSString *const TOActivityTypeSafari = @"au.com.timoliver.TOActivityTypeSafari";

/* Detect which user idiom we're running on */
#define IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface TOActivitySafari ()

/* The URL to load */
@property (nonatomic, strong) NSURL *url;

+ (UIImage *)sharedActivityImage;

@end

@implementation TOActivitySafari

#pragma mark - Activity Display Properties -
- (NSString *)activityType
{
    return TOActivityTypeSafari;
}

- (NSString *)activityTitle
{
    return NSLocalizedStringFromTable(@"Safari", @"TOWebViewControllerLocalizable", @"Open in Safari Action");
}

- (UIImage *)activityImage
{
    return [TOActivitySafari sharedActivityImage];
}

#pragma mark - Activity Action Handlers -
- (void)prepareWithActivityItems:(NSArray *)activityItems
{
    //Grab the first URL in the list
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSURL class]]) {
            self.url = (NSURL *)item;
            break;
        }
    }
}

- (void)performActivity
{
    if (self.url == nil) {
        [self activityDidFinish:NO];
        return;
    }
    
    [[UIApplication sharedApplication] openURL:self.url];
    [self activityDidFinish:YES];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    //Check to see if there is an NSURL in the provided items
    BOOL containsURL = NO;
    for (id item in activityItems) {
        if ([item isKindOfClass:[NSURL class]]) {
            containsURL = YES;
            break;
        }
    }
    
    return containsURL;
}

#pragma mark - Image Generation -
+ (UIImage *)sharedActivityImage
{
    static UIImage *sharedActivityImage = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        UIColor *fillColor = [UIColor blackColor];
        
        if (IPAD) { //iPad
            UIGraphicsBeginImageContextWithOptions((CGSize){53, 53}, NO, [[UIScreen mainScreen] scale]);
            {
                UIBezierPath* safariPadMinimalPathPath = [UIBezierPath bezierPath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(26.5, 53)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(0, 26.5) controlPoint1: CGPointMake(11.86, 53) controlPoint2: CGPointMake(0, 41.14)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(26.5, 0) controlPoint1: CGPointMake(0, 11.86) controlPoint2: CGPointMake(11.86, 0)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(53, 26.5) controlPoint1: CGPointMake(41.14, 0) controlPoint2: CGPointMake(53, 11.86)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(26.5, 53) controlPoint1: CGPointMake(53, 41.14) controlPoint2: CGPointMake(41.14, 53)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(26.52, 0.99)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(0.99, 26.52) controlPoint1: CGPointMake(12.42, 0.99) controlPoint2: CGPointMake(0.99, 12.42)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(26.52, 52.05) controlPoint1: CGPointMake(0.99, 40.62) controlPoint2: CGPointMake(12.42, 52.05)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(52.05, 26.52) controlPoint1: CGPointMake(40.62, 52.05) controlPoint2: CGPointMake(52.05, 40.62)];
                [safariPadMinimalPathPath addCurveToPoint: CGPointMake(26.52, 0.99) controlPoint1: CGPointMake(52.05, 12.42) controlPoint2: CGPointMake(40.62, 0.99)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(46.99, 27.05)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(46.99, 25.98)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(50.99, 25.98)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(50.99, 27.05)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(46.99, 27.05)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(47.97, 20.22)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(49.9, 19.7)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(50.15, 20.63)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(48.22, 21.15)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(47.97, 20.22)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(45.59, 14.84)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(47.32, 13.84)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(47.8, 14.68)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(46.07, 15.67)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(45.59, 14.84)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(9.07, 44.66)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(24.05, 22.89)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(44.6, 9.05)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(29.84, 28.58)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(9.07, 44.66)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(24.76, 23.66)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(13.27, 40.25)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(29.02, 27.93)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(24.76, 23.66)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(37.14, 6.79)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(38.14, 5.06)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(38.98, 5.54)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(37.98, 7.27)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(37.14, 6.79)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(31.65, 4.67)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(32.17, 2.74)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(33.1, 2.99)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(32.59, 4.92)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(31.65, 4.67)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(26.05, 2.05)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(27.02, 2.05)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(27.02, 6.04)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(26.05, 6.04)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(26.05, 2.05)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(19.71, 2.99)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(20.65, 2.74)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(21.17, 4.67)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(20.23, 4.92)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(19.71, 2.99)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(13.84, 5.54)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(14.68, 5.06)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(15.68, 6.79)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(14.84, 7.27)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(13.84, 5.54)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(8.81, 9.48)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(9.49, 8.8)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(10.9, 10.21)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(10.22, 10.9)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(8.81, 9.48)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(15.6, 46.27)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(14.6, 48)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(13.76, 47.52)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(14.76, 45.79)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(15.6, 46.27)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(21.08, 48.42)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(20.56, 50.35)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(19.62, 50.1)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(20.14, 48.17)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(21.08, 48.42)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(27.02, 50.98)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(26.05, 50.98)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(26.05, 46.99)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(27.02, 46.99)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(27.02, 50.98)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(33.19, 50.1)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(32.26, 50.35)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(31.74, 48.42)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(32.68, 48.17)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(33.19, 50.1)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(39.05, 47.52)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(38.22, 48)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(37.22, 46.27)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(38.05, 45.79)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(39.05, 47.52)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(44.09, 43.52)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(43.41, 44.21)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(41.99, 42.8)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(42.68, 42.11)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(44.09, 43.52)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(47.83, 38.34)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(47.35, 39.18)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(45.62, 38.18)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(46.1, 37.34)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(47.83, 38.34)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(50.15, 32.37)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(49.9, 33.3)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(47.97, 32.79)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(48.22, 31.85)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(50.15, 32.37)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(5.01, 14.68)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(5.5, 13.84)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(7.23, 14.84)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(6.74, 15.67)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(5.01, 14.68)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(2.67, 20.63)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(2.92, 19.7)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(4.85, 20.22)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(4.6, 21.15)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(2.67, 20.63)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(6.04, 27.05)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(2.05, 27.05)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(2.05, 25.98)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(6.04, 25.98)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(6.04, 27.05)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(4.84, 32.79)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(2.92, 33.3)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(2.66, 32.37)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(4.59, 31.85)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(4.84, 32.79)];
                [safariPadMinimalPathPath closePath];
                [safariPadMinimalPathPath moveToPoint: CGPointMake(7.2, 38.18)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(5.47, 39.18)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(4.98, 38.34)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(6.71, 37.34)];
                [safariPadMinimalPathPath addLineToPoint: CGPointMake(7.2, 38.18)];
                [safariPadMinimalPathPath closePath];
                [fillColor setFill];
                [safariPadMinimalPathPath fill];
                
                sharedActivityImage = UIGraphicsGetImageFromCurrentImageContext();
            }
            UIGraphicsEndImageContext();
        }
        else { //iPhone
            UIGraphicsBeginImageContextWithOptions((CGSize){39, 39}, NO, [[UIScreen mainScreen] scale]);
            {
                UIBezierPath* safariPhoneMinimalPath = [UIBezierPath bezierPath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(19.5, 39)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(0, 19.5) controlPoint1: CGPointMake(8.73, 39) controlPoint2: CGPointMake(0, 30.27)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(19.5, 0) controlPoint1: CGPointMake(0, 8.73) controlPoint2: CGPointMake(8.73, 0)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(39, 19.5) controlPoint1: CGPointMake(30.27, 0) controlPoint2: CGPointMake(39, 8.73)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(19.5, 39) controlPoint1: CGPointMake(39, 30.27) controlPoint2: CGPointMake(30.27, 39)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(32.73, 6.53)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(32.68, 6.56)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 1.04) controlPoint1: CGPointMake(29.33, 3.16) controlPoint2: CGPointMake(24.67, 1.04)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(1.04, 19.51) controlPoint1: CGPointMake(9.31, 1.04) controlPoint2: CGPointMake(1.04, 9.31)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(6.6, 32.72) controlPoint1: CGPointMake(1.04, 24.69) controlPoint2: CGPointMake(3.17, 29.36)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(6.59, 32.74)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(6.61, 32.72)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 37.99) controlPoint1: CGPointMake(9.94, 35.98) controlPoint2: CGPointMake(14.49, 37.99)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(37.99, 19.51) controlPoint1: CGPointMake(29.72, 37.99) controlPoint2: CGPointMake(37.99, 29.72)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(32.7, 6.58) controlPoint1: CGPointMake(37.99, 14.47) controlPoint2: CGPointMake(35.97, 9.91)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(32.73, 6.53)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(36.96, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(35.03, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.03, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.03, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(35.03, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(36.96, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(37.03, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(37.03, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(36.96, 20.02)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(34.38, 15.12)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(36.31, 14.6)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(36.55, 15.48)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.61, 15.99)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.38, 15.12)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(32.72, 11.43)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.45, 10.43)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.9, 11.21)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(33.17, 12.22)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(32.72, 11.43)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(34.92, 27.92)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.47, 28.7)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(32.73, 27.7)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(33.19, 26.92)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.92, 27.92)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(34.62, 23.13)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(36.56, 23.65)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(36.32, 24.53)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.39, 24.01)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(34.62, 23.13)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(30.18, 30.84)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(30.82, 30.2)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(32.24, 31.61)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(31.6, 32.26)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(30.18, 30.84)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(26.9, 33.21)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(27.69, 32.76)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(28.69, 34.49)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(27.9, 34.94)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(26.9, 33.21)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(23.12, 34.65)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(24, 34.42)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(24.52, 36.35)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(23.64, 36.59)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(23.12, 34.65)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(19.07, 34.1)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.98, 34.1)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.98, 37.04)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.07, 37.04)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.07, 34.1)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(14.56, 36.35)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(15.08, 34.42)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(15.96, 34.65)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(15.44, 36.59)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(14.56, 36.35)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(10.39, 34.49)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(11.39, 32.76)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(12.18, 33.21)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(11.18, 34.94)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(10.39, 34.49)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(6.61, 32.72)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(6.6, 32.72) controlPoint1: CGPointMake(6.6, 32.72) controlPoint2: CGPointMake(6.6, 32.72)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(17.71, 16.82)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(32.68, 6.56)];
                [safariPhoneMinimalPath addCurveToPoint: CGPointMake(32.7, 6.58) controlPoint1: CGPointMake(32.69, 6.57) controlPoint2: CGPointMake(32.69, 6.57)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(21.87, 20.9)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(6.61, 32.72)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(18.39, 17.68)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(10.16, 29.01)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(21, 20.3)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(18.39, 17.68)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(19.98, 5.03)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.07, 5.03)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.07, 2.1)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.98, 2.1)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(19.98, 5.03)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(24.49, 2.8)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(23.97, 4.73)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(23.1, 4.5)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(23.61, 2.56)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(24.49, 2.8)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(28.66, 4.65)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(27.66, 6.39)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(26.88, 5.93)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(27.88, 4.2)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(28.66, 4.65)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(14.59, 2.8)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(15.47, 2.56)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(15.98, 4.5)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(15.11, 4.73)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(14.59, 2.8)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(10.41, 4.65)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(11.2, 4.2)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(12.2, 5.93)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(11.42, 6.39)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(10.41, 4.65)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(6.86, 7.52)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(7.51, 6.88)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(8.92, 8.3)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(8.28, 8.94)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(6.86, 7.52)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(4.17, 11.21)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.63, 10.43)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(6.36, 11.43)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(5.91, 12.22)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.17, 11.21)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(4.47, 15.99)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.53, 15.48)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.77, 14.6)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.7, 15.12)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.47, 15.99)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(4.98, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.98, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.05, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.05, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.05, 20.02)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.05, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.05, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.05, 19.11)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.98, 19.11)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(4.69, 24.01)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.76, 24.53)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(2.52, 23.65)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.46, 23.13)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.69, 24.01)];
                [safariPhoneMinimalPath closePath];
                [safariPhoneMinimalPath moveToPoint: CGPointMake(6.35, 27.7)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.61, 28.7)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(4.16, 27.92)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(5.89, 26.92)];
                [safariPhoneMinimalPath addLineToPoint: CGPointMake(6.35, 27.7)];
                [safariPhoneMinimalPath closePath];
                [fillColor setFill];
                [safariPhoneMinimalPath fill];
                
                sharedActivityImage = UIGraphicsGetImageFromCurrentImageContext();
            }
            UIGraphicsEndImageContext();
        }
    });
    
    return sharedActivityImage;
}


@end
