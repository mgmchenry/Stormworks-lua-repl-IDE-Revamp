--[[

Crossposting this here. Original post by bones in #lua

Some ballistic numbers:
- Larger caliber projectiles receive proportionally less force from the wind
- Rocket, Battle, Artillery, Bertha projectiles no longer despawn when velocity drops below 50m/s, unless underwater
- Projectile drop due to gravity increased: 0.3 -> 0.5
- Speargun velocity: 60 -> 80
- Rocket Launcher spread: 0.02 -> 0.015
- Projectile lifespan in ticks:
    Pistol: 180 -> 300
    SMG: 180 -> 300
    Rifle: 180 -> 300
    Machine Gun: 180 -> 300
    Light Autocannon: 180 -> 300
    Rotary Autocannon: 180 -> 300
    Heavy Autocannon: 360 -> 600
    Rocket Launcher: 300 -> 3600
    Battle Cannon: 300 -> 3600
    Artillery Cannon: 300 -> 3600
    Bertha Cannon: 300 -> 3600
- Muzzle velocity:
    Machine Gun: 800 = 800
    Light Autocannon: 1000 = 1000
    Rotary Autocannon: 1000 = 1000
    Heavy Autocannon: 1000 -> 900
    Battle Cannon: 840 -> 800
    Artillery Cannon: 840 -> 700
    Bertha Cannon: 660 -> 600
- Projectile drag:
    Heavy Autocannon: 0.008 -> 0.005
    Rocket Launcher: 0.005 -> 0.003
    Battle Cannon: 0.004 -> 0.002
    Artillery Cannon: 0.002 -> 0.001
    Bertha Cannon: 0.001 -> 0.0005
- Approx. max projectile travel before despawning:
    Machinegun: 500m
    Light Auto: 750m
    Rotary Auto: 1.5km
    Heavy Auto: 2.5km
- Approx. indirect fire range at 45 degree angle:
    Rocket Launcher 2.5km
    Battle 4.5km
    Artillery 6.5km
    Bertha 7.5km


Machine Gun
    Muzzle velocity (m/s): 800
    Drag Coefficient: ?
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 300
    Despawn Speed (m/s): 50
    
Light Autocannon
    Muzzle velocity (m/s): 1000
    Drag Coefficient: 0.02
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 300
    Despawn Speed (m/s): 50
    
Rotary Autocannon
    Muzzle velocity (m/s): 1000
    Drag Coefficient: 0.01
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 300
    Despawn Speed (m/s): 50
    
Heavy Autocannon
    Muzzle velocity (m/s): 900
    Drag Coefficient: 0.005
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 600
    Despawn Speed (m/s): 50
    
Battle Cannon
    Muzzle velocity (m/s): 800m
    Drag Coefficient: 0.002
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 3600
    Despawn Speed (m/s): N/A (50m/s underwater)
    
Artillery Cannon
    Muzzle velocity (m/s): 700
    Drag Coefficient: 0.001
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 3600
    Despawn Speed (m/s): N/A (50m/s underwater)
    
Big Bertha Cannon
    Muzzle velocity (m/s): 600
    Drag Coefficient: 0.0005
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 3600
    Despawn Speed (m/s): N/A (50m/s underwater)

Rocket Launcher
    Muzzle velocity (m/s): ? (This guy accelerates for a certain amount of time)
    Drag Coefficient: 0.003
    Gravity: 30 m/s^2, 0.5m/s/t
    Despawn Timer (ticks): 3600
    Despawn Speed (m/s): N/A (50m/s underwater)

- Larger caliber projectiles receive proportionally less force from the wind
  
]]