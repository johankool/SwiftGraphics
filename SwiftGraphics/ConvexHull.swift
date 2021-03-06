//
//  ConvexHull.swift
//  SwiftGraphics
//
//  Created by Jonathan Wight on 1/10/15.
//  Copyright (c) 2015 schwa.io. All rights reserved.
//

import Foundation

public func convexHull(var points:[CGPoint]) -> [CGPoint] {
    return monotoneChain(points)
}
