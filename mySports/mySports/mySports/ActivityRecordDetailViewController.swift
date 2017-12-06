//
//  ActivityRecordDetailViewController.swift
//  mySports
//
//  Created by ALOC SP05816 on 06/12/2017.
//  Copyright © 2017 Philipe Alves de Oliveira e SIlva. All rights reserved.
//

import UIKit
import mySportsData

class ActivityRecordDetailViewController: UIViewController {

    var activityRecord: ActivityRecordDetail?
    
    @IBOutlet weak var lblActivity: UILabel!
    
    @IBOutlet weak var lblDistance: UILabel!
    
    @IBOutlet weak var lblDuration: UILabel!
    
    @IBOutlet weak var lblCalories: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.lblDistance.text = self.activityRecord?.distance
        self.lblDuration.text = self.activityRecord?.duration
        self.lblCalories.text = String(describing: self.activityRecord!.calories)
    }

}
