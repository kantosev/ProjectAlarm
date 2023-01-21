//
//  AddAlarmViewController.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 21.01.2023.
//

import UIKit

class AddAlarmViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    @IBAction func addButtonAction(_ sender: UIBarButtonItem) {
        
    }
    @IBAction func datePickerPressed(_ sender: UIDatePicker) {
        let date = sender.date.formatted()
        print(date)
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
