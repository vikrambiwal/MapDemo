//
//  ViewController.m
//  MapDemo
//
//  Created by GauravDS on 01/12/15.
//  Copyright © 2015 baltech. All rights reserved.
//

#import "ViewController.h"
#import <GoogleMaps/GoogleMaps.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate, GMSMapViewDelegate>{
    
    IBOutlet GMSMapView *viewForMap;
    NSManagedObjectContext *  managedObjectContext;
    CLLocationManager *locationManager;
    CLGeocoder * geocoder;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    locationManager.distanceFilter =  11000.0f;
    locationManager.activityType = CLActivityTypeOtherNavigation;
   

    geocoder = [[CLGeocoder alloc] init];
    

    
    if ([CLLocationManager locationServicesEnabled]) {
        //        [locationManager startUpdatingLocation];
    } else {
        NSLog(@"Location services is not enabled");
    }
    

    NSLog(@"Location wwwwwwwwwww %f", locationManager.location.coordinate.longitude);
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:locationManager.location.coordinate.latitude
                                                            longitude:locationManager.location.coordinate.longitude
                                                                 zoom:6];
    
    
    CGRect rect=viewForMap.frame;
    rect.origin.x=0;
    rect.origin.y =0;
    GMSMapView *   mapView_ = [GMSMapView mapWithFrame:rect camera:camera];
    mapView_.myLocationEnabled = YES;
    //    viewForMap = mapView_;
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(locationManager.location.coordinate.latitude, locationManager.location.coordinate.longitude);
    marker.title = @"ME";
    marker.snippet = @"Map Demo";
    marker.map = mapView_;
    [viewForMap addSubview:mapView_];
    
    //add multiple loaction here
    for (int i=0; i < 8; i++) {
        
        marker = [[GMSMarker alloc] init];
        marker.position = CLLocationCoordinate2DMake(-33.86 +i*2 , 151.20+i*5);
        marker.title = [ NSString stringWithFormat:@"Sydnny -- %d",i];
        marker.snippet = [ NSString stringWithFormat:@"Australia -- %d",i];
        
        marker.map = mapView_;
        [viewForMap addSubview:mapView_];
    }
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
