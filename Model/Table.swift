//
//  Profile.swift
//  CL3_FacebookMe
//
//  Created by 이건준 on 2021/12/08.
//

import UIKit

class Table{
    static let shared = Table()
    
    func getTable()->[Section]{
        let cellsOne:[Status] = [
            Status(imageName: "profile.jpeg", title: "이건준", description: "View your profile", whatType: .profile)
        ]
        
        let cellsTwo:[Status] = [
            Status(imageName: "friends.png", title: "Friends", whatType: .menu),
            Status(imageName: "calendar.png", title: "Events", whatType: .menu),
            Status(imageName: "groups.png", title: "Groups", whatType: .menu),
            Status(imageName: "education.png", title: "CMU", whatType: .menu),
            Status(imageName: "house.png", title: "Town Hall", whatType: .menu),
            Status(imageName: "games.png", title: "Instant Games", whatType: .menu),
            Status(imageName: "placeholder.png", title: "See More...", whatType: .menu)
        ]
        
        let cellsThr:[Status] = [ Status(imageName: "placeholder.png", title: "Add Favorites...", whatType: .menu) ]
        
        let cellsFour:[Status] = [
            Status(imageName: "gear.png", title: "Settings", whatType: .menu),
            Status(imageName: "lock.png", title: "Privacy Shortcuts", whatType: .menu),
            Status(imageName: "question.png", title: "Help and Support", whatType: .menu)
        ]
        let table:[Section] = [
            Section(cells: cellsOne, sectionTitle: nil),
            Section(cells: cellsTwo, sectionTitle: " "),
            Section(cells: cellsThr, sectionTitle: "FAVORITES"),
            Section(cells: cellsFour, sectionTitle: " ")
        ]
        
        return table
    }
    
}

