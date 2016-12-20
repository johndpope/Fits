//
//  KeywordRecordConstants.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/19/16.
//
//

import Foundation

//----------------------------
// MARK: - Defined Keywords
//----------------------------

extension KeywordRecord {
    
    /// The value field shall contain a logical constant with the value `true` if the file conforms to this standard. This keyword is mandatory for the primary header and must not appear in extension headers. A value of `false` signifies that the file does not conform to this standard.
    static let simple: String = "SIMPLE"
    
    /// The value field shall specify the number of bits that represent a data value in the associated data array. Writers of FITS arrays should select a BITPIX data type appropriate to the form, range of values, and accuracy of the data in the array.
    static let bitpix: String = "BITPIX"
}

//----------------------------
// MARK: - Constants
//----------------------------

public enum BitPix: Int {
    /// 8-bit unsigned integers.
    case unsignedByte = 8
    /// 16-bit signed integers.
    case signedShort = 16
    /// 32-bit signed integers.
    case signedLong = 32
    /// 64-bit signed integers.
    case signedLongLong = 64
    /// 32-bit single precision floating point.
    case float = -32
    /// 64-bit double precision floating point.
    case double = -64
}
