//
//  Complex.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/19/16.
//
//

import Foundation

//----------------------------
// MARK: - Base
//----------------------------

/// The protocol for complex numbers.
public protocol Complex {
    associatedtype Value
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The real part of the complex number.
    var real: Value { get set }
    /// The imaginary part of the complex number.
    var imaginary: Value { get set }
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    init(real: Value, imaginary: Value)
}

//----------------------------
// MARK: - Integers
//----------------------------

public struct ComplexInt<Value: Integer> {
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The real part of the complex number.
    public var real: Value
    /// The imaginary part of the complex number.
    public var imaginary: Value
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    init(realPart: Value, imaginaryPart: Value) {
        self.real = realPart
        self.imaginary = imaginaryPart
    }
    
}

//----------------------------
// MARK: - Floating Point
//----------------------------

public struct ComplexFloatingPoint<Value: BinaryFloatingPoint> {
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The real part of the complex number.
    public var real: Value
    /// The imaginary part of the complex number.
    public var imaginary: Value
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    init(realPart: Value, imaginaryPart: Value) {
        self.real = realPart
        self.imaginary = imaginaryPart
    }
    
}
