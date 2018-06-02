# esx_eden_aircraftgarage
Aircraft Garage based on ESX

This Garage Script only takes into account the Aircrafts Purchased in the Aircraft Shop. Players can also go to the Aircraft Pound to retrieve their Aircraft if its lost or Destroyed for a Fee. During a reboot all Vehicles go back home.

# Requirement:

* Aircraft Shop
  * esx_aircraftshop => https://github.com/HumanTree92/esx_aircraftshop

# Installation

1) CD in your resources/[esx] folder
2) Clone the repository
3) Import eden_aircraftgarage.sql in your database

4) Add this in your server.cfg :

```
start esx_eden_aircraftgarage
```

# KNOWN BUG:

- It is Possible to Duplicate Vehicles but do note that if said Person Duplicates a Vehicle & takes 1 of them & sell thems the other one is useless & can NOT be stored or sold.

# How to use my version
To store the Aircraft in the Garage:
- Pull into the red dot
- Open the menu
- Select Return Vehicle

To take a Aircraft back out:
- Walk into the green dot
- Open the menu
- Select View Vehicle List

To retrieve a Aircraft from the Pound:
- Walk into the blue dot
- Open the menu
- Select the Aircraft from the list
