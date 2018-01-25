//
//  ViewController.swift
//  EDD Project
//
//  Created by Joseph Kirven on 11/30/17.
//  Copyright © 2017 NKN Engineering. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {
    let db = try Connection("path/to/db.sqlite3")
    
    let users = Table("users")
    let id = Expression<Int64>("id")
    let name = Expression<String?>("name")
    let email = Expression<String>("email")
    
    try db.run(users.create { t in
    t.column(id, primaryKey: true)
    t.column(name)
    t.column(email, unique: true)
    })
    
    let insert = users.insert(name <- "Alice", email <- "alice@mac.com")
    let rowid = try db.run(insert)
    // INSERT INTO "users" ("name", "email") VALUES ('Alice', 'alice@mac.com')
    
    for user in try db.prepare(users) {
    print("id: \(user[id]), name: \(user[name]), email: \(user[email])")
    // id: 1, name: Optional("Alice"), email: alice@mac.com
    }
    // SELECT * FROM "users"
    
    let alice = users.filter(id == rowid)
    
    try db.run(alice.update(email <- email.replace("mac.com", with: "me.com")))
    // UPDATE "users" SET "email" = replace("email", 'mac.com', 'me.com')
    // WHERE ("id" = 1)
    
    try db.run(alice.delete())
    // DELETE FROM "users" WHERE ("id" = 1)
    
    try db.scalar(users.count) // 0
    // SELECT count(*) FROM "users"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("user").appendingPathExtension("sqlite")
            let database = try Connection(fileUrl.path)
            self.database = database
            
        } catch {
            print(error)
        }
        
        let documentDirectory = FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        
        
    }
    
    @IBAction func createTable() {
        print("CREATE TAPPED")
        
        let createTable = self.usersTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.name)
            table.column(self.email, unique)
        }
    }

    @IBAction func insertUser() {
        print("INSERT TAPPED")
        let alert = UIAlertController(title:"Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder="Name" }
        alert.addTextField { (tf) in tf.placeholder="Email" }
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let email = alert.textFields?.last?.text
                else { return }
            print(name)
            print(email)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func listUsers() {
        print("LIST TAPPED")
    }
    
    @IBAction func updateUser() {
        print("UPDATE TAPPED")
        let alert = UIAlertController(title: "Updated User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder="User ID" }
        alert.addTextField { (tf) in tf.placeholder="Email" }
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            guard let userIdString = alert.textFields?.first?.text,
                let email = alert.textFields?.last?.text
                else { return }
            print(userIdString)
            print(email)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteUser() {
        print("DELETE TAPPED")
        let alert = UIAlertController(title: "Delete User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder="User ID" }
        let action = UIAlertAction(title: "submit", style: .default) { (_) in
            guard let userIdString = alert.textFields?.first?.text else { return }
            print(userIdString)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

