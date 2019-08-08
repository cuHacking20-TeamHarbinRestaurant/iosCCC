//
//  ContentView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 04/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject
    private(set) var viewModel: MainViewModel
    
    @State
    var input = ""
    
    var body: some View {
        
        VStack {
            BarView(input: $input, output: $viewModel.output)
            
            List(1..<20) { _ in
                ItemView()
            }
            
            KeyboardView(input: self.$input)
        }.edgesIgnoringSafeArea(.all)
        
    }
}

#if DEBUG
struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}
#endif
