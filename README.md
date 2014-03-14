# iBeacon CLI

Swiss Army Command Line Utility for working with iBeacons.

## Usage



### Examples

Broadcasting:

```
% ibeacon --broadcast --uuid 2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6 --major 100 --minor 101
Broadcasting iBeacon UUID: 2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6, Major: 100, Minor: 101, Power: -32
```

Scanning:

```
% ibeacon --scan
{ranged: []}
{entered: { uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 1, minor: 1, rssi: -61}}
{ranged: [{ uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 1, minor: 1, rssi: -61}]}
{ranged: [{ uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 1, minor: 1, rssi: 0}]}
{entered: { uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 9, minor: 8, rssi: -34}}
{ranged: [{ uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 1, minor: 1, rssi: -61},
          { uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 9, minor: 8, rssi: -34}]}
{ranged: [{ uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 1, minor: 1, rssi: 0},
          { uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 9, minor: 8, rssi: 0}]}
{ranged: [{ uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 1, minor: 1, rssi: -63},
          { uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 9, minor: 8, rssi: 0}]}
{exited:  { uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 9, minor: 8, rssi: 0}}
{ranged: [{ uuid: "2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6", major: 1, minor: 1, rssi: -94}]}
```

# License

Copyright (c) 2014 by Radius Networks

This software is licensed under an adapted BSD license, the Attribution Assurance License.  See the [LICENSE](LICENSE) for details.
