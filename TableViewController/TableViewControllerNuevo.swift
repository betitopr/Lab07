//
//  TableViewControllerNuevo.swift
//  TableViewController
//
//  Created by Beatriz Coaquira Alcca on 28/04/25.
//

import UIKit



class TableViewControllerNuevo: UITableViewController {
    // Arreglo que contendrá los datos para mostrar en la tabla
    var arregloNumeros = ["1", "2", "3", "4","5"]

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
                cell.imageView?.image = UIImage(named: "ICONOS/mercedez.jpeg")
                cell.detailTextLabel?.text = "Mercedes-Benz S-Class"
            case "2":
                cell.imageView?.image = UIImage(named: "ICONOS/bmw.jpeg")
                cell.detailTextLabel?.text = "BMW Serie 7"
            case "3":
                cell.imageView?.image = UIImage(named: "ICONOS/audi.jpeg")
                cell.detailTextLabel?.text = "Audi A8"
            case "4":
                cell.imageView?.image = UIImage(named: "ICONOS/porsche.jpeg")
                cell.detailTextLabel?.text = "Porsche Panamera"
            case "5":
            cell.imageView?.image = UIImage(named: "ICONOS/rolls.jpeg")
            cell.detailTextLabel?.text = "Rolls-Royce Phantom"
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
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Acción para eliminar
        let botonEliminar = UITableViewRowAction(style: .normal, title: "Eliminar") { (accionesFila, indiceFila) in
            self.arregloNumeros.remove(at: indexPath.row)
            tableView.reloadData()
            
        }
        botonEliminar.backgroundColor = UIColor.red
        
        // Acción para insertar
        let botonInsertar = UITableViewRowAction(style: .normal, title: "Insertar") { (accionesFila, indiceFila) in
            let ultimoElemento = self.arregloNumeros[self.arregloNumeros.count-1]
            self.arregloNumeros.append(String(Int(ultimoElemento)! + 1))
            tableView.reloadData()
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let valorSeleccionado = indexPath.row
        self.performSegue(withIdentifier: "pantallaDosSegue", sender: valorSeleccionado)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pantallaDosSegue" {
            let valorRecibido = sender as? Int
            let pantalla2: ViewControllerVer = segue.destination as! ViewControllerVer
            pantalla2.valorRecibido = arregloNumeros[valorRecibido!]
        }
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
