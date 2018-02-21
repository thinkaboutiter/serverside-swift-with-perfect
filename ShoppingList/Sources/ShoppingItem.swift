//
//  ShoppingItem.swift
//  ShoppingList
//
//  Created by boyankov on W08 21/Feb/2018 Wed.
//

import Foundation
import StORM
import MongoDBStORM

class ShoppingItem: MongoDBStORM {
    
    // MARK: - Properties
    var name: String = ""
    var quantity: UInt64 = 0
    var isBought: Bool = false
    
    override var _collection: String {
        return "ShoppingItem"
    }
    
    // MARK: - Initiailization
    convenience init(name: String, quantity: UInt64, isBought: Bool) {
        self.init()
        self.name = name
        self.quantity = quantity
        self.isBought = isBought
    }
    
    // MARK: - Life cycle
    override func to(_ this: StORMRow) {
        self.name = this.data["name"] as? String ?? ""
        self.quantity = this.data["quantity"] as? UInt64 ?? 0
        self.isBought = this.data["isBought"] as? Bool ?? false
    }
    
    func rows() -> [ShoppingItem] {
        var rows = [ShoppingItem]()
        for i in 0..<self.results.rows.count {
            let row = ShoppingItem()
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
    
    func asDictionary() -> [String: Any] {
        return [
            "name": self.name,
            "quantity": self.quantity,
            "isBought": self.isBought
        ]
    }
}

// MARK: - Creation
extension ShoppingItem {
    
    static func all() throws -> [ShoppingItem] {
        let getObj: ShoppingItem = ShoppingItem()
        try getObj.find()
        return getObj.rows()
    }
    
    static func first() throws -> ShoppingItem? {
        return try ShoppingItem.all().first
    }
}

// MARK: - JSON conversions
extension ShoppingItem {
    
    static func firstAsString() throws -> String {
        return try firstAsDictionary().jsonEncodedString()
    }
    
    static func firstAsDictionary() throws -> [String: Any] {
        if let shoppingItem: ShoppingItem = try ShoppingItem.first() {
            return shoppingItem.asDictionary()
        }
        else {
            return [:]
        }
    }
    
    static func newOrUpdatedShoppingItem(withJSONRequest json: String?) throws -> String {
        guard
            let json = json,
            let dict = try json.jsonDecode() as? [String: Any],
            let name: String = dict["name"] as? String,
            let quantity: UInt64 = dict["quantity"] as? UInt64,
            let isBought: Bool = dict["isBought"] as? Bool
            else {
                return "Invalid parameters"
        }
        return try newOrUpdatedShoppingItem(withName: name, quantity: quantity, isBought: isBought).jsonEncodedString()
    }
    
    static func newOrUpdatedShoppingItem(withName name: String, quantity: UInt64, isBought: Bool) throws -> [String: Any] {
        let shoppingItem: ShoppingItem = ShoppingItem(name: name, quantity: quantity, isBought: isBought)
        try shoppingItem.save()
        return shoppingItem.asDictionary()
    }
    
    static func allAsString() throws -> String {
        return try allAsDictionary().jsonEncodedString()
    }
    
    static func allAsDictionary() throws -> [[String: Any]] {
        let shoppingItems: [ShoppingItem] = try ShoppingItem.all()
        return shoppingItemsToDictionary(shoppingItems)
    }
    
    static func shoppingItemsToDictionary(_ shoppingItems: [ShoppingItem]) -> [[String: Any]] {
        var shoppingItemsJson: [[String: Any]] = []
        for item in shoppingItems {
            shoppingItemsJson.append(item.asDictionary())
        }
        return shoppingItemsJson
    }
}
