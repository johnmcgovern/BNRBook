//
//  WhereamiViewController.m
//  Whereami
//
//  Created by John McGovern on 8/3/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import "WhereamiViewController.h"
#import "BNRMapPoint.h"


@implementation WhereamiViewController

-(void)findLocation
{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc
{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    // Create an instance of BNRMapPoint with the current date
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    
    // Add it to the map view
    [worldView addAnnotation:mp];
    
    // Zoom the region to this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    // Reset the UI
    [locationTitleField setText:@""];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingLocation];
}

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
    
    // How many seconds ago was the location created?
    NSTimeInterval t = [[newLocation timestamp] timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the
    // device first, you don't want that data in this case.
    // If this locaiton as made more than 3 minutes ago, ignore it.
    if (t<-180)
    {
        // This is cached data, you don't want it, keep looking
        return;
    }
    
    [self foundLocation:newLocation];
}

-(void)locationManager:(CLLocationManager *)manager
    didFailWithError:(NSError *)error
{
    NSLog(@"Could not find location : %@",error);
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // here we are ready to zoom
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 500, 500);
    [worldView setRegion:region animated:YES];
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // This isn't implemented yet, but will be soon.
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

-(void)dealloc
{
    // Tell the locatio manager to stop sending us messages
    [locationManager setDelegate:nil];
}

@end
