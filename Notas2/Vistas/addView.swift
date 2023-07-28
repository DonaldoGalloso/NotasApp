//
//  addView.swift
//  Notas2
//
//  Created by Luis Donaldo Galloso Tapia on 23/01/23.
//

import UIKit

class addView: UIViewController {

    @IBOutlet weak var fecha: UIDatePicker!
    @IBOutlet weak var nota: UITextView!
    @IBOutlet weak var boton: UIButton!
    @IBOutlet weak var titulo: UITextField!//asegura los datos o en este caso los widgets
    
    var notas : Notas? // no asegura que enviemos datos
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = notas != nil ? "Editar Nota": "Crer Nota" // si la variable notas viene nulo significa que va a crear una nota
        // si no viene nulo significa que esta  editando una nota
        // Do any additional setup after loading the view.
        titulo.text = notas?.titulo
        nota.text = notas?.nota
        fecha.date = notas?.fecha ?? Date() // así marcamos un opcionar
        if notas == nil {
            validarText()
        }else{
            boton.backgroundColor = .systemTeal
            validarText2()
        }
        
        
    }
    
    @IBAction func guardar(_ sender: UIButton) {// traer los datos
        if notas != nil {
            Modelo.shared.editData(titulo: titulo.text ?? "", nota: nota.text, fecha: fecha.date,notas: notas!)
            navigationController?.popViewController(animated: true)
        }else{
            Modelo.shared.saveData(titulo: titulo.text ?? "", nota: nota.text, fecha: fecha.date)
            navigationController?.popViewController(animated: true)
        }
       
    }
    
    func validarText(){
        boton.isEnabled = false
        boton.backgroundColor = .systemGray2
        titulo.addTarget(self, action: #selector(validarTextField), for: .editingChanged)
    }
    
    func validarText2(){
        titulo.addTarget(self, action: #selector(validarTextField), for: .editingChanged)
    }
    
    @objc func validarTextField(sender: UITextView){ // recibimos el textfield
        guard let titulo2 = titulo.text, !titulo2.isEmpty else{
            boton.isEnabled = false
            boton.backgroundColor = .systemGray2
            return
        }
        boton.isEnabled = true
        boton.backgroundColor = .systemTeal
    }
    
   

    

}
