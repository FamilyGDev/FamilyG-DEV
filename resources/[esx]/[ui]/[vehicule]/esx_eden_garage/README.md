# esx_eden_garage
Vehicle Garage based on ESX

This Garage Script only takes into account the Vehicles Purchased in the Car Shop. Players can also go to the Car Pound to retrieve their Vehicle if its lost or Destroyed for a Fee. During a reboot all Vehicles go back home.

# Requirement:

* Vehicle Shop
  * esx_vehicleshop => https://github.com/ESX-Org/esx_vehicleshop

# Installation

1) CD in your resources/[esx] folder
2) Clone the repository
3) Import eden_garage.sql in your database

4) Add this in your server.cfg :

```
start esx_eden_garage
```

# KNOWN BUG:

- It is Possible to Duplicate Vehicles but do note that if said Person Duplicates a Vehicle & takes 1 of them & sell thems the other one is useless & can NOT be stored or sold.

# How to use my version
To store the Vehicle in the Garage:
- Pull into the red dot
- Open the menu
- Select Return Vehicle

To take a Vehicle back out:
- Walk into the green dot
- Open the menu
- Select View Vehicle List

To retrieve a Vehicle from the Pound:
- Walk into the blue dot
- Open the menu
- Select the Vehicle from the list
