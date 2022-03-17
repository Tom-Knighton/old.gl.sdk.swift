//
//  GLSDK.swift
//  
//
//  Created by Tom Knighton on 15/03/2022.
//

import Foundation

public struct GLSDK {
    
    /// Information and methods for Lines from TfL
    /// Contains information like all lines operating under line modes, disruptions for line modes etc.
    public struct Lines {}
    
    /// Get all possible journeys from and to specified points
    public struct Journey {}
    
    /// Information and methods relating to StopPoints from TfL
    /// Can get StopPoint information and arrivals at StopPoints
    public struct StopPoints {}
    
    /// Meta information about TfL services
    /// I.e. lineIds, LineModes, DelayTypes
    public struct Meta {}
    
    /// Search for StopPoints and POIPoints based on name or around a specified area
    public struct Search {}
    
    /// Get upcomings stops a specified vehicle is going to make
    public struct Vehicles {}
}
