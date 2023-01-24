//
//  MainViewController.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 20.01.2023.
//

import UIKit

class MainViewController: UITableViewController {

    var mainViewModel: MainViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainViewModel = MainViewModel()
        registerCell()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return mainViewModel?.numberOfItemsInSection() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmCell else { return UITableViewCell() }
        createSwitch(with: cell, indexPath: indexPath)
        mainViewModel?.setOfCell(cell: cell, with: indexPath)
        
        return cell
    }
    

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddVCSegue" {
            guard let navController = segue.destination as? UINavigationController,
                  let vc = navController.topViewController as? AddAlarmViewController  else { return }
            vc.addAlarmCompletion = { alarmDateComponents in
                self.mainViewModel?.addDateToArrayOfAlarm(dateComponents: alarmDateComponents)
                self.tableView.reloadData()
            }
        }
    }
    // MARK: -
    private func registerCell() {
        tableView.register(UINib(nibName: "AlarmCell", bundle: nil), forCellReuseIdentifier: "alarmCell")
    }
    
    
    // MARK: - SUPPORT FUNCTION
    
    private func createSwitch(with cell: AlarmCell, indexPath: IndexPath) {
        let alarmSwitch = UISwitch(frame: CGRect())
        alarmSwitch.addTarget(self, action: #selector(switchFunction(_:)), for: .valueChanged)
        alarmSwitch.tag = indexPath.row
        cell.accessoryView = alarmSwitch
    }
    
    
    @objc private func switchFunction(_ sender: UISwitch) {
        mainViewModel?.editEnabledValueInAlarm(with: sender.tag, enabled: sender.isOn)
        if sender.isOn {
            mainViewModel?.addNotification(with: sender.tag)
        } else {
            mainViewModel?.deleteNotification(with: sender.tag)
            
        }
    }
        
}
