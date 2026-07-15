# GiD structural 2D problemtype template
This template provides a simple starting point for GiD structural 2D problemtypes.

It already includes a basic data tree with:
- Material properties
- Fixed displacements and rotations
- Gravity
- Point and line loads
- General analysis and time parameters

Use it as a base for your own structural 2D teaching or prototype problemtypes.

Remember to:
- Change the name: the name.gid must be the same as name.tcl, name.spd, name.win.bat, name.xml...
- Change the namespace: Inside name.tcl, you can find a namespace. Change it to your name.
- Check the documentation in [Customization Manual](https://www.gidsimulation.com/gid-for-science/support/manuals/)
- Extend the `.spd` and `.tcl` files with your own calculation-file export logic

Good luck