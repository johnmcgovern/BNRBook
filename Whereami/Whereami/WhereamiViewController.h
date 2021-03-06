//
//  WhereamiViewController.h
//  Whereami
//
//  Created by John McGovern on 8/3/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface WhereamiViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
    
}

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;

@end
