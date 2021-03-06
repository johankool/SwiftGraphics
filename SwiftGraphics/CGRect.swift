//
//  CGRect.swift
//  SwiftGraphics
//
//  Created by Jonathan Wight on 8/24/14.
//  Copyright (c) 2014 schwa.io. All rights reserved.
//

import CoreGraphics

// MARK: CGRect

public extension CGRect {
    init(size:CGSize) {
        self.origin = CGPointZero
        self.size = size
    }
    
    init(width:CGFloat, height:CGFloat) {
        self.origin = CGPointZero
        self.size = CGSize(width:width, height:height)
    }

    init(w width:CGFloat, h height:CGFloat) {
        self.origin = CGPointZero
        self.size = CGSize(width:width, height:height)
    }

    init(P1:CGPoint, P2:CGPoint) {
        self.origin = CGPoint(x:min(P1.x, P2.x), y:min(P1.y, P2.y))
        self.size = CGSize(width:abs(P2.x - P1.x), height:abs(P2.y - P1.y))
    }

    init(center:CGPoint, size:CGSize) {
        self.origin = CGPoint(x:center.x - size.width * 0.5, y:center.y - size.height * 0.5)
        self.size = size
    }

    init(center:CGPoint, radius:CGFloat) {
        self.origin = CGPoint(x:center.x - radius, y:center.y - radius)
        self.size = CGSize(width:radius * 2, height:radius * 2)
    }

    init(center:CGPoint, diameter:CGFloat) {
        self.origin = CGPoint(x:center.x - diameter * 0.5, y:center.y - diameter * 0.5)
        self.size = CGSize(width:diameter, height:diameter)
    }

    init(minX:CGFloat, minY:CGFloat, maxX:CGFloat, maxY:CGFloat) {
        self = CGRect(P1:CGPoint(x:minX, y:minY), P2:CGPoint(x:maxX, y:maxY))
    }
}

public func * (lhs:CGRect, rhs:CGFloat) -> CGRect {
    return CGRect(origin:lhs.origin * rhs, size:lhs.size * rhs)
}

public func * (lhs:CGFloat, rhs:CGRect) -> CGRect {
    return CGRect(origin:lhs * rhs.origin, size:lhs * rhs.size)
}

// MARK: Misc. CGRect utilities.

public extension CGRect {

    func insetted(# dx:CGFloat, dy:CGFloat) -> CGRect {
        var copy = self
        copy.inset(dx:dx, dy:dy)
        return copy
        }


    var isFinite : Bool { get { return CGRectIsNull(self) == false && CGRectIsInfinite(self) == false } }
    var mid : CGPoint { get { return CGPoint(x:self.midX, y:self.midY) } }
    
    static func unionOfRects(rects:[CGRect]) -> CGRect {
        var result = rects[0]
        for rect in rects[1..<rects.count] {
            result = CGRectUnion(result, rect)
        }
        return result
    }

    var asTuple : (CGFloat, CGFloat, CGFloat, CGFloat) { get { return (origin.x, origin.y, size.width, size.height) } }

    func integral() -> CGRect {
        return CGRectIntegral(self)
    }

    func partiallyIntersects(other:CGRect) -> Bool {
        if CGRectIntersectsRect(self, other) == true {
            let union = CGRectUnion(self, other)
            if CGRectEqualToRect(self, union) == false {
                return true
            }
        }
        return false
    }

}


