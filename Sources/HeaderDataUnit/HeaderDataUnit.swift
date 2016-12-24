//
//  HeaderDataUnit.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/18/16.
//
//

import Foundation

public class HeaderDataUnit {
    
    //----------------------------
    // MARK: - Constants
    //----------------------------
    
    
    //----------------------------
    // MARK: - Mandatory Properties
    //----------------------------

    /// Whether or not the HDU is the primary header data unit. (Corresponds to the "SIMPLE" keyword record for the primary header data unit.)
    internal var isPrimaryHeader: Bool = false
    
    //----------------------------
    // MARK: - General Properties
    //----------------------------
    
    /// The date the header data unit was created. (Corresponds to the "DATE" keyword record.)
    public var creationData: Date? = nil
    
    /// The organization or institution responsible for creating the FITS file. (Corresponds to the "ORIGIN" keyword record.)
    public var creationOrganization: String? = nil
    
    //----------------------------
    // MARK: - Observational Properties
    //----------------------------
    
    /// The organization or institution responsible for creating the FITS file. (Corresponds to the "DATE-OBS" keyword record.)
    public var observationDate: Date? = nil
    
    /// The telescope used to collect the data. (Corresponds to the "TELESCOP" keyword record.)
    public var telescope: String? = nil
    
    /// The instrument used to collect the data. (Corresponds to the "INSTRUME" keyword record.)
    public var instrument: String? = nil
    
    /// The person who collected the data. (Corresponds to the "OBSERVER" keyword record.)
    public var observer: String? = nil
    
    /// The object that was observed. (Corresponds to the "OBJECT" keyword record.)
    public var object: String? = nil
    
    /// The person who compiled the information in this header data unit. This property is appropriate when the data originate in a published paper or are compiled from many sources. (Corresponds to the "AUTHOR" keyword record.)
    public var author: String? = nil
    
    /// The reference to where the data contained in the header data unit is published.
    /// - note: It is recommended that either the 19-digit bibliographic identifier9 used in the Astrophysics Data System bibliographic databases (http://adswww.harvard.edu/) or the Digital Object Identifier (http://doi.org) be included in the value string when available (e.g., ’1994A&AS..103..135A’ or ’doi:10.1006/jmbi.1998.2354’).
    public var reference: String? = nil
    
    //----------------------------
    // MARK: - Commentary Properties
    //----------------------------
    
    /// Comments on the header data unit and the FITS file.
    var comments: String? = nil
    
    /// The history of the associated data. It should be used to describe the history of steps and procedures associated with the processing of the associated data.
    var history: String? = nil
    
    //----------------------------
    // MARK: - User Defined Properties
    //----------------------------
    
    /// The user-defined keyword records not covered by the built in properties of the header data unit.
    public var keywordRecords: [KeywordRecord] = Array<KeywordRecord<AnyRecordValueConvertable>>()
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    
    
}
