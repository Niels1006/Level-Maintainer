# Infinite Maintainer
Lets you passive lines easily, without lag and randomness of AE2 maintainer.
Maybe I will also add a threshold option, but it's not needed for passive lines, so...

# Setup
- Full block ME interface connected to an adapter
- Crafting Monitors on your CPUs
- (Internet card)
- OC stuff to make a basic computer

# Installation
Download it
```bash
wget https://raw.githubusercontent.com/Niels1006/Infinite-Maintainer/master/installer.lua && installer
```

Run it
```bash
Maintainer
```

# Config
You can change maintained items in `config.lua`. Pattern is as follows: `["item_name"] = {batch_size, threshold}` as well as the time inbetween craft checks.
!! Keep in mind that threshold should only be added if necessary and preferrably not in mainnet, since it has a performance impact!
Reboot after changing values.
