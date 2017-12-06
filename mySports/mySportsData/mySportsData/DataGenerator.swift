//
//  DataGenerator.swift
//  mySportsData
//
//  Created by ALOC SP05816 on 06/12/2017.
//  Copyright © 2017 Philipe Alves de Oliveira e SIlva. All rights reserved.
//

import Foundation

public func generateActivityRecord(withMaxSections sections: Int, andMaxRows rows: Int) -> [Int:[ActivityRecord]] {
    var activityRecords = [Int:[ActivityRecord]]()
    
    for i in 0..<sections {
        var records = [ActivityRecord]()
        for _ in 0..<rows {
            let record = ActivityRecord(distance: "1.94", duration: "00:19:34", date: "Tue, 11/24/2017")
            records.append(record)
        }
        activityRecords[i] = records
    }
    return activityRecords
}

public func generateActivityRecord(withActivities activities: [Int:[ActivityRecord]]) -> [Int:[ActivityRecordDetail]] {
    var activityRecordDetail = [Int:[ActivityRecordDetail]]()
    
    for i in 0..<activities.count {
        var details = [ActivityRecordDetail]()
        for j in 0..<activities[i]!.count {
            let detail = ActivityRecordDetail(distance: activities[i]![j].distance, duration: activities[i]![j].duration, date: activities[i]![j].date, calories: 100.0)
            details.append(detail)
        }
        activityRecordDetail[i] = details
    }
    return activityRecordDetail
}
