//
//  main.swift
//  DelegationDemo
//
//  Created by Mars on 3/4/16.
//  Copyright (c) 2016 Boxue. All rights reserved.
//

import Foundation

protocol ListTableDataSource: class {
    // 1. How many rows?
    func numberOfRows(listTable: ListTable) -> Int
    // 2. How to render each row?
    func cellForRowAtIndex(listTable: ListTable, index: Int) -> ListCell
}

protocol ListTableDelegate: class {
    // Cell selection event handler
    func didSelectRowAtIndex(listTable: ListTable, index: Int)
}

class ListTable {
    weak var dataSource: ListTableDataSource?
    weak var delegate: ListTableDelegate?

    func triggerCellSelection(index: Int) {
        if (self.delegate != nil) {
            self.delegate!.didSelectRowAtIndex(self, index: index) // ignore the out of index case
        }
    }

    func draw() {
        if (self.dataSource != nil) {
            // Render each row in a for cycle
            for index in 1...self.dataSource!.numberOfRows(self) {
                // 1. Get reach cell object
                let listCell = self.dataSource!.cellForRowAtIndex(self, index: index)
                // 2. Render the cell object
                listCell.draw()
            }
        }
    }
}

class ListCell {
    func draw() { print("I'm a list cell", terminator: "") }
}

class CustomListCell: ListCell {
    override func draw() { print("I'm a custom list cell", terminator: "") }
}

class ListTableController: ListTableDataSource, ListTableDelegate {
    var listTable: ListTable!

    init() {
        self.listTable = ListTable()
    }

    func listWillDisplay() {
        self.listTable.dataSource = self
        self.listTable.delegate = self
    }

    // list table data source methods
    // 1. How many rows?
    func numberOfRows(listTable: ListTable) -> Int {
        return 10
    }

    // 2. How to render each row?
    func cellForRowAtIndex(listTable: ListTable, index: Int) -> ListCell {
        if (index % 2 == 0) {
            return CustomListCell()
        }
        else {
            return ListCell()
        }
    }

    // List table delegate methods
    // Cell selection event handler
    func didSelectRowAtIndex(listTable: ListTable, index: Int) {
        // Get the selected row
        let cell = self.cellForRowAtIndex(listTable, index: index)
        // Print a prompt message
        print("\(cell.dynamicType) \(index) is selected", terminator: "")
    }
}

// 1. Create a listtable controller
var listTableController = ListTableController()
// 2. Set data source
listTableController.listWillDisplay()
// 3. Draw the list table
listTableController.listTable.draw()

listTableController.listTable.triggerCellSelection(2)












