//
//  AnyKeywordRecord.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/23/16.
//
//

import Foundation

/// Represents any type of record value convertable.
struct AnyRecordValueConvertable: RecordValueConvertable {
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    private let _seralize: (Bool) throws -> String
    
    //----------------------------
    // MARK: - Record Value Convertable
    //----------------------------
    
    func serialize(fixedFormat: Bool) throws -> String {
        return try _seralize(fixedFormat)
    }
    
    static func deserialize(string: String) throws -> AnyRecordValueConvertable {
        return AnyRecordValueConvertable(record: NSNull())
    }
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    init<Value: RecordValueConvertable>(record: Value) {
        self._seralize = record.serialize
    }
    
}
