//
//  ViewControllerVer.swift
//  TableViewController
//
//  Created by Beatriz Coaquira Alcca on 29/04/25.
//

import UIKit

class ViewControllerVer: UIViewController {

    @IBOutlet weak var descripcionRecibida: UILabel!
    @IBOutlet weak var nombreRecibido: UILabel!
    @IBOutlet weak var imagenRecibido: UIImageView!
    
    var valorRecibido: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
                if let valorRecibido = valorRecibido {
                    nombreRecibido.text = valorRecibido
                    imagenRecibido.image = UIImage(named: "ICONOS/\(valorRecibido).jpeg")
                }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
