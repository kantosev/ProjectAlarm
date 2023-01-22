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
        // #warning Incomplete implementation, return the number of rows
        return mainViewModel?.numberOfItemsInSection() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "alarmCell", for: indexPath) as? AlarmCell else { return UITableViewCell() }
        mainViewModel?.setOfCell(cell: cell, with: indexPath)
        
        let alarmSwitch = UISwitch(frame: CGRect())
        alarmSwitch.addTarget(self, action: #selector(switchFunction), for: .valueChanged)
        cell.accessoryView = alarmSwitch
        
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
    
    @objc func switchFunction() {
       
    }
        
}
