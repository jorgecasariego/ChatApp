//
//  ViewController.swift
//  WhaleTalk
//
//  Created by Jorge Casariego on 15/3/16.
//  Copyright © 2016 Jorge Casariego. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    // 1. creamos un tableView desde aquí y no desde el storyboard
    private let tableView = UITableView()
    
    //5. creamos unas variables para almacenar mensajes 
    private var messages = [Message]()
    
    //6. Identificador de la celda el cual utilizaremos para reutilizar la celda
    private let cellIdentifier = "Cell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //7. Agregamos fake data al array de mensajes para probar
        for i in 0...10 {
            let m = Message()
            m.text = String(i)
            messages.append(m)
        }
        
        //8. Vamos a registrar nuestra celda en el tableView utilizando el cellIdentifier para poder reutilizarlo. Así tambien utilizamos el ChatCell que creamos
        tableView.registerClass(ChatCell.self, forCellReuseIdentifier: cellIdentifier)
        
        //10. 
        tableView.dataSource = self
        
        //2. hacemos el autoresizing false y agregar el tableview a la vista
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        //3. Vamos a agregar algunos contrainsts al tableView
        let tableViewConstraints: [NSLayoutConstraint] = [
            
            tableView.topAnchor.constraintEqualToAnchor(view.topAnchor),
            
            tableView.leadingAnchor.constraintEqualToAnchor(view.leadingAnchor),
            
            tableView.trailingAnchor.constraintEqualToAnchor(view.trailingAnchor),
            
            tableView.bottomAnchor.constraintEqualToAnchor(view.bottomAnchor)
        ]
        
        //4. Activamos todos nuestros constraints de una
        NSLayoutConstraint.activateConstraints(tableViewConstraints)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// 9. Creamos una extension para los valores de la tabla
extension ChatViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ChatCell
        let message = messages[indexPath.row]
        cell.messageLabel.text = message.text
        
        return cell
        
    }
}

