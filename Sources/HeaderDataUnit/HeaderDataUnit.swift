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
    public var creationData: Date?
    
    /// The organization or institution responsible for creating the FITS file. (Corresponds to the "ORIGIN" keyword record.)
    public var creationOrganization: String?
    
    //----------------------------
    // MARK: - Observational Properties
    //----------------------------
    
    /// The organization or institution responsible for creating the FITS file. (Corresponds to the "DATE-OBS" keyword record.)
    public var observationDate: Date?
    
    
    
    
    /// The user-defined keyword records not covered by the built in properties of the header data unit.
    public var keywordRecords: [KeywordRecord] = []
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    
    
}
