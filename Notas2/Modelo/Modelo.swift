//
//  Modelo.swift
//  Notas2
//
//  Created by Luis Donaldo Galloso Tapia on 23/01/23.
//

import Foundation
import CoreData // una tipo base dde datos interna
import UIKit

class Modelo{
    
    public static let shared = Modelo() //para poder comprartir lo que estamos haciendo
    
    // conexión del contexto
    func contexto () ->NSManagedObjectContext {  // lo que necesitamos para poder conectar con la base de datos
        let delegate = UIApplication.shared.delegate as! AppDelegate
        return delegate.persistentContainer.viewContext
    }
    
    func saveData(titulo:String, nota: String, fecha: Date){ // recibir todos los campos que tenemos en nuestra vista
        let context = contexto()
        let entityNotas = NSEntityDescription.insertNewObject(forEntityName: "Notas", into: context) as! Notas
        entityNotas.titulo = titulo
        entityNotas.nota = nota
        entityNotas.fecha = fecha
        
        do{
            try context.save()
            print("Se ha guardado correctamente")
        }catch let error as NSError{
            print("No guardó ", error.localizedDescription)
        }
    }

    func editData(titulo:String, nota: String, fecha: Date, notas : Notas){ // recibir todos los campos que tenemos en nuestra vista
        let context = contexto()
        notas.setValue(titulo, forKey: "titulo")
        notas.setValue(nota, forKey: "nota")
        notas.setValue(fecha, forKey: "fecha")
        
        
        do{
            try context.save()
            print("Edito")
        }catch let error as NSError{
            print("No editó", error.localizedDescription)
        }
    }
}
