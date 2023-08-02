//
//  ItemViewModel.swift
//  mvvm
//
//  Created by Waldi Febrianda on 02/08/23.
//

import Foundation
// ItemViewModel.swift


class ItemViewModel {
    private var items: [Item] = []

    var itemCount: Int {
        return items.count
    }

    func getItem(at index: Int) -> Item {
        return items[index]
    }

    func addItem(name: String) {
        let newItem = Item(name: name)
        items.append(newItem)
    }
}
