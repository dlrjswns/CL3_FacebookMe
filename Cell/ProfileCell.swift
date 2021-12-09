//
//  ProfileCell.swift
//  CL3_FacebookMe
//
//  Created by 이건준 on 2021/12/08.
//

import UIKit

class ProfileCell:UITableViewCell{
    //MARK: -Identifier
    static let identifier = "profileCell"
    
    //MARK: -Components
    lazy var profileView:UIImageView={
        let vw = UIImageView()
        vw.heightAnchor.constraint(equalToConstant: 70).isActive = true
        vw.widthAnchor.constraint(equalToConstant: 70).isActive = true
        vw.contentMode = .scaleAspectFit
        return vw
    }()
    
    lazy var nameLabel:UILabel={
        let lb = UILabel()
//        lb.text = "이건준"
        lb.font = UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold)
        return lb
    }()
    
    lazy var subLabel:UILabel={
        let lb = UILabel()
//        lb.text = "View your profile"
        lb.font = UIFont.systemFont(ofSize: 13)
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Configure
    func configure(){
        self.accessoryType = .disclosureIndicator
        
        self.addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        profileView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        
        self.addSubview(nameLabel)
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 18).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: profileView.rightAnchor, constant: 10).isActive = true
        
        self.addSubview(subLabel)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor).isActive = true
        subLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }
}
