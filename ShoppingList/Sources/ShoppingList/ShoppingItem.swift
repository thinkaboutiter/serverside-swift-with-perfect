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
    // These properties are reflected in the database table
    // NOTE: First param in class should be the ID.
    var id: String = ""
    var name: String = ""
    var quantity: Int = 0
    var isBought: Bool = false
    
    // MARK: - Initiailization
    override init() {
        super.init()
        
        // since `_collection` is not declared as `open` in the `MongoDBStorm` package
        // we can not override it, so we update its value here!
        self._collection = "ShoppingItem"
    }
    
    // MARK: - Life cycle
    override func to(_ this: StORMRow) {
        self.id = this.data["_id"] as? String ?? ""
        self.name = this.data["name"] as? String ?? ""
        self.quantity = this.data["quantity"] as? Int ?? 0
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
            "id": self.id,
            "name": self.name,
            "quantity": self.quantity,
            "isBought": self.isBought
        ]
    }
}

// MARK: - Create
extension ShoppingItem {
    
    static func create(withJSONRequest json: String?) throws -> String {
        guard let valid_jsonString: String = json else {
            return "Invalid JSON string"
        }
        guard let valid_dict: [String: Any] = try valid_jsonString.jsonDecode() as? [String: Any] else {
            return "Unable to convert JSON string to Dictionary"
        }
        guard let valid_name: String = valid_dict["name"] as? String else {
            return "Unable to obtain `name`"
        }
        guard let valid_quantity: Int = valid_dict["quantity"] as? Int else {
            return "Unable to obtain `quantity`"
        }
        guard let valid_isBought: Bool = valid_dict["isBought"] as? Bool else {
            return "Unable to obtain `isBought`"
        }
        
        return try create(withName: valid_name, quantity: valid_quantity, isBought: valid_isBought).jsonEncodedString()
    }
    
    static func create(withName name: String, quantity: Int, isBought: Bool) throws -> [String: Any] {
        let shoppingItem: ShoppingItem = ShoppingItem()
        shoppingItem.id = shoppingItem.newObjectId()
        shoppingItem.name = name
        shoppingItem.quantity = quantity
        shoppingItem.isBought = isBought
        
        try shoppingItem.save()
        return shoppingItem.asDictionary()
    }
}

// MARK: - Read
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
    
    static func allAsString() throws -> String {
        return try allAsDictionary().jsonEncodedString()
    }
    
    static func allAsDictionary() throws -> [[String: Any]] {
        let shoppingItems: [ShoppingItem] = try ShoppingItem.all()
        return dictionary(from: shoppingItems)
    }
    
    static func first() throws -> ShoppingItem? {
        return try ShoppingItem.all().first
    }
    
    static func all() throws -> [ShoppingItem] {
        let getObj: ShoppingItem = ShoppingItem()
        try getObj.find()
        return getObj.rows()
    }
    
    fileprivate static func dictionary(from shoppingItems: [ShoppingItem]) -> [[String: Any]] {
        var shoppingItemsJson: [[String: Any]] = []
        for item in shoppingItems {
            shoppingItemsJson.append(item.asDictionary())
        }
        return shoppingItemsJson
    }
}

// MARK: - Update
extension ShoppingItem {
    
    // TODO: implement me
}

// MARK: - Delete
extension ShoppingItem {
    
    // TODO: implement me
}
