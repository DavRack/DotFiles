//this is an example config file for skr

// the keyboard path skr will remap
// keyboard_path = "/dev/input/by-id/usb-ASUSTeK_Computer_Inc._N-KEY_Device-event-kbd"
keyboard_path = "/dev/input/by-id/usb-DavRack_Atreus50_0-event-kbd"

// for examples and source code visit: https://github.com/DavRack/skr
// some common remaps as example, uncomment the ones you want to use or create new ones
//
// Remap caps lock to esc
// remap {
//     from = "TAB"
//     to = "ESC"
// }
// //
// // Swap left super with left alt
// swap {
//     from = "META"
//     to = "ALT"
// }
//
// Create a fn layer using caps lock as a fn key to mimic vim movements
layer navigation { // "navigation" is the layer name 
    trigger = "ALT"

    remap {
        from = "H"
        to="LEFT"
    }
    
    remap {
        from = "J"
        to="DOWN"
    }
    
    remap {
        from = "K"
        to="UP"
    }
    
    remap {
        from = "l"
        to="RIGHT"
    }

    remap {
        from = "SPACE"
        to="TAB"
    }

    remap {
        from = "m"
        to="shift+m"
    }
}
