//
//  ItemDetailsVC.swift
//  Dreamer
//
//  Created by Stanislav Cherkasov on 23.08.17.
//  Copyright © 2017 Stanislav Cherkasov. All rights reserved.
//

import UIKit
import CoreData

class ItemDetailsVC: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var priceField: UITextField!
    @IBOutlet weak var detailsField: UITextField!
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        /*
        let store = Store(context: context)
        store.name = "Ocean Plasa"
        let store1 = Store(context: context)
        store1.name = "Dream Town"
        let store2 = Store(context: context)
        store2.name = "Lavina Mall"
        let store3 = Store(context: context)
        store3.name = "Guliver"
        let store4 = Store(context: context)
        store4.name = "Prospect"
        let store5 = Store(context: context)
        store5.name = "Apple Store"
        let store6 = Store(context: context)
        store6.name = "Mandarin Plasa"
        let store7 = Store(context: context)
        store7.name = "Armani"
        
        ad.saveContext() */
        getStores()
    }
    
    //hide keyboar
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleField.resignFirstResponder()
        priceField.resignFirstResponder()
        detailsField.resignFirstResponder()
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //update when selected
    }
    
    func getStores() {
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do{
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
        }
        
        catch {
            //handle the error
        }
    }

}
