//
//  Broadcaster.m
//  ibeacon
//
//  Created by Christopher Sexton on 3/10/14.
//  Copyright (c) 2014 RadiusNetworks. All rights reserved.
//

#import "Broadcaster.h"

@implementation Broadcaster

-(id)init {
    if (self = [super init])  {
        dispatch_queue_t queue;
        queue = dispatch_queue_create("com.example.MacBeaconAdvertise", NULL);
        self.manager = [[CBPeripheralManager alloc] initWithDelegate:self queue: queue];
    }
    return self;
}


- (void)startAdvertisingWithUUID:(NSString *)uuid major:(NSInteger)major minor:(NSInteger)minor power:(NSInteger)power
{

    // generate the key
    NSData *keyData = [[NSData alloc] initWithBase64EncodedString:@"a0NCQWR2RGF0YUFwcGxlQmVhY29uS2V5" options:NSDataBase64DecodingIgnoreUnknownCharacters];
    NSString *key = [[NSString alloc] initWithData:keyData encoding:NSUTF8StringEncoding];

    self.peripheralData = [self peripheralDataWithUUID:uuid
                                                 major:major
                                                 minor:minor
                                                 power:power
                                                   key:key];
}

- (NSDictionary *)peripheralDataWithUUID:(NSString *)uuid
                                   major:(NSInteger)major
                                   minor:(NSInteger)minor
                                   power:(NSInteger)power
                                      key:(NSString *)key
{

    // crunch all the datafields into the periphData dictionary
    struct pdata
    {
        CFUUIDBytes     uuid;
        unsigned short  major;
        unsigned short  minor;
        SignedByte      power;
    };
    struct pdata dataContainer;

    // turn uuid into a byte string
    NSString *tempstring = [NSString stringWithString:uuid];
    CFStringRef uuidCFStringRef = (__bridge CFStringRef)tempstring;
    CFUUIDRef uuidRef = CFUUIDCreateFromString(kCFAllocatorDefault, uuidCFStringRef);
    dataContainer.uuid = CFUUIDGetUUIDBytes(uuidRef);
    CFRelease(uuidRef);

    // massage othere data elements
    dataContainer.major = NSSwapShort((unsigned short)major);
    dataContainer.minor = NSSwapShort((unsigned short)minor);
    dataContainer.power = (SignedByte)power;

    // encode data and update periphData dictionary
    NSData *encodedData = [NSData dataWithBytes: &dataContainer length: sizeof(dataContainer)-1];
    NSDictionary *periphData = [NSDictionary dictionaryWithObject:encodedData forKey:key];

    return periphData;
}

- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral {
    if(self.peripheralData && self.manager.state == CBPeripheralManagerStatePoweredOn)
    {
        [self.manager startAdvertising:self.peripheralData];
    }
}


@end
