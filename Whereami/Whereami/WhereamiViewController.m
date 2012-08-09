//
//  WhereamiViewController.m
//  Whereami
//
//  Created by John McGovern on 8/3/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import "WhereamiViewController.h"


@implementation WhereamiViewController

-(void) viewDidLoad
{
    [worldView setShowsUserLocation:YES];
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        // Create location manager object
        locationManager = [[CLLocationManager alloc] init];
        
        // There will be a warning from this line of code; ignore for now
        [locationManager setDelegate:self];
        
        // And we want it to be as accurate as possible
        // regardless of home much time/power it takes
        [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        
        // Tell our manager to start looking for its location immediately
        //[locationManager startUpdatingLocation];
    }
    
    return self;
}

-(void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
    fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"%@",newLocation);
}

-(void)locationManager:(CLLocationManager *)manager
    didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location : %@",error);
}

-(void)dealloc
{
    // Tell the locatio manager to stop sending us messages
    [locationManager setDelegate:nil];
}

@end
