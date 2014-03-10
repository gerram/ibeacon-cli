# iBeacon CLI

Swiss Army Command Line Utility for working with iBeacons.

### Examples

Broadcasting:

```
% ibeacon --broadcast --uuid 2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6 --major 100 --minor 101
Broadcasting iBeacon UUID: 2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6, Major: 100, Minor: 101, Power: -32
```

Scanning:

```
% scanbeacon --scan
{ranged: []}
{entered: { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -61, power: -66 }}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -61, power: -66 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: 0, power: -66 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -61, power: -66 }]}
{entered: { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: -34, power: -7 }}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -61, power: -66 },
          { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: -34, power: -7 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -88, power: -66 },
          { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: -35, power: -7 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: 0, power: -66 },
          { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: -67, power: -7 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -83, power: -66 },
          { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: 0, power: -7 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -60, power: -66 },
          { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: 0, power: -7 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: 0, power: -66 },
          { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: 0, power: -7 }]}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -63, power: -66 },
          { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: 0, power: -7 }]}
{exited: { uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 9, minor: 8, rssi: 0, power: -7 }}
{ranged: [{ uuid: "EE23D392-60B6-4CAE-91DC-7CA1D28F4198", major: 1, minor: 1, rssi: -94, power: -66 }]}
```