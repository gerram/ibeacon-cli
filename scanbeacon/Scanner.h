//
//  Scanner.h
//  scanbeacon
//
//  Created by Christopher Sexton on 3/8/14.
//  Copyright (c) 2014 RadiusNetworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>

@interface Scanner : NSObject <CBCentralManagerDelegate>

@property CBCentralManager *centralManager;
@property NSTimer *timer;
@property NSMutableDictionary *scans;
@property double quietTime;

- (void)startWithTimeInterval:(double)interval;

@end
