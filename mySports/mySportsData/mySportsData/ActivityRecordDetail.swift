//
//  ActivityRecordDetail.swift
//  mySportsData
//
//  Created by ALOC SP05816 on 06/12/2017.
//  Copyright © 2017 Philipe Alves de Oliveira e SIlva. All rights reserved.
//

import Foundation

public class ActivityRecordDetail : ActivityRecord {
    
    public var calories: Double
    
    init(distance: String, duration: String, date: String, calories: Double) {
        self.calories = calories
        super.init(distance: distance, duration: duration, date: date)
    }
    
}
