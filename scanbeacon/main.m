//
//  main.m
//  scanbeacon
//
//  Created by Christopher Sexton on 3/7/14.
//  Copyright (c) 2014 RadiusNetworks. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>
#include <getopt.h>

#import "Scanner.h"

static void sigint(const int signum) {
    printf("\n");
    exit(EXIT_SUCCESS);
}

void print_usage() {
    printf("scanbeacon  -  Scan for iBeacons\n");
    printf("\n");
    printf("       -h  --help             Display this message.\n");
    printf("       -i  --interval         Time interval in seconds\n");
}

int main(int argc, char * argv[]) {
    int exit_value = EXIT_SUCCESS;

    @autoreleasepool {
        signal(SIGINT, sigint);

        static struct option long_options[] =
        {
            {"interval", required_argument, NULL, 'i'},
            {"help", no_argument, NULL, 'h'},
            {NULL, 0, NULL, 0}
        };

        int opt = 0;
        double interval = 1.1;
        while ((opt = getopt_long(argc, argv, "hi:", long_options, NULL)) != -1)
        {
            // check to see if a single character or long option came through
            switch (opt)
            {
                case 'i':
                    interval = atof(optarg);
                    break;
                case 'h':
                    print_usage();
                    exit(EXIT_SUCCESS);
                    break;
            }
        }

        Scanner *scanner = [[Scanner alloc] init];
        [scanner startWithTimeInterval:interval];
        [[NSRunLoop currentRunLoop] run];
    }
    return exit_value;
}

