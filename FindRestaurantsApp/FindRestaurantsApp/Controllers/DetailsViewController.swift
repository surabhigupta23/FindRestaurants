//
//  DetailsViewController.swift
//  FindRestaurantsApp
//
//  Created by Surabhi Gupta on 10/22/19.
//  Copyright © 2019 Surabhi Gupta. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
   
    @IBOutlet weak var tableView: UITableView!
    
    let restaurantCells = ["ImageTableViewCell",
                           "DetailsTableViewCell",
                           "BookTableViewCell",
                           "BookingDetailsTableViewCell"]
    var restaurant = Restaurant()
    var toolbar = UIToolbar()
    let datePicker = UIDatePicker()
    var senderButton = UIButton()
    weak var delegate: BookTableDelegate?
    var isTableBooked = false
    var bookedDateTime:String?
    let configureView = Configuration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        registerNibs()
    }
    
    private func registerNibs() {
        tableView.register(UINib(nibName: restaurantCells[0], bundle: nil), forCellReuseIdentifier: restaurantCells[0])
        tableView.register(UINib(nibName: restaurantCells[1], bundle: nil), forCellReuseIdentifier: restaurantCells[1])
        tableView.register(UINib(nibName: restaurantCells[2], bundle: nil), forCellReuseIdentifier: restaurantCells[2])
        tableView.register(UINib(nibName: restaurantCells[3], bundle: nil), forCellReuseIdentifier: restaurantCells[3])
    }
    //MARK: Configure DatePicker
    func configureDatePicker(){
        datePicker.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 216)
        datePicker.datePickerMode = .dateAndTime
        datePicker.minimumDate = Date()
        datePicker.minuteInterval = 30
        datePicker.addTarget(self, action: #selector(dateChanged(sender:)), for: .valueChanged)
        self.view.addSubview(datePicker)
        
        //Set up toolBar
        toolbar = UIToolbar(frame: CGRect(x: 0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneDatePicker));
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker));
        toolbar.sizeToFit()
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        self.view.addSubview(toolbar)
    }
    
    @objc func dateChanged(sender:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = DateFormatter.Style.long
        dateFormatter.timeStyle = DateFormatter.Style.medium
    }
    
    @objc func doneDatePicker(){
        toolbar.removeFromSuperview()
        datePicker.removeFromSuperview()
        let formatter = DateFormatter()
        // set custom format to get desired date format
        formatter.dateFormat = configureView.customDateFormat

        let date = formatter.string(from: datePicker.date)
        
        let alert = UIAlertController(title: configureView.title, message: configureView.alertMsg + date, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                // pass details to ListVC which conforms this delegate
                self.delegate?.getBookedDataDetails(self.restaurant, date)
                self.navigationController?.popViewController(animated: true)
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
            
            }}))
        self.present(alert, animated: true, completion: nil)
        self.view.endEditing(true)
    }
    
    @objc func cancelDatePicker(){
        senderButton.isEnabled = true
        toolbar.removeFromSuperview()
        datePicker.removeFromSuperview()
        self.view.endEditing(true)
    }
}

protocol BookTableDelegate: class {
    func getBookedDataDetails(_ restaurant : Restaurant, _ dateTime : String)
}

