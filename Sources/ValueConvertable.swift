//
//  RecordValueConvertable.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/19/16.
//
//

import Foundation

//----------------------------
// MARK: - Base
//----------------------------

/// The protocol that record values must conform to.
public protocol RecordValueConvertable {
    
    /**
     Serializes the value into a string format so the record can be written to disk.
     - returns: A string representation of the value.
     - throws: A serialization error if the value was unable to be serialized.
     - note: The value must convert to one of the supported FITS keyword record value types.
     */
    func serialize(fixedFormat: Bool) throws -> String
    
    /**
     Deserializes the given string into a value.
     - parameter string: The string to deserialize.
     - returns: A instance of `self` with the information contained in the given string.
     */
    func deserialize(string: String) throws -> RecordValueConvertable
}

//----------------------------
// MARK: - Errors
//----------------------------

public enum RecordSerializationError: Error {
    
}

public enum RecordDeserializationError: Error, CustomStringConvertible {
    case invalidCharactersFound
    
    public var description: String {
        switch self {
        case .invalidCharactersFound:
            return "Characters unsupported by the value type were found in the keyword record's data."
        }
    }
    
}

//----------------------------
// MARK: - Standard Type Extensions.
//----------------------------

extension NSNull: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        guard string.trimmingCharacters(in: CharacterSet.whitespaces).characters.count == 0 else {
            throw RecordDeserializationError.invalidCharactersFound
        }
        return NSNull()
    }
    
}

extension Bool: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return false
    }
    
}

extension Int8: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return Int8()
    }
    
}

extension Int16: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return Int16()
    }
    
}

extension Int32: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return Int32()
    }
    
}

extension Int64: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return Int64()
    }
    
}

extension Float: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return Float()
    }
    
}

extension Double: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return Double()
    }
    
}

extension ComplexInt: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return ComplexInt(realPart: 0, imaginaryPart: 0)
    }
    
}

extension ComplexFloatingPoint: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return ComplexFloatingPoint(realPart: 0.0, imaginaryPart: 0.0)
    }
    
}

extension String: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return ""
    }
    
}

extension Date: RecordValueConvertable {
    
    public func serialize(fixedFormat: Bool) throws -> String {
        return ""
    }
    
    public func deserialize(string: String) throws -> RecordValueConvertable {
        return Date()
    }
    
}
