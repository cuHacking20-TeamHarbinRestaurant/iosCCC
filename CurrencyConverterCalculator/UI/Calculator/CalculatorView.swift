//
//  ContentView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 04/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//
import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject var viewModel: EnviromentViewModel
    @State var input = ""
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                BarView()
                
                if viewModel.isLoading {
                    IndicatorView()
                }
                
                List (viewModel.getFilteredList(), id: \.value) { currency in
                    CalculatorItemView(item: currency)
                }
                
                KeyboardView(input: $input)
                
            }
            .navigationBarTitle(input)
            .navigationBarItems(
                trailing: NavigationLink(destination: SettingsView(viewModel: EnviromentViewModel())) {
                    Text("Settings")
                }
            )
            
        }
        .onAppear { self.viewModel.fetchRates() }
        
    }
}

#if DEBUG
struct CalculatorViewCalculatorViewPreviews: PreviewProvider {
    static var previews: some View {
        CalculatorView().environmentObject(EnviromentViewModel())
    }
}
#endif
