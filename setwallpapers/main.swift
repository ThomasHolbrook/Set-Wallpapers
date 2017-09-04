//
//  main.swift
//  setwallpapers
//
//  Created by Thomas Holbrook on 31/08/2017.
//  Copyright © 2017 Thomas Holbrook. All rights reserved.
//

import Foundation
import AppKit

let arguments = CommandLine.arguments
let executableName = NSString(string: CommandLine.arguments.first!).pathComponents.last!

func usage() {
    
    print("")
    print("\(executableName) sets the Desktop Picture on all attached displays instantly.")
    print("")
    print("Usage:")
    print("\t\(executableName) <Desktop Picture>")
    print("")
    print("Example: \(executableName) \"/Library/Desktop Pictures/Color Burst 1.jpg\" ")
    print("")
    print("Thomas Holbrook (Tom@Jigsaw24.com) - This software is provided \"as is\", without warranty of any kind.")
    print("")
}

func setWallpaper() {
    
    let desiredImage = arguments[1]
    let imgPath = NSURL.fileURL(withPath: desiredImage)
    let workspace = NSWorkspace.shared()
    let screens = NSScreen.screens()
    let fileManager = FileManager.default
    
    
    if fileManager.fileExists(atPath: desiredImage) {
        print("Wallpaper found at \(desiredImage)")
    } else {
        print("")
        print("")
        print("Wallpaper NOT FOUND at \(desiredImage)")
        print("")
        usage()
        exit(0)
    }
    
    
    for screen in screens! {
        
        do{
            
            try workspace.setDesktopImageURL(imgPath, for: screen, options: [:])
            print("Setting wallpaper on screen \(screen)")
            print("")
        }
        catch {
            print(error)
        }
        
    }

    exit(0)
}

func runtime(){
    


    if arguments.contains("-help") || arguments.contains("-h") {
        usage()
        exit(0)
    }
        
    else if arguments.count == 2 {
        
        setWallpaper()
        
    }
        
    else if arguments.count == 0 {
        usage()
        exit(0)
    }
        
    else if arguments.count == 1 {
        usage()
        exit(0)
    }
        
    else if arguments.count > 1 {
        usage()
        exit(0)
    }
    

}

runtime()
