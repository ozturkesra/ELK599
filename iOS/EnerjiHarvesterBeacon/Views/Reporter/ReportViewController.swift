//
//  ReportViewController.swift
//  EnerjiHarvesterBeacon
//
//  Created by Esra ÖZTÜRK on 25.01.2021.
//

import UIKit
import Charts
import Alamofire

class ReportViewController: UIViewController, ChartViewDelegate, IAxisValueFormatter {

    @IBOutlet weak var lineChartView: LineChartView!
    
    var selectedSinleDate: Date = Date()
    var selectedMultipleDates: [Date] = [Date]()
    
    var yLineValues : [ChartDataEntry] = []
    
    var lineDataEntries: LineChartDataSet = LineChartDataSet()
    
    var records : [Record] = [Record]()
    var beaconMessages: [BeaconDecodable] = [BeaconDecodable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupLineChartView()
        DialogUtil.showLoading()
        RESTService.shared.getLastRecords { (response) in
            DialogUtil.hideLoading()
            switch response {
                case .success(let record):
                    self.records = record.data!
                    for messages in record.data! {
                        self.beaconMessages.append(messages.mqttMessage!)
                    }
                    
                    DispatchQueue.main.async { [self] in
                        setDataEntries()
                    }
                    
                break
                case .failure(let error):
                    
                break
            }
        }
    }
    
    func setupLineChartView() {
        lineChartView.chartDescription?.enabled = false
        lineChartView.noDataText = "no_record".localized()
                
        lineChartView.leftAxis.axisMinimum = 0.0
        lineChartView.leftAxis.axisMaximum = 5.0
        lineChartView.rightAxis.enabled = false
        
        lineChartView.xAxis.valueFormatter = self
        
        lineChartView.delegate = self
    }
    
    func setDataEntries() {
        yLineValues.removeAll()
        self.lineDataEntries.removeAll()
        
        for i in 0..<beaconMessages.count {
            if(beaconMessages[i].distance != nil ) {
                let dataEntry = ChartDataEntry(x: Double(i), y: Double(beaconMessages[i].distance!)!)
                    
                    yLineValues.append(dataEntry)
            }
        }
        
        if(yLineValues.count > 0) {
            lineDataEntries = LineChartDataSet(entries: yLineValues, label: "meter")
            lineDataEntries.circleColors = [UIColor(rgb: 0x039be5)]
            
            lineDataEntries.circleHoleRadius = 1
            lineDataEntries.circleRadius = 3
            self.lineChartView.data = LineChartData(dataSet: lineDataEntries)
        } else {
            self.lineChartView.data = nil
        }
        
        lineChartView.notifyDataSetChanged()
    }
    
    func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        return DateTimeUtil.shared.changeFormat(baseFormat: DateTimeUtil.ISO_DATE_FORMAT, resultFormat: DateTimeUtil.TIME, date: records[Int(value)].createdDateTime! )
    }
}
