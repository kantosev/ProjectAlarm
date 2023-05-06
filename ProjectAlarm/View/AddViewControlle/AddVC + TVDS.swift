//
//  AddVC + TVDS.swift
//  ProjectAlarm
//
//  Created by Антон Кирилюк on 21.01.2023.
//

import UIKit

extension AddAlarmViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddAlarmCell", for: indexPath)
        return cell
    }
    
    
}
