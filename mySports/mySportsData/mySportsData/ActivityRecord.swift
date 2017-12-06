//
//  ActivityRecord.swift
//  mySportsData
//
//  Created by ALOC SP05816 on 06/12/2017.
//  Copyright © 2017 Philipe Alves de Oliveira e SIlva. All rights reserved.
//

import Foundation

public class ActivityRecord {
    public var distance: String
    public var duration: String
    public var date: String
    
    init(distance: String, duration: String, date: String) {
        self.distance = distance
        self.duration = duration
        self.date = date
    }
    
}
