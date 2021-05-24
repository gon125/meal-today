//
//  DB_Manager.swift
//  read_db
//
//  Created by SON on 2021/05/23.
//

import Foundation
import SQLite3

class DB_Manager {
    var stmt: OpaquePointer?

    // Sample Query
    let queryStatementString = "select * from seafood where upper_class='구이류';"
    
    init() {
        do {
            copyDatabse()
        } catch {
            print(error)
        }
    }
    
    // DB 저장 위치 (복사된 파일)
    public func dbPath() -> String {
        let dirPaths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPaths[0]
        let destPath = (docsDir as NSString).appendingPathComponent("menu_db.sqlite3")
        return destPath
    }
    
    // atPath: 현재 저장된 디비 위치, toPath: DB가 저장될 위치
    public func copyDatabse() {
        let fileManager = FileManager.default
        
        if let path = Bundle.main.path(forResource: "test", ofType: "db") {
            do {
                try fileManager.copyItem(atPath: path, toPath: dbPath())
                print("CopySuccess....")
            } catch {
                print("error2: \(error)")
            }
        }
    }
    
    // 복사된 DB open
    public func openDatabase() -> OpaquePointer? {
        var db: OpaquePointer? = nil
        if sqlite3_open(dbPath(), &db) == SQLITE_OK {
            print("Successfully opened connection to db")
            return db
        } else {
            print("Unable to open database")
            return nil
        }
    }
    
    // Sample Query 실행
    public func readData() {
        let db = openDatabase()
        
        if sqlite3_prepare(db, queryStatementString, -1, &stmt, nil) != SQLITE_OK {
            let errmsg = String(cString: sqlite3_errmsg(db)!)
            print("error preparing insert: \(errmsg)")
            return
        }
        
        while(sqlite3_step(stmt) == SQLITE_ROW){
            let idResult = sqlite3_column_int(stmt, 0)
            let name = String(cString: sqlite3_column_text(stmt, 1))
            print("id: \(idResult)" + " name: \(name)")
        }
    }
}
