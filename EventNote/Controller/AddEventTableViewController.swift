//
//  AddEventTableViewController.swift
//  EventNote
//
//  Created by Vladimir Pisarenko on 17.08.2022.
//

import UIKit

class AddEventTableViewController: UITableViewController  {
    
    var event: Event?
    
    var kindOfShooting1: KindOfShootingList?
    var amountOfHours: Int?
    var kindOfAlertOpted: KindOfAlertList?
    

    
    let idDatePickerCell = "idDatePickerCell"
    let idTextFieldCell = "idTextFieldCell"
    let idAddEventCell = "idAddEventCell"
    let idAddEventHeader = "idAddEventHeader"
    
    var addEventCellName: AddEventCellNameMainSectionType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButton))
    
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(DatePickerTableViewCell.self, forCellReuseIdentifier: idDatePickerCell)
        tableView.register(TextFieldTableViewCell.self, forCellReuseIdentifier: idTextFieldCell)
        tableView.register(ListTableViewCell.self, forCellReuseIdentifier: idAddEventCell)
        tableView.register(AddEventTableViewHeader.self, forHeaderFooterViewReuseIdentifier: idAddEventHeader)
        
        title = "New Event"
        print("Did works")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("Will works")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("Did App works")
    }
    
    @objc func saveButton() {
        
    }
    
//    private func updateSaveButtonState() {
//        let shouldEnableSaveButton = nameTextField.text?.isEmpty == false && employeeType != nil
//        saveBarButtonItem.isEnabled = shouldEnableSaveButton
//    }
    
    
    //MARK: - Table View
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return AddEventCellNameMainSectionType.allCases.count
        case 1: return AddEventCellNameContactsSectionType.allCases.count
        case 2: return AddEventCellLocationsMainSectionType.allCases.count
        case 3: return AddEventCellNamePaymentSectionType.allCases.count
        case 4: return AddEventCellNameReminderSectionType.allCases.count
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: idAddEventCell, for: indexPath) as! ListTableViewCell
                let type = AddEventCellNameMainSectionType.allCases[indexPath.row]
                if let kindOfShooting1 = kindOfShooting1 {
                    cell.nameCellLabel.text = kindOfShooting1.description
                    cell.nameCellLabel.textColor = .label
                } else {
                    cell.nameCellLabel.text = type.description
                    cell.nameCellLabel.textColor = .darkGray
                }
                cell.accessoryType = .disclosureIndicator
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: idDatePickerCell, for: indexPath) as! DatePickerTableViewCell
                let type = AddEventCellNameMainSectionType.allCases[indexPath.row]
                cell.nameCellLabel.text = type.description
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: idAddEventCell, for: indexPath) as! ListTableViewCell
                let type = AddEventCellNameMainSectionType.allCases[indexPath.row]
                cell.nameCellLabel.text = type.description
                cell.accessoryType = .disclosureIndicator
                return cell
                
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: idAddEventCell, for: indexPath) as! ListTableViewCell
                let type = AddEventCellNameMainSectionType.allCases[indexPath.row]
                cell.nameCellLabel.text = type.description
                return cell
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: idTextFieldCell, for: indexPath) as! TextFieldTableViewCell
            let type = AddEventCellNameContactsSectionType.allCases[indexPath.row]
            cell.textField.placeholder = type.description
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: idTextFieldCell, for: indexPath) as! TextFieldTableViewCell
            let type = AddEventCellLocationsMainSectionType.allCases[indexPath.row]
            cell.textField.placeholder = type.description
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: idTextFieldCell, for: indexPath) as! TextFieldTableViewCell
            let type = AddEventCellNamePaymentSectionType.allCases[indexPath.row]
            cell.textField.placeholder = type.description
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: idAddEventCell, for: indexPath) as! ListTableViewCell
            let type = AddEventCellNameReminderSectionType.allCases[indexPath.row]
            cell.nameCellLabel.text = type.description
            cell.accessoryType = .disclosureIndicator
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: idAddEventCell, for: indexPath) as! ListTableViewCell
            let type = AddEventCellNameContactsSectionType.allCases[indexPath.row]
            cell.nameCellLabel.text = type.description
            return cell
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idAddEventHeader ) as! AddEventTableViewHeader
        header.headerConfigure(section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0, 0]:
            let alertVC = KindOfShootingTableViewController()
            alertVC.delegate = self
            alertVC.kindOfShooting = kindOfShooting1
            alertVC.modalTransitionStyle = .coverVertical
            let navController = UINavigationController(rootViewController: alertVC)
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            navController.navigationBar.standardAppearance = appearance
            navController.navigationBar.scrollEdgeAppearance = appearance
            present(navController, animated: true)
        case [0, 2]:
            let alertVC = AmountOfHoursListTableViewController()
            alertVC.modalTransitionStyle = .coverVertical
            let navController = UINavigationController(rootViewController: alertVC)
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            navController.navigationBar.standardAppearance = appearance
            navController.navigationBar.scrollEdgeAppearance = appearance
            present(navController, animated: true)
        case [4, 0]:
            let alertVC = KindOfAlertListTableViewController()
            alertVC.modalTransitionStyle = .coverVertical
            let navController = UINavigationController(rootViewController: alertVC)
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            navController.navigationBar.standardAppearance = appearance
            navController.navigationBar.scrollEdgeAppearance = appearance
            present(navController, animated: true)
        default:
            break
        }
    }
}

extension AddEventTableViewController: KindOfShootingTableViewControllerDelegate, AmountOfHoursListTableViewControllerDelegate, KindOfAlertListTableViewControllerDelegate {
    func kindOfAlertListTableViewController(_ controller: KindOfAlertListTableViewController, didSelect kindOfAlert: KindOfAlertList) {
        self.kindOfAlertOpted = kindOfAlert
        tableView.reloadData()
    }

    func amountOfHoursListTableViewController(_ controller: AmountOfHoursListTableViewController, didSelect amount: Int) {
        self.amountOfHours = amount
        tableView.reloadData()
    }

    func kindOfShootingTableViewController(_ controller: KindOfShootingTableViewController, didSelect kindOfShooting: KindOfShootingList) {
        self.kindOfShooting1 = kindOfShooting
        tableView.reloadData()
    }
}


