//
//  dbManager.swift
//  MealToday
//
//  Created by SON on 2021/05/31.
//

import Foundation
import SQLite3

class DBManager {
    // MealTodayApp.swift -> DBManager.init() // initial copy DB
    var db: OpaquePointer?

    init() {
        copyDB()
        db = openDB()
    }

    func dbPath() -> String { // menu.sqlite
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let destPath = (docsDir as NSString).appendingPathComponent("menu.sqlite3")

        return destPath
    }

    func copyDB() {
        let fileManager = FileManager.default

        if fileManager.fileExists(atPath: dbPath()) {
            print("file already exists")
        } else {
            if let path = Bundle.main.path(forResource: "foods", ofType: "sqlite") {
                do {
                    try fileManager.copyItem(atPath: path, toPath: dbPath())
                    print("Copy completed")
                } catch {
                    print("error2: \(error)")
                }
            }
        }
    }

    func openDB() -> OpaquePointer? {
        if sqlite3_open(dbPath(), &db) == SQLITE_OK {
            print("Successfully opened connection to db")
            return db
        } else {
            print("Unable to open database")
            return nil
        }
    }

    func readData(query: String) -> [Food]? {
        var stmt: OpaquePointer?
        var foods = [Food]()

        if sqlite3_prepare(db, query, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return nil
        }

        while sqlite3_step(stmt) == SQLITE_ROW {
            let name = String(cString: sqlite3_column_text(stmt, 0))
            let food = Food(name: name)
            foods.append(food)
        }

        return foods
    }

}
