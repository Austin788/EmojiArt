//
//  Grid.swift
//  Memorize
//
//  Created by Austin Zheng on 2020/12/17.
//

import SwiftUI

extension Grid where Item: Identifiable, ID==Item.ID {
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.init(items, id: \Item.id, viewForItem: viewForItem)
    }
}

struct Grid<Item, ID, ItemView>: View where ID: Hashable, ItemView: View {
    private var items: [Item]
    private var viewForItem: (Item) -> ItemView
    private var id: KeyPath<Item,ID>
    
    init(_ items: [Item], id: KeyPath<Item,ID>, viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.id = id
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { gemotry in
            body(for: GridLayout(itemCount: items.count, in: gemotry.size))
        }
    }
    private func body(for layout: GridLayout) -> some View {
        ForEach(items, id: id) { item in
            self.body(for: item, in: layout)
        }
    }
    private func body(for item: Item, in layout: GridLayout ) -> some View {
        let index = items.firstIndex(where: { item[keyPath: id] == $0[keyPath: id]})
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index!))
        
    }
//    func index(of item: Item) -> Int {
//        for index in 0..<items.count {
//            if item.id == items[index].id {
//                return index
//            }
//        }
//        return 0
//    }
    
}

