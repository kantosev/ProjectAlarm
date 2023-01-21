//
//  AddAlarmViewController.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 21.01.2023.
//

import UIKit

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private var alarmDate: DateComponents?
    var addAlarmCompletion: ((DateComponents) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alarmDate = dateToDateComponent(date: datePicker.date)
    }
    
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        guard let alarmDate = alarmDate else { return }
        addAlarmCompletion?(alarmDate)
        self.dismiss(animated: true)
    }
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        alarmDate = dateToDateComponent(date: sender.date)
        
        
    }
    private func dateToDateComponent(date: Date) -> DateComponents {
        let date = date.formatted(date: .omitted, time: .shortened)
//      преобразование Date в DateComponent
        let dateComponentArray = date.components(separatedBy: ":")
        guard let hour = Int(dateComponentArray[0]), let minute = Int(dateComponentArray[1]) else { return DateComponents() }
        let dateComponent = DateComponents(hour: hour, minute: minute)
        return dateComponent
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
