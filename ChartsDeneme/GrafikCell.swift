//
//  GrafikCell.swift
//  ChartsDeneme
//
//  Created by Atalay Aşa on 14/12/2017.
//  Copyright © 2017 Atalay Asa. All rights reserved.
//

import UIKit
import Charts
class GrafikCell: UITableViewCell {

    @IBOutlet weak var barChartView: BarChartView!
    @IBOutlet weak var lineChartView: LineChartView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    

}
