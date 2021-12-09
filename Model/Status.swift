//
//  Status.swift
//  CL3_FacebookMe
//
//  Created by 이건준 on 2021/12/10.
//

import Foundation

struct Status {
    let imageName:String
    let title:String
    let description:String?
    let whatType:WhatCell
    
    init(imageName:String, title:String, description:String? = nil, whatType:WhatCell) {
        self.imageName = imageName
        self.title = title
        self.description = description
        self.whatType = whatType
    }
    
//    init(imageName:String, title:String) {
//        self.imageName = imageName
//        self.title = title
//        self.description = nil
//    }
}
