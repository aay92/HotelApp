//
//  ModelsProject.swift
//  AppForTest
//
//  Created by Aleksey Alyonin on 17.12.2023.
//

import UIKit

struct AutoLayout {
    var height: Int
    var width : Int
}

struct ItemInCollectionView: Codable {
    let name: String
}

struct ItemInTableView {
    let name: String
    let description: String
    let image: String
}

class GetItemInTableView {
     func getItemInTableView() -> [ItemInTableView] {
        var items: [ItemInTableView] = []
        items.append(ItemInTableView(
            name: "Удобства",
            description: "Самое необходимое",
            image: "pic1"))
        items.append(ItemInTableView(
            name: "Что включено",
            description: "Самое необходимое",
            image: "pic2"))
        
        items.append(ItemInTableView(
            name: "Что не включено",
            description: "Самое необходимое",
            image: "pic3"))
        return items
    }
}

struct ItemInChooseTableView {
    let image: String
    let name: String
    let plus1: String
    let plus2: String
    let cost: Int
}

