//
//  Record.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/23/16.
//
//

import Foundation

/// A record of data that contains a value, and optionally units or comments.
public struct Record<Value: RecordValueConvertable> {
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The value of the record.
    public var value: Value
    
    /// The unit of the value if applicable.
    public var unit: Unit?
    
    /// The record's comments/description.
    /// - Note: This does not include the units specification string if it was included in the comment string.
    public var comments: String?
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    /**
     Creates a new record.
     - parameter value: The value of the record.
     - parameter unit: The unit of the value if applicable.
     - parameter comments: The record's comments/description.
    */
    init(value: Value, ofUnit unit: Unit? = nil, withComments comments: String? = nil) {
        self.value = value
        self.unit = unit
        self.comments = comments
    }
    
}
