//
//  TableViewControllerNuevo.swift
//  TableViewController
//
//  Created by Beatriz Coaquira Alcca on 28/04/25.
//

import UIKit



class TableViewControllerNuevo: UITableViewController {
    // Arreglo que contendrá los datos para mostrar en la tabla
    var arregloNumeros = ["1", "2", "3", "4"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isEditing = true
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        //setEditing(true, animated: true)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arregloNumeros.count
    }

    
    // Define cómo se verá cada celda
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // Configura el texto principal de la celda
        cell.textLabel?.text = arregloNumeros[indexPath.row]
        
        switch cell.textLabel?.text {
            case "1":
                cell.imageView?.image = UIImage(named: "ICONOS/1.jpg")
                cell.detailTextLabel?.text = "Celda numero 1"
            case "2":
                cell.imageView?.image = UIImage(named: "ICONOS/2.jpg")
                cell.detailTextLabel?.text = "Celda numero 2"
            case "3":
                cell.imageView?.image = UIImage(named: "ICONOS/3.jpg")
                cell.detailTextLabel?.text = "Celda numero 3"
            case "4":
                cell.imageView?.image = UIImage(named: "ICONOS/4.jpg")
                cell.detailTextLabel?.text = "Celda numero 4"
            default:
                print("No hay mas elementos para llenar imagen")
                cell.detailTextLabel?.text = "Celda fuera de rango"
            }
        
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    //Codigo estilo de botones personalizados
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Acción para eliminar
        let botonEliminar = UITableViewRowAction(style: .destructive, title: "Eliminar") { (accionesFila, indicefila) in
            self.arregloNumeros.remove(at: indexPath.row)
            // Elimina específicamente la fila en lugar de recargar toda la tabla
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        botonEliminar.backgroundColor = UIColor.red
        
        // Acción para insertar
        let botonInsertar = UITableViewRowAction(style: .normal, title: "Insertar") { (accionesFila, indicefila) in
            // Intenta convertir de forma segura
            if let ultimoElemento = self.arregloNumeros.last, let numero = Int(ultimoElemento) {
                // Inserta después de la fila actual en lugar de al final
                let nuevoElemento = String(numero + 1)
                let nuevaPosicion = indexPath.row + 1
                
                // Asegura que no exceda los límites del arreglo
                let posicionSegura = min(nuevaPosicion, self.arregloNumeros.count)
                
                self.arregloNumeros.insert(nuevoElemento, at: posicionSegura)
                
                // Inserta la nueva fila específicamente
                let nuevoIndexPath = IndexPath(row: posicionSegura, section: 0)
                tableView.insertRows(at: [nuevoIndexPath], with: .automatic)
            }
        }
        botonInsertar.backgroundColor = UIColor.green
        
        return [botonEliminar, botonInsertar]
    }


    // Override to support editing the table view.
    /*
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if self.isEditing {
            self.editButtonItem.title = "Editar"
        } else {
            self.editButtonItem.title = "Hecho"
        }
    }
   
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let objetoMovido = self.arregloNumeros[fromIndexPath.row]
            arregloNumeros.remove(at: fromIndexPath.row)
            arregloNumeros.insert(objetoMovido, at: to.row)
            NSLog("%@", "\(fromIndexPath.row) => \(to.row) \(arregloNumeros)")

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
