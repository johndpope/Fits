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
public struct KeywordRecord<Value: RecordValueConvertable> {
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The keyword identifying the record.
    public var keyword: String
    
    /// The record that contains the value associated with the keyword.
    public var record: Record<Value>
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    /**
     Initalize the keyword record.
     - parameter keyword: The keyword identifying the record.
     - parameter record: The record associated with the keyword.
     - returns: A new keyword record.
    */
    public init(keyword: String, record: Record<Value>) {
        self.keyword = keyword
        self.record = record
    }
}

//----------------------------
// MARK: - Validation Constants
//----------------------------

public enum ValidationError: Error, CustomStringConvertible {
    case keywordContainsInvalidCharacters
    case keywordExceedsMaximumLength
    case valueExceedsMaximumLength
    case commentExceedsMaximumLength
    case keywordRecordExceedsEightyCharacters
    
    public var description: String {
        switch self {
        case .keywordExceedsMaximumLength:
            return "The keyword has a maximum length of eight characters."
        case .keywordContainsInvalidCharacters:
            return "The keyword may only contain the digits 0-9, the uppercase letters A-Z, the underscore (_), and the hyphen (-)."
        case .valueExceedsMaximumLength:
            return "The value's text representation is too large to be stored in a keyword record."
        case .commentExceedsMaximumLength:
            return "The comment is too large to be stored in a keyword record."
        case .keywordRecordExceedsEightyCharacters:
            return "The generated keyword record contains more than the maximum of eighty characters. There is an error in the validation code if this error is produced."
        }
    }
}

/// The set of characters allowed in the keyword.
fileprivate let invalidKeywordCharacters: CharacterSet = CharacterSet(charactersIn: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_-").inverted

/// The set of characters allowed in strings.
fileprivate let invalidStringCharacters: CharacterSet = CharacterSet(charactersIn: " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~").inverted

/// The value indicator.
fileprivate var valueIndicator: String = "= "

/// The comment indicator.
fileprivate var commentIndicator: String = " /"

//----------------------------
// MARK: - Validation
//----------------------------

extension KeywordRecord {
    
    /**
     Validates whether or not the `KeywordRecord` follows the FITS specification.
     - parameter fixedFormat: If `true` the `KeywordRecord` will be validated against the fixed format specification. Defaults to `false`
     - returns: `true` if the header conforms to the FITS specification. `false` otherwise.
    */
    public func validate(fixedFormat: Bool = false) -> ValidationError? {
        
        // Validate the keyword.
        guard keyword.characters.count <= 8 else {
            return .keywordExceedsMaximumLength
        }
        guard keyword.rangeOfCharacter(from: invalidKeywordCharacters) != nil else {
            return .keywordContainsInvalidCharacters
        }
        
        return nil
    }
    
}
