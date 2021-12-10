//
//  FacebookController.swift
//  CL3_FacebookMe
//
//  Created by 이건준 on 2021/12/08.
//

import UIKit

class FacebookController:UIViewController{
    //MARK: Model
    let model:[Section] = Table.shared.getTable()
    
    //MARK: UI Components
    private lazy var facebookView:UITableView={
        let vw = UITableView(frame: .zero, style: UITableView.Style.grouped)
        vw.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        vw.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        return vw
    }()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        setNavigationBar()
        configure()
    }
    
    //MARK: -Set TableView
    func setTableView(){
        facebookView.dataSource = self
        facebookView.delegate = self
        facebookView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        
        facebookView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
    }
    
    //MARK: -Set NavigationBar
    func setNavigationBar(){
        self.title = "FaceBook"
        self.navigationController?.navigationBar.barTintColor = .systemBlue
    }
    
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemGray5
        view.addSubview(facebookView)
        facebookView.translatesAutoresizingMaskIntoConstraints = false
        facebookView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        facebookView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}

//MARK: -UITableViewDataSource
extension FacebookController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return 7
        case 2:
            return 1
        case 3:
            return 3
        case 4:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model[section].sectionTitle
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let sectionTitle = model[section].sectionTitle
        if sectionTitle == "FAVORITES"{
            return 40
        }else{
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = model[indexPath.section].cells[indexPath.row].whatType
        let imgName = model[indexPath.section].cells[indexPath.row].imageName
        let title = model[indexPath.section].cells[indexPath.row].title
        let description = model[indexPath.section].cells[indexPath.row].description
        
        switch type {
        case .profile:
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
            cell.profileView.image = UIImage(named: imgName)
            cell.nameLabel.text = title
            cell.subLabel.text = description
            return cell
        case .menu:
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
            cell.setImageName = imgName
            cell.setTitleText = title
            return cell
        }
    }
}

//MARK: -UITableViewDelegate
extension FacebookController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let type = model[indexPath.section].cells[indexPath.row].whatType
        
        switch type{
        case .profile:
            return 70
        case .menu:
            return 40
        }
    }
}
