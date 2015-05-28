//
//  TOActivityChrome.m
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

#import "TOActivityChrome.h"

NSString *const TOActivityTypeChrome = @"au.com.timoliver.TOActivityTypeChrome";

/* Detect which user idiom we're running on */
#define IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

@interface TOActivityChrome ()

/* The URL to load */
@property (nonatomic, strong) NSURL *url;

+ (UIImage *)sharedActivityImage;

@end

@implementation TOActivityChrome

#pragma mark - Activity Display Properties -
- (NSString *)activityType
{
    return TOActivityTypeChrome;
}

- (NSString *)activityTitle
{
    return NSLocalizedStringFromTable(@"Chrome", @"TOWebViewControllerLocalizable", @"Open in Chrome Action");
}

- (UIImage *)activityImage
{
    return [TOActivityChrome sharedActivityImage];
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
    
    NSURL *inputURL = self.url;
    NSString *scheme = inputURL.scheme;
    
    // Replace the URL Scheme with the Chrome equivalent.
    NSString *chromeScheme = nil;
    if ([scheme isEqualToString:@"http"]) {
        chromeScheme = @"googlechrome";
    } else if ([scheme isEqualToString:@"https"]) {
        chromeScheme = @"googlechromes";
    }
    
    // Proceed only if a valid Google Chrome URI Scheme is available.
    if (chromeScheme) {
        NSString *absoluteString = [inputURL absoluteString];
        NSRange rangeForScheme = [absoluteString rangeOfString:@":"];
        NSString *urlNoScheme =
        [absoluteString substringFromIndex:rangeForScheme.location];
        NSString *chromeURLString =
        [chromeScheme stringByAppendingString:urlNoScheme];
        NSURL *chromeURL = [NSURL URLWithString:chromeURLString];

        // Open the URL with Chrome.
        [[UIApplication sharedApplication] openURL:chromeURL];
        [self activityDidFinish:YES];
        return;
    }
    
    [self activityDidFinish:NO];
}

- (BOOL)canPerformWithActivityItems:(NSArray *)activityItems
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"googlechrome://"]] == NO)
        return NO;
    
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
                UIBezierPath* chromePadMinimalPath = [UIBezierPath bezierPath];
                [chromePadMinimalPath moveToPoint: CGPointMake(26.5, 53)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(0, 26.5) controlPoint1: CGPointMake(11.86, 53) controlPoint2: CGPointMake(0, 41.14)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.5, 0) controlPoint1: CGPointMake(0, 11.86) controlPoint2: CGPointMake(11.86, 0)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(53, 26.5) controlPoint1: CGPointMake(41.14, 0) controlPoint2: CGPointMake(53, 11.86)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.5, 53) controlPoint1: CGPointMake(53, 41.14) controlPoint2: CGPointMake(41.14, 53)];
                [chromePadMinimalPath closePath];
                [chromePadMinimalPath moveToPoint: CGPointMake(24.88, 51.89)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(34.1, 36.36)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.45, 38.99) controlPoint1: CGPointMake(31.98, 38) controlPoint2: CGPointMake(29.34, 38.99)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(14.92, 31.31) controlPoint1: CGPointMake(21.26, 38.99) controlPoint2: CGPointMake(16.81, 35.82)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(5.03, 12.68)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(0.97, 26.46) controlPoint1: CGPointMake(2.47, 16.66) controlPoint2: CGPointMake(0.97, 21.38)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(24.88, 51.89) controlPoint1: CGPointMake(0.97, 40.01) controlPoint2: CGPointMake(11.54, 51.06)];
                [chromePadMinimalPath closePath];
                [chromePadMinimalPath moveToPoint: CGPointMake(15.76, 30.77)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(15.92, 31.05)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(15.88, 31.07)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.5, 38.08) controlPoint1: CGPointMake(17.65, 35.19) controlPoint2: CGPointMake(21.73, 38.08)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(38.05, 26.54) controlPoint1: CGPointMake(32.88, 38.08) controlPoint2: CGPointMake(38.05, 32.91)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(27.38, 15.03) controlPoint1: CGPointMake(38.05, 20.46) controlPoint2: CGPointMake(33.35, 15.49)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(25.86, 15.03)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(25.86, 15.02)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(14.95, 26.54) controlPoint1: CGPointMake(19.78, 15.35) controlPoint2: CGPointMake(14.95, 20.37)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(15.76, 30.77) controlPoint1: CGPointMake(14.95, 28.03) controlPoint2: CGPointMake(15.25, 29.46)];
                [chromePadMinimalPath closePath];
                [chromePadMinimalPath moveToPoint: CGPointMake(26.49, 0.94)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(5.66, 11.74) controlPoint1: CGPointMake(17.88, 0.94) controlPoint2: CGPointMake(10.29, 5.21)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(14, 27.45)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(13.95, 26.49) controlPoint1: CGPointMake(13.98, 27.13) controlPoint2: CGPointMake(13.95, 26.81)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.45, 13.99) controlPoint1: CGPointMake(13.95, 19.59) controlPoint2: CGPointMake(19.55, 13.99)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(27.09, 14.02) controlPoint1: CGPointMake(26.67, 13.99) controlPoint2: CGPointMake(26.88, 14.01)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(48.76, 14.02)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.49, 0.94) controlPoint1: CGPointMake(44.39, 6.22) controlPoint2: CGPointMake(36.06, 0.94)];
                [chromePadMinimalPath closePath];
                [chromePadMinimalPath moveToPoint: CGPointMake(31.45, 15.03)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(38.95, 26.49) controlPoint1: CGPointMake(35.86, 16.96) controlPoint2: CGPointMake(38.95, 21.36)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(37.46, 32.41) controlPoint1: CGPointMake(38.95, 28.63) controlPoint2: CGPointMake(38.41, 30.65)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(37.46, 32.41)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(37.46, 32.42)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(37.31, 32.66) controlPoint1: CGPointMake(37.41, 32.5) controlPoint2: CGPointMake(37.36, 32.58)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(25.87, 51.94)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.49, 51.97) controlPoint1: CGPointMake(26.08, 51.95) controlPoint2: CGPointMake(26.28, 51.97)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(52, 26.46) controlPoint1: CGPointMake(40.58, 51.97) controlPoint2: CGPointMake(52, 40.55)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(49.28, 15.03) controlPoint1: CGPointMake(52, 22.35) controlPoint2: CGPointMake(51.01, 18.47)];
                [chromePadMinimalPath addLineToPoint: CGPointMake(31.45, 15.03)];
                [chromePadMinimalPath closePath];
                [chromePadMinimalPath moveToPoint: CGPointMake(26.49, 16.01)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(36.98, 26.51) controlPoint1: CGPointMake(32.29, 16.01) controlPoint2: CGPointMake(36.98, 20.71)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.49, 37.02) controlPoint1: CGPointMake(36.98, 32.31) controlPoint2: CGPointMake(32.29, 37.02)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(16.01, 26.51) controlPoint1: CGPointMake(20.7, 37.02) controlPoint2: CGPointMake(16.01, 32.31)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.49, 16.01) controlPoint1: CGPointMake(16.01, 20.71) controlPoint2: CGPointMake(20.7, 16.01)];
                [chromePadMinimalPath closePath];
                [chromePadMinimalPath moveToPoint: CGPointMake(26.49, 36)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(36.03, 26.47) controlPoint1: CGPointMake(31.76, 36) controlPoint2: CGPointMake(36.03, 31.73)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.49, 16.93) controlPoint1: CGPointMake(36.03, 21.2) controlPoint2: CGPointMake(31.76, 16.93)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(16.96, 26.47) controlPoint1: CGPointMake(21.23, 16.93) controlPoint2: CGPointMake(16.96, 21.2)];
                [chromePadMinimalPath addCurveToPoint: CGPointMake(26.49, 36) controlPoint1: CGPointMake(16.96, 31.73) controlPoint2: CGPointMake(21.23, 36)];
                [chromePadMinimalPath closePath];
                [fillColor setFill];
                [chromePadMinimalPath fill];
                
                sharedActivityImage = UIGraphicsGetImageFromCurrentImageContext();
            }
            UIGraphicsEndImageContext();
        }
        else { //iPhone
            UIGraphicsBeginImageContextWithOptions((CGSize){40, 40}, NO, [[UIScreen mainScreen] scale]);
            {
                UIBezierPath* chromePhoneMinimalPath = [UIBezierPath bezierPath];
                [chromePhoneMinimalPath moveToPoint: CGPointMake(19.5, 38.97)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.03, 38.95) controlPoint1: CGPointMake(19.34, 38.97) controlPoint2: CGPointMake(19.19, 38.95)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(19, 39)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(18.9, 38.94)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(0, 19.48) controlPoint1: CGPointMake(8.41, 38.62) controlPoint2: CGPointMake(0, 30.04)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.5, 0) controlPoint1: CGPointMake(0, 8.72) controlPoint2: CGPointMake(8.73, 0)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(39, 19.48) controlPoint1: CGPointMake(30.27, 0) controlPoint2: CGPointMake(39, 8.72)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.5, 38.97) controlPoint1: CGPointMake(39, 30.25) controlPoint2: CGPointMake(30.27, 38.97)];
                [chromePhoneMinimalPath closePath];
                [chromePhoneMinimalPath moveToPoint: CGPointMake(18.44, 37.91)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(24.62, 27.5)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 29) controlPoint1: CGPointMake(23.15, 28.44) controlPoint2: CGPointMake(21.4, 29)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(10.33, 21.93) controlPoint1: CGPointMake(15.1, 29) controlPoint2: CGPointMake(11.41, 26)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(3.85, 9.74)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(1.04, 19.5) controlPoint1: CGPointMake(2.08, 12.57) controlPoint2: CGPointMake(1.04, 15.91)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(18.44, 37.91) controlPoint1: CGPointMake(1.04, 29.33) controlPoint2: CGPointMake(8.74, 37.35)];
                [chromePhoneMinimalPath closePath];
                [chromePhoneMinimalPath moveToPoint: CGPointMake(11.43, 22.14)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(11.76, 22.76)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(11.67, 22.81)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 28) controlPoint1: CGPointMake(12.96, 25.86) controlPoint2: CGPointMake(15.99, 28)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(26.5, 24.34) controlPoint1: CGPointMake(22.41, 28) controlPoint2: CGPointMake(24.97, 26.55)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(26.99, 23.51)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(27.01, 23.52)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(28.02, 19.5) controlPoint1: CGPointMake(27.65, 22.32) controlPoint2: CGPointMake(28.02, 20.95)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(20.44, 11.05) controlPoint1: CGPointMake(28.02, 15.12) controlPoint2: CGPointMake(24.7, 11.52)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(19.03, 11.05)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(19.03, 11.02)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(11, 19.5) controlPoint1: CGPointMake(14.56, 11.27) controlPoint2: CGPointMake(11, 14.97)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(11.43, 22.14) controlPoint1: CGPointMake(11, 20.42) controlPoint2: CGPointMake(11.16, 21.31)];
                [chromePhoneMinimalPath closePath];
                [chromePhoneMinimalPath moveToPoint: CGPointMake(19.51, 1.04)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(4.39, 8.91) controlPoint1: CGPointMake(13.26, 1.04) controlPoint2: CGPointMake(7.74, 4.15)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(10.01, 19.46)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.03, 10.02) controlPoint1: CGPointMake(10.02, 14.4) controlPoint2: CGPointMake(14.02, 10.27)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(19.03, 10.01)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(19.21, 10.01)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 10) controlPoint1: CGPointMake(19.31, 10.01) controlPoint2: CGPointMake(19.41, 10)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.81, 10.01) controlPoint1: CGPointMake(19.61, 10) controlPoint2: CGPointMake(19.71, 10.01)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(35.35, 10.01)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 1.04) controlPoint1: CGPointMake(32.11, 4.64) controlPoint2: CGPointMake(26.24, 1.04)];
                [chromePhoneMinimalPath closePath];
                [chromePhoneMinimalPath moveToPoint: CGPointMake(23.85, 11.05)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(29.02, 19.5) controlPoint1: CGPointMake(26.92, 12.63) controlPoint2: CGPointMake(29.02, 15.82)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(27.87, 24.03) controlPoint1: CGPointMake(29.02, 21.14) controlPoint2: CGPointMake(28.6, 22.68)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(27.89, 24.04)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(19.62, 37.96)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(37.99, 19.5) controlPoint1: CGPointMake(29.78, 37.9) controlPoint2: CGPointMake(37.99, 29.66)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(35.93, 11.05) controlPoint1: CGPointMake(37.99, 16.45) controlPoint2: CGPointMake(37.24, 13.58)];
                [chromePhoneMinimalPath addLineToPoint: CGPointMake(23.85, 11.05)];
                [chromePhoneMinimalPath closePath];
                [chromePhoneMinimalPath moveToPoint: CGPointMake(19.51, 12.01)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(27.01, 19.5) controlPoint1: CGPointMake(23.65, 12.01) controlPoint2: CGPointMake(27.01, 15.36)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 26.99) controlPoint1: CGPointMake(27.01, 23.63) controlPoint2: CGPointMake(23.65, 26.99)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(12.02, 19.5) controlPoint1: CGPointMake(15.37, 26.99) controlPoint2: CGPointMake(12.02, 23.63)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 12.01) controlPoint1: CGPointMake(12.02, 15.36) controlPoint2: CGPointMake(15.37, 12.01)];
                [chromePhoneMinimalPath closePath];
                [chromePhoneMinimalPath moveToPoint: CGPointMake(19.51, 26.01)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(26.02, 19.5) controlPoint1: CGPointMake(23.11, 26.01) controlPoint2: CGPointMake(26.02, 23.09)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 12.99) controlPoint1: CGPointMake(26.02, 15.91) controlPoint2: CGPointMake(23.11, 12.99)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(13, 19.5) controlPoint1: CGPointMake(15.92, 12.99) controlPoint2: CGPointMake(13, 15.91)];
                [chromePhoneMinimalPath addCurveToPoint: CGPointMake(19.51, 26.01) controlPoint1: CGPointMake(13, 23.09) controlPoint2: CGPointMake(15.92, 26.01)];
                [chromePhoneMinimalPath closePath];
                [fillColor setFill];
                [chromePhoneMinimalPath fill];
                
                sharedActivityImage = UIGraphicsGetImageFromCurrentImageContext();
            }
            UIGraphicsEndImageContext();
        }
    });
    
    return sharedActivityImage;
}


@end
