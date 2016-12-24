//
//  KeywordRecordValueConvertable.swift
//  Fits
//
//  Created by McQuilkin, Brandon on 12/23/16.
//
//

import Foundation

/// The prototype of the `BinaryTable` type and was primarily used in the AIPS data processing system developed at NRAO from about 1987 until it was replaced by `BinaryTable` in the early 1990s. It is very similar to the `BinaryTable` type except that it does not support the variable-length array convention. This class exists only to support FITS files created in that time. All new files should use `BinaryTable` instead.
class A3DTable: BinaryTable {
    
}
