//
//  Timetable.swift
//  
//
//  Created by Tom Knighton on 16/10/2022.
//

import Foundation

/// A timetable, consiting of various schedules, for a specific line at a stop point, in a direction
public struct StopPointTimetable: Codable {

    /// The id of the line this timetable is for, i.e 'jubilee
    public let lineId: String
    
    /// The naptan id of the stop point (not the hub id)
    public let stopPointId: String
    
    /// The direction, inbound or outbound, of the timetable
    public let direction: String
    
    /// The various schedules for this timetable
    public let schedules: [TimetableSchedule]
    
    public init(lineId: String, stopPointId: String, direction: String, schedules: [TimetableSchedule]) {
        self.lineId = lineId
        self.stopPointId = stopPointId
        self.direction = direction
        self.schedules = schedules
    }
}

/// A schedule for a timetable
/// I.e. Monday-Friday, or a specific one for bank holidays
public struct TimetableSchedule: Codable {
    
    /// A friendly name for the schedule, i.e. 'Monday-Friday'
    public let name: String
    
    /// An array of friendly destination strings
    public let towards: [String]
    
    /// An array of entries/arrivals for this schedule
    public let entries: [TimetableEntry]
    
    public init(name: String, towards: [String], entries: [TimetableEntry]) {
        self.name = name
        self.towards = towards
        self.entries = entries
    }
}

/// An entry in a schedule, consisting of the date it will arrive and its destination
public struct TimetableEntry: Codable {
    
    /// The destination of this entry, will be from the parent's [towards] array
    public let terminatingAt: String
    
    /// The id of the entry, unique only to the schedule
    public let id: Int
    
    /// The time of the arrival, the date part of the object will be the date the timetable was generated, and can be ignored
    public let time: Date
    
    public init(terminatingAt: String, id: Int, time: Date) {
        self.terminatingAt = terminatingAt
        self.id = id
        self.time = time
    }
}
