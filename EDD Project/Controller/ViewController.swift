//
//  ViewController.swift
//  EDD Project
//
//  Created by Joseph Kirven on 11/30/17.
//  Copyright © 2017 NKN Engineering. All rights reserved.
//

import UIKit
import SQLite3

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent(user)
        } catch {
            print(error)
        }
        
         let documentDirectory = FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        
        
        
    }

    @IBAction func createTable() {
        print("CREATE TAPPED")
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

