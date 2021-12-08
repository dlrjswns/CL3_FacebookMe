//
//  menuCell.swift
//  CL3_FacebookMe
//
//  Created by 이건준 on 2021/12/09.
//

import UIKit

class MenuCell:UITableViewCell{
    //MARK: -Identifier
    static let identifier = "menuCell"
    
    //MARK: -Setter
    var setImageName:String?{
        didSet{
            imgView.image = UIImage(named: setImageName ?? "profile.jpeg")
            if setImageName == "placeholder.png"{
                self.accessoryType = .none
                titleLabel.textColor = .systemBlue
            }else{
                self.accessoryType = .disclosureIndicator
            }
        }
    }
    
    var setTitleText:String?{
        didSet{
            titleLabel.text = setTitleText
        }
    }
    
    //MARK: -Components
    private lazy var imgView:UIImageView={
        let vw = UIImageView()
        vw.widthAnchor.constraint(equalToConstant: 20).isActive = true
        vw.heightAnchor.constraint(equalToConstant: 20).isActive = true
        return vw
    }()
    
    private lazy var titleLabel:UILabel={
        let lb = UILabel()
        return lb
    }()
    
    //MARK: -Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Configure
    func configure(){
        self.addSubview(imgView)
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        imgView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 17).isActive = true
        
        self.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: imgView.centerYAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: imgView.rightAnchor, constant: 15).isActive = true
    }
}
