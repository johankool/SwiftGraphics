//
//  CGPoint.swift
//  SwiftGraphics
//
//  Created by Jonathan Wight on 8/24/14.
//  Copyright (c) 2014 schwa.io. All rights reserved.
//

import CoreGraphics

// MARK: CGPoint

extension CGPoint : Printable {
    public var description: String { get { return "\(x), \(y)" } }
}

// MARK: Init

public extension CGPoint {
    
    init(x:CGFloat) {
        self.x = x
        self.y = 0
    }

    init(y:CGFloat) {
        self.x = 0
        self.y = y
    }
}

// MARK: Arithmetic

public prefix func + (p:CGPoint) -> CGPoint {
    return p
}

public prefix func - (p:CGPoint) -> CGPoint {
    return CGPoint(x:-p.x, y:-p.y)
}

// MARK: Arithmetic

public func + (lhs:CGPoint, rhs:CGPoint) -> CGPoint {
    return CGPoint(x:lhs.x + rhs.x, y:lhs.y + rhs.y)
}

public func - (lhs:CGPoint, rhs:CGPoint) -> CGPoint {
    return CGPoint(x:lhs.x - rhs.x, y:lhs.y - rhs.y)
}

// MARK: Arithmetic (with scalar)

public func * (lhs:CGPoint, rhs:CGFloat) -> CGPoint {
    return CGPoint(x:lhs.x * rhs, y:lhs.y * rhs)
}

public func * (lhs:CGFloat, rhs:CGPoint) -> CGPoint {
    return CGPoint(x:lhs * rhs.x, y:lhs * rhs.y)
}

public func / (lhs:CGPoint, rhs:CGFloat) -> CGPoint {
    return CGPoint(x:lhs.x / rhs, y:lhs.y / rhs)
}

// MARK: Arithmetic Assignment 

public func += (inout lhs:CGPoint, rhs:CGPoint) {
    lhs = lhs + rhs
}

public func -= (inout lhs:CGPoint, rhs:CGPoint) {
    lhs = lhs - rhs
}

public func *= (inout lhs:CGPoint, rhs:CGFloat) {
    lhs = lhs * rhs
}

public func /= (inout lhs:CGPoint, rhs:CGFloat) {
    lhs = lhs / rhs
}

// MARK: Misc

public extension CGPoint {
    func clamped(rect:CGRect) -> CGPoint {
        return CGPoint(
            x:clamp(self.x, rect.minX, rect.maxX),
            y:clamp(self.y, rect.minY, rect.maxY)
        )
    }
}

// MARK: Trig

public extension CGPoint {
    init(magnitude:CGFloat, direction:CGFloat) {
        x = cos(direction) * magnitude
        y = sin(direction) * magnitude
    }

    var magnitude : CGFloat { get { return sqrt(x ** 2 + y ** 2) } }
    var normalized : CGPoint { get { return CGPoint(x:x / magnitude, y:y / magnitude) } }
}

public func atan2(point:CGPoint) -> CGFloat {
    return atan2(point.y, point.x)
}

public func dotProduct(a:CGPoint, b:CGPoint) -> CGFloat {
    return a.x * b.x + a.y * b.y
}

// MARK: Converting to/from tuples

public extension CGPoint {
    init(_ v:(CGFloat, CGFloat)) {
        (x, y) = v
    }
    var asTuple : (CGFloat, CGFloat) { get { return (x, y) } }
}

//    func cross(o:CGPoint, a:CGPoint, b:CGPoint) -> Bool {
////       let d = (a.x - o.x) * (b.y - o.y) - (a.y - o.y) * (b.x - o.x)
////       return d <= 0.0
//        return Turn(o,a,b) == .Left
//    }


public extension CGPoint {
    func map(transform: CGFloat -> CGFloat) -> CGPoint {
        return CGPoint(x:transform(x), y:transform(y))
    }
}

public func floor(value:CGPoint) -> CGPoint {
    return value.map { floor($0) }
}

public func ceil(value:CGPoint) -> CGPoint {
    return value.map { ceil($0) }
}

public func round(value:CGPoint) -> CGPoint {
    return value.map { round($0) }
}
