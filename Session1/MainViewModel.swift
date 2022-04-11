//
//  MainViewModel.swift
//  Session1
//
//  Created by PC1 on 11.04.22.
//

import Foundation

class MainViewModel{
    
    private var instance = SingleStruct.shared
    
    func getCount() -> Int{
        instance.getCount()
    }
    
    func increase(){
        instance.inc()
    }
    
    func decrase(){
        instance.dec()
    }
    
    func add(_ par1 : Int){
        instance.add(par1)
    }
    

}
