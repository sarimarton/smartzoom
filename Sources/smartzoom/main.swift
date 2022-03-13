//
//  main.swift
//  smartzoom
//
//  Created by Márton Sári on 2022. 03. 13..
//

// Posts a Smart Zoom event on macOS.
// For the implementation source, see postSmartZoomEvent at
// https://github.com/noah-nuebling/mac-mouse-fix/blob/master/Helper/InputTransformation/Touch/TouchSimulator.m#L63

// Obj-C source:
//#import <Foundation/Foundation.h>
//
//int main (int argc, const char * argv[]) {
//    CGEventRef e = CGEventCreate(NULL);
//    CGEventSetIntegerValueField(e, 55, 29); // NSEventTypeGesture
//    CGEventSetIntegerValueField(e, 110, 22); // kIOHIDEventTypeZoomToggle
//    CGEventPost(kCGHIDEventTap, e);
//    CFRelease(e);
//}


import Foundation

let e = CGEvent(source: nil);
e?.setIntegerValueField(CGEventField(rawValue: 55 as UInt32)!, value: 29); // NSEventTypeGesture
e?.setIntegerValueField(CGEventField(rawValue: 110 as UInt32)!, value: 22); // kIOHIDEventTypeZoomToggle
e?.post(tap: CGEventTapLocation(rawValue: 0 as UInt32)!);

