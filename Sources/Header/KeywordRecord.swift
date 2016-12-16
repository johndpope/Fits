//
//  KeywordRecord.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/13/16.
//
//

import Foundation

//----------------------------
// MARK: - Base
//----------------------------

/**
 An 80-character record in a header block consisting of a keyword name in the first eight characters followed by an optional value indicator, value and comment string. The keyword record shall be composed only of the restricted set of ASCII text characters ranging from decimal 32 to 126 (hexadecimal 20 to 7E).
*/
public struct KeywordRecord {
    
    //----------------------------
    // MARK: - Constants
    //----------------------------
    
    /// The possible values for a `KeywordRecord`.
    public enum Value {
        /// No value.
        case null
        /// A boolean.
        case boolean(Bool)
        /// An integer number.
        case integer(Int64)
        /// A floating point number.
        case decimal(Double)
        /// A complex integer containing a real and imaginary part.
        case complexInteger(Int, Int)
        /// A complex floating point number containing a real and imaginary part.
        case complexDecimal(Double, Double)
        /// A string.
        case string(String)
        /// A date.
        case date(Date)
    }
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The keyword identifying the record.
    var keyword: String
    
    /// The value of the record.
    var value: Value
    
    /// The unit of the value if applicable.
    var units: Unit?
    
    /// The record's comments/description.
    /// - Note: This does not include the units specification string if it was included in the comment string.
    var comments: String?
}

//----------------------------
// MARK: - Validation
//----------------------------

extension KeywordRecord {
    
    //----------------------------
    // MARK: - Constants
    //----------------------------
    
    public enum ValidationError: ErrorType, CustomStringConvertable {
        case keywordContainsInvalidCharacters
        case keywordExceedsMaximumLength
        
        var description: String {
            switch self {
            case .keywordExceedsMaximumLength:
                return "The keyword has a maximum length of eight characters."
            case .keywordContainsInvalidCharacters:
                return "The keyword may only contain the digits 0-9, the uppercase letters A-Z, the underscore (_), and the hyphen (-)."
            }
        }
    }
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The set of characters allowed in the keyword.
    private static var validKeywordCharacters: String = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_-"
    
    /// The set of characters allowed in strings.
    private static var validStringCharacters: String = " !\"#$%&"
    
    /// The value indicator.
    private static var valueIndicator: String = "= "
    
    /// The comment indicator.
    private static var commentIndicator: String = " /"
    
    //----------------------------
    // MARK: - Methods
    //----------------------------
    
    /**
     Validates whether or not the `KeywordRecord` follows the FITS specification.
     - parameter fixedFormat: If `true` the `KeywordRecord` will be validated against the fixed format specification. Defaults to `false`
     - returns: `true` if the header conforms to the FITS specification. `false` otherwise.
    */
    func validate(fixedFormat: Bool = false) -> ValidationError? {
        
        guard keyword.characters.count <= 8 else {
            return .keywordExceedsMaximumLength
        }
        
        return nil
    }
}
