//
//  Double.swift
//  SwiftfulCrypto
//
//  Created by KANISHK VIJAYWARGIYA on 24/03/22.
//

import Foundation

extension Double {
    /// Converts a Double into a Currency with 2 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// ```
    private var currencyFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true // customizing formatter
        formatter.numberStyle = .currency
        //formatter.locale = .current //<- default value
        //formatter.currencyCode = "usd" //<- change currency
        //formatter.currencySymbol = "$" //<- change currency symbol
        formatter.minimumFractionDigits = 2 //<- how many decimal places we allow
        formatter.maximumFractionDigits = 2 //<- how many decimal places we allow
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    
    /// Converts a Double into a Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $1,234.56
    /// Convert 12.3456 to $12.3456
    /// Convert 0.123456 to $0.123456
    /// ```
    private var currencyFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true // customizing formatter
        formatter.numberStyle = .currency
        //formatter.locale = .current //<- default value
        //formatter.currencyCode = "usd" //<- change currency
        //formatter.currencySymbol = "$" //<- change currency symbol
        formatter.minimumFractionDigits = 2 //<- how many decimal places we allow
        formatter.maximumFractionDigits = 6 //<- how many decimal places we allow
        return formatter
    }
    
    /// Converts a Double into a Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to "$1,234.56"
    /// Convert 12.3456 to "$12.3456"
    /// Convert 0.123456 to "$0.123456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currencyFormatter6.string(from: number) ?? "$0.00"
    }
    
    /// Converts a Double into a String representation
    /// ```
    /// Convert 1.23456 to "$1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    /// Converts a Double into a String representation with percent symbol
    /// ```
    /// Convert 1.23456 to "$1.23%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}
