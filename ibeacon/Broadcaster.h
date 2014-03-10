//
//  Broadcaster.h
//  ibeacon
//
//  Created by Christopher Sexton on 3/10/14.
//  Copyright (c) 2014 RadiusNetworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IOBluetooth/IOBluetooth.h>

@interface Broadcaster : NSObject <CBPeripheralManagerDelegate>

@property CBPeripheralManager* manager;
@property NSDictionary *peripheralData;

- (void)startAdvertisingWithUUID:(NSString *)uuid major:(NSInteger)major minor:(NSInteger)minor power:(NSInteger)power;

@end
