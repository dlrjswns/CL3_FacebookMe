//
//  FacebookController.swift
//  CL3_FacebookMe
//
//  Created by 이건준 on 2021/12/08.
//

import UIKit

class FacebookController:UIViewController{
    //MARK: Model
    let model:[Menu] = [Menu(imageName: "friends.png", title: "Friends"), Menu(imageName: "calendar.png", title: "Events"), Menu(imageName: "groups.png", title: "Groups"), Menu(imageName: "education.png", title: "CMU"), Menu(imageName: "house.png", title: "Town Hall"), Menu(imageName: "games.png", title: "Instant Games"), Menu(imageName: "placeholder.png", title: "See More...")]
    //MARK: UI Components
    private lazy var facebookView:UITableView={
        let vw = UITableView()
        vw.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
        vw.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        return vw
    }()
    
    private lazy var viewForSection:UIView={
       let vw = UIView()
        vw.backgroundColor = .systemGray6
        vw.heightAnchor.constraint(equalTo: self)
        return vw
    }()
    
    //MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        facebookView.dataSource = self
        facebookView.delegate = self
        facebookView.register(ProfileCell.self, forCellReuseIdentifier: ProfileCell.identifier)
        
        facebookView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
        configure()
        
    }
    
    //MARK: -Configure
    func configure(){
        view.backgroundColor = .systemGray
        view.addSubview(facebookView)
        facebookView.translatesAutoresizingMaskIntoConstraints = false
        facebookView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        facebookView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

//MARK: -UITableViewDataSource
extension FacebookController:UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
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
        if section == 2{
            return "FAVORITES"}
        return " "
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2{
            let lb = UILabel()
            viewForSection.addSubview(lb)
            lb.translatesAutoresizingMaskIntoConstraints = false
            lb.leftAnchor.constraint(equalTo: viewForSection.leftAnchor, constant: 10).isActive = true
            lb.bottomAnchor.constraint(equalTo: viewForSection.bottomAnchor).isActive = true
        lb.text = "    FAVORITES"
        lb.font = UIFont.systemFont(ofSize: 13, weight: UIFont.Weight.medium)
        lb.textColor = .gray
        return viewForSection
        }
        return viewForSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2{
            return 45
        }
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let section = indexPath.section
        var cell : UITableViewCell = UITableViewCell()
        
        if section == 0 {
            cell = tableView.dequeueReusableCell(withIdentifier: ProfileCell.identifier, for: indexPath) as! ProfileCell
        }else if section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as! MenuCell
            cell.setImageName = model[indexPath.row].imageName
            cell.setTitleText = model[indexPath.row].title
        }
        
        return cell
    }
}

extension FacebookController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let section = indexPath.section
        
        if section == 0 {
            return 60
        }else{
            return 40
        }
    }
}
