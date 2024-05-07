//
//  VertificationScreenViewModel.swift
//  FurnitureStore
//
//  Created by Алексей Барлетов on 07.05.2024.
//

import Foundation


 class VertificationScreenViewModel: ObservableObject {
    
    @Published var list: [String] = []
    @Published var  firstTextField = ""
    @Published var seconTextField = ""
    @Published var thirdTextField = ""
    @Published var fourthetxtField = ""
    
    func configurRandoNumber() {
        let randomProperty = String(Int.random(in: 1000..<9999))
        var listFirst: [String] = []
        
        
        for element in randomProperty {
            listFirst.append(String(element))
        }
        list = listFirst
    }
    
    func equalizeNumber() {
        firstTextField = list[0]
        seconTextField = list[1]
        thirdTextField = list[2]
        fourthetxtField = list[3]
        
    }
}
