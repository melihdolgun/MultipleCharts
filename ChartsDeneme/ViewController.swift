//
//  ViewController.swift
//  ChartsDeneme
//
//  Created by Atalay Aşa on 14/12/2017.
//  Copyright © 2017 Atalay Asa. All rights reserved.
//

import UIKit
import Charts
class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var isBarChart:Bool = false
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let unitsSold = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    let numbers : [Double] = [20.0, 4.0, 6.0, 3.0, 12.0, 16.0, 4.0, 18.0, 2.0, 4.0, 5.0, 4.0]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    //Creating a line chart
    func setLineChart(lineChart: LineChartView){
        var lineChartEntry  = [ChartDataEntry]() //this is the Array that will eventually be displayed on the graph.
        
        //here is the for loop
        for i in 0..<numbers.count {
            let value = ChartDataEntry(x: Double(i), y: numbers[i]) // here we set the X and Y status in a data chart entry
            lineChartEntry.append(value) // here we add it to the data set
        }
        
        let line1 = LineChartDataSet(values: lineChartEntry, label: "Number") //Here we convert lineChartEntry to a LineChartDataSet
        line1.colors = [NSUIColor.blue] //Sets the colour to blue
        
        let data = LineChartData() //This is the object that will be added to the chart
        data.addDataSet(line1) //Adds the line to the dataSet
        
        lineChart.data = data //finally - it adds the chart data to the chart and causes an update
        lineChart.chartDescription?.text = "My awesome chart" // Here we set the description for the graph
    }
    
    
    
    
    //Creating a Bar Chart
    func setBarChart(months: [String], unitsSold: [Double], barChart: BarChartView) {
        
        barChart.noDataText = "Lütfen Bekleyiniz ya da internet bağlantınızı kontrol ediniz"
        
        //For Animations
        barChart.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .easeInBounce)
        barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: months)   //Json tarih datalarının çekildiği yer
        barChart.xAxis.labelRotationAngle = 320.0
        barChart.xAxis.setLabelCount(months.count, force: false)
        barChart.xAxis.labelFont = UIFont.systemFont(ofSize: 10.0, weight: UIFontWeightMedium)

        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<unitsSold.count {
            
            let sayiGirisi = BarChartDataEntry(x: Double(i), yValues: [unitsSold[i]])
            dataEntries.append(sayiGirisi)
            
        }
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "Units Sold")
        let chartData = BarChartData(dataSet: chartDataSet)
        
        barChart.data = chartData
        
        //self.view.addSubview(barChart)
        
    }

}

extension ViewController:UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = myTableView.dequeueReusableCell(withIdentifier: "chart") as? GrafikCell
        
        if isBarChart {
            setBarChart(months: months, unitsSold: unitsSold, barChart: (cell?.barChartView)!)
        }
        else {
            setLineChart(lineChart: (cell?.lineChartView!)!)
        }
        
        return cell!
    }
    
}
