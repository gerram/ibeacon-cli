//
//  ScanItem.h
//  scanbeacon
//
//  Created by Christopher Sexton on 3/8/14.
//  Copyright (c) 2014 RadiusNetworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>


@interface ScanItem : NSObject

@property (strong) NSString *identifier;
@property NSDate *first_seen;
@property NSDate *last_seen;
@property (strong) NSString *uuid;
@property NSInteger major;
@property NSInteger minor;
@property NSInteger power;
@property NSInteger rssi;

- (id)initWithPeripheral:(CBPeripheral *)peripheral
       advertisementData:(NSDictionary *)advertisementData
                    RSSI:(NSNumber *)rssi;

- (NSString *)jsonString;

@end