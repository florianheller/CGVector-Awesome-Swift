//
//  CGVectorAwesomeTests.swift
//  CGVectorAwesomeTests
//
//  Created by Sam Green on 6/24/16.
//  Copyright © 2016 Sam Green. All rights reserved.
//

import XCTest
@testable import CGVectorAwesome

class CGVectorAwesomeTests: XCTestCase {
    func testInitFromCGPoint() {
        let point = CGPoint(x: 3, y: 5)
        
        let v1 = CGVector(point: point)
		XCTAssertEqual(v1.dx, 3, accuracy: 0.0001)
		XCTAssertEqual(v1.dy, 5, accuracy: 0.0001)
    }
    
    func testSum() {
        let v1 = CGVector(dx: 1, dy: 2)
        let v2 = CGVector(dx: 2, dy: 3)

        let result = v1.sum(v2)
		XCTAssertEqual(result.dx, 3, accuracy: 0.0001)
		XCTAssertEqual(result.dy, 5, accuracy: 0.0001)
    }
    
    func testDifference() {
        let v1 = CGVector(dx: 5, dy: 5)
        let v2 = CGVector(dx: 1, dy: 2)
        
        let result = v1.difference(v2)
		XCTAssertEqual(result.dx, 4, accuracy: 0.0001)
		XCTAssertEqual(result.dy, 3, accuracy: 0.0001)
    }
    
    func testMultiply() {
        let v1 = CGVector(dx: 1, dy: 2)
        let v2 = CGVector(dx: 2, dy: 3)
        
        let result = v1.multiply(v2)
		XCTAssertEqual(result.dx, 2, accuracy: 0.0001)
		XCTAssertEqual(result.dy, 6, accuracy: 0.0001)
    }
    
    func testMultiplyByScalar() {
        let v1 = CGVector(dx: 1, dy: 2)
        
        let result = v1.multiply(3)
		XCTAssertEqual(result.dx, 3, accuracy: 0.0001)
		XCTAssertEqual(result.dy, 6, accuracy: 0.0001)
    }
    
    func testMakePerpendicular() {
        let v1 = CGVector(dx: 0, dy: 1)
        
        let result = v1.makePerpendicular()
		XCTAssertEqual(result.dx, -1, accuracy: 0.0001)
		XCTAssertEqual(result.dy, 0, accuracy: 0.0001)
    }
    
    func testAngle() {
        let v1 = CGVector(dx: 1, dy: 1)
        let result = v1.angle()
		XCTAssertEqual(Double(result), .pi/4, accuracy: 0.0001)
    }
    
    func testAngleSpriteKit() {
        let v1 = CGVector(dx: 1, dy: 1)
        let result = v1.angleSpriteKit()
		XCTAssertEqual(Double(result), .pi/4, accuracy: 0.0001)
    }
    
    func testAngleToZero() {
        let v3 = CGVector(dx: 1, dy: 1)
        let v4 = CGVector(dx: 1, dy: 1)
        let result = v3.angleTo(v4)
		XCTAssertEqual(result, 0, accuracy: 0.0001)
    }
    
    func testAngleToEmpty() {
        let v3 = CGVector(dx: 0, dy: 0)
        let v4 = CGVector(dx: 0, dy: 0)
        let result = v3.angleTo(v4)
		XCTAssertEqual(result, 0, accuracy: 0.0001)
    }
    
    func testAngleToClampedMagnitude() {
        let v3 = CGVector(dx: 1, dy: 1)
        let v4 = CGVector(dx: 100, dy: 100)
        let result = v3.angleTo(v4)
		XCTAssertEqual(result, 0, accuracy: 0.0001)
    }
    
    func testAngleToClampedNegativeMagnitude() {
        let v3 = CGVector(dx: 1, dy: 1)
        let v4 = CGVector(dx: -100, dy: -100)
        
        let result = v3.angleTo(v4)
		XCTAssertEqual(Double(result), .pi, accuracy: 0.0001)
    }
    
    func testAngleToPerpendicular() {
        let v1 = CGVector(dx: 1, dy: 0)
        let v2 = CGVector(dx: 0, dy: 1)
        
        let result = v1.angleTo(v2)
		XCTAssertEqual(Double(result), .pi/2, accuracy: 0.0001)
    }
    
    func testAngleToAcute() {
        let v1 = CGVector(dx: 1, dy: 1)
        let v2 = CGVector(dx: 1, dy: 0)
        let result = v1.angleTo(v2)
		XCTAssertEqual(Double(result), .pi/4, accuracy: 0.0001)
    }
    
    func testDotProductPerpendicular() {
        let v1 = CGVector(dx: 0, dy: 1)
        let v2 = CGVector(dx: 1, dy: 0)
        
        let result = v1.dotProduct(v2)
		XCTAssertEqual(result, 0, accuracy: 0.0001)
    }
    
    func testDotProductAcute() {
        let v1 = CGVector(dx: 1, dy: 1)
        let v2 = CGVector(dx: 1, dy: 0)
        
        let result = v1.dotProduct(v2)
		XCTAssertEqual(result, 1, accuracy: 0.0001)
    }
    
    func testDotProductObtuse() {
        let v1 = CGVector(dx: 0, dy: -1)
        let v2 = CGVector(dx: 0, dy: 1)
        
        let result = v1.dotProduct(v2)
		XCTAssertEqual(result, -1, accuracy: 0.0001)
    }
    
    func testLength() {
        let v1 = CGVector(dx: 1, dy: 1)
        
        let result = v1.length()
		XCTAssertEqual(result, 1.4142, accuracy: 0.0001)
    }
    
    func testNormalize() {
        let v1 = CGVector(dx: 3, dy: 3)
        
        let result = v1.normalize()
		XCTAssertEqual(result.dx, 0.7071, accuracy: 0.0001)
		XCTAssertEqual(result.dy, 0.7071, accuracy: 0.0001)
    }
    
    func testNormalizeZero() {
        let v1 = CGVector(dx: 0, dy: 0)
        
        let result = v1.normalize()
		XCTAssertEqual(result.dx, 0, accuracy: 0.0001)
		XCTAssertEqual(result.dy, 0, accuracy: 0.0001)
    }
    
    func testDistance() {
        let v1 = CGVector(dx: 10, dy: 10)
        let v2 = CGVector(dx: 3, dy: 7)
        
        let result = v1.distance(v2)
		XCTAssertEqual(result, 7.6157, accuracy: 0.0001)
    }
    
    func testPerpendicularEquality() {
        let v1 = CGVector(dx: 0, dy: 1)
        let v2 = CGVector(dx: 1, dy: 0)
        XCTAssert(v1.isPerpendicularTo(v2))
    }
}
