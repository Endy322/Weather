//
//  ForeCView.swift
//  WeatherTestProject_Final
//
//  Created by Andrew Lesnov on 14.09.2023.
//

import Foundation
import UIKit

final class ForeCasView: UITableViewController{
    
    private var tempForWeek: [Int] = []
    var city: String = ""
    
    private var controller = MainController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSub()
        setupView()
        goToNetwork()
    }
    
    private func goToNetwork(){
        controller.getDataForWeek(city: "Globe")
    }
    
    
    private func setupView(){
        view.backgroundColor = .custom.backgroundColor
        tableView.register(CusCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tempForWeek.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(tempForWeek[indexPath.row])
        cell.backgroundColor = .custom.backgroundColor
        return cell
    }
}

private extension ForeCasView{
    func addSub(){
        NotificationCenter.default.addObserver(self, selector: #selector(doSub), name: Notification.Name(rawValue: "specialNotofocations"), object: nil)
        
        
    }
    
    @objc func doSub(notifivation: Notification){
        guard let userInfo = notifivation.userInfo else {return}
        guard let mass = userInfo["tempForWeek"] else {return}
        self.tempForWeek = mass as! [Int]
        tableView.reloadData()
    }
    
}



