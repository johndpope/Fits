//
//  Fits.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/18/16.
//
//

import Foundation

//----------------------------
// MARK: - Base
//----------------------------

/// An object representation of a FITS file, allowing for simple reading and manipulation of a file's data.
public class Fits {
    
    //----------------------------
    // MARK: - Constants
    //----------------------------
    
    
    //----------------------------
    // MARK: - Properties
    //----------------------------
    
    /// The array of header data units contained in the FITS file.
    public var headerDataUnits: [HeaderDataUnit] = []
    
    //----------------------------
    // MARK: - Initalization
    //----------------------------
    
    /// Initalize an empty `Fits` object with no data.
    public init() { }
    
    /**
     Initalize a `Fits` object with the data from the location specified by `url`.
     - parameter url: The `URL` to read.
     - parameter options: Options for the read operation. Default value is `[]`.
     - throws: An error in the Cocoa domain, if `url` cannot be read.
     */
    public convenience init?(contentsOf url: URL, options dataReadingOptions: Data.ReadingOptions) throws {
        let data = try Data(contentsOf: url, options: dataReadingOptions)
        try self.init(data: data)
    }
    
    /**
     Initalizes a `Fits` object initalized by reading the given data.
     - parameter data: The data to read into the `FITS` file.
     - returns: A `Fits` object initialized by reading the given data into it.
     - throws: -
    */
    public init?(data: Data) throws {
        try deserialize(data: data)
    }
    
    //----------------------------
    // MARK: - Saving
    //----------------------------
    
    /**
     Serializes the `Fits` object into data and returns the data.
     - returns: The serialized data of the fits file.
     - throws: -
    */
    public func dataRepresentation() throws -> Data {
        return try serialize()
    }
    
    /**
     Writes the bytes of the`Fits` object to the location specified by `url`.
     - parameter url: The location to which to write the receiver's bytes. Only `file://` URLs are supported.
     - parameter options: Options for writing the data. Default value is `[]`.
     - returns: `true` if the operation succeeds, otherwise `false`.
     - throws: An error in the Cocoa domain, if there is an error writing to the `URL`.
    */
    func write(to url: URL, options dataWritingOptions: Data.WritingOptions = []) throws {
        return try self.dataRepresentation().write(to: url, options: dataWritingOptions)
    }
    
}

//----------------------------
// MARK: - Serialization
//----------------------------

extension Fits {
    
    fileprivate func deserialize(data: Data) throws {
        
        let totalBytes = data.count
        
        
    }
    
    fileprivate func deserialize(headerWithData data: Data) {
        
    }
    
    
    
    fileprivate func serialize() throws -> Data {
        return Data()
    }
    
}
