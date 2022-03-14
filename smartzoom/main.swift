//
//  main.swift
//  smartzoom
//
//  Created by Márton Sári on 2022. 03. 13..
//

// Posts a Smart Zoom event on macOS.
// Transcoded to Swift from
// https://github.com/noah-nuebling/mac-mouse-fix/blob/master/Helper/InputTransformation/Touch/TouchSimulator.m#L63

import Foundation
import Cocoa

func checkAccessibility() -> Bool {
    let checkOptPrompt = kAXTrustedCheckOptionPrompt.takeUnretainedValue() as NSString
    let accessEnabled = AXIsProcessTrustedWithOptions([checkOptPrompt: true] as CFDictionary?)
    return accessEnabled
}

func smartZoom() {
    let event = CGEvent(source: nil);
    event?.setIntegerValueField(CGEventField(rawValue: 55)!, value: 29); // NSEventTypeGesture
    event?.setIntegerValueField(CGEventField(rawValue: 110)!, value: 22); // kIOHIDEventTypeZoomToggle
    event?.post(tap: CGEventTapLocation(rawValue: 0)!);
}

func doMagnify(phase: Int64, magnification: Double) {
    let event = CGEvent(source: nil);
    event?.type = CGEventType(rawValue: 29)!; // 29 -> NSEventTypeGesture
    event?.setIntegerValueField(CGEventField(rawValue: 110)!, value: 8); // 8 -> kIOHIDEventTypeZoom
    event?.setIntegerValueField(CGEventField(rawValue: 132)!, value: phase);
    event?.setDoubleValueField(CGEventField(rawValue: 113)!, value: magnification)
    event?.post(tap: CGEventTapLocation(rawValue: 0)!);
}

if !checkAccessibility() {
    print("Accessibility access has not been granted. Please enable it in System Preferences -> Security & Privacy -> Accessibility.")
}

func magnify() {
    // I don't know why, but it only works if this is doubled
    doMagnify(phase: 1, magnification: 0)
    doMagnify(phase: 1, magnification: 0)
    
    for _ in 1...15 {
        doMagnify(phase: 2, magnification: 0.02)
        usleep(16666)
    }
    
    doMagnify(phase: 4, magnification: 0)
}

func magnifyReset() {
    // I don't know why, but it only works if this is doubled
    doMagnify(phase: 1, magnification: 0)
    doMagnify(phase: 1, magnification: 0)
    
    for _ in 1...15 {
        doMagnify(phase: 2, magnification: -0.1)
        usleep(16666)
    }
    
    doMagnify(phase: 4, magnification: 0)
}


switch CommandLine.arguments[1] {
case "smart":
    smartZoom()
    
case "magnify":
    magnify()

case "magnify-reset":
    magnifyReset()

default:
    smartZoom()
}


