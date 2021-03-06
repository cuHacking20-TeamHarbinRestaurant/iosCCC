//
//  KeyboardView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 06/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI

struct KeyboardView: View {
    @Binding
    var input: String
    
    @EnvironmentObject
    var viewModel: EnviromentViewModel
    
    let data = [
        [
            KeyboardItem.seven,
            KeyboardItem.eight,
            KeyboardItem.nine,
            KeyboardItem.multiply
        ],
        [
            KeyboardItem.four,
            KeyboardItem.five,
            KeyboardItem.six,
            KeyboardItem.divide
        ],
        [
            KeyboardItem.one,
            KeyboardItem.two,
            KeyboardItem.three,
            KeyboardItem.minus
        ],
        [
            KeyboardItem.dot,
            KeyboardItem.zero,
            KeyboardItem.percentage,
            KeyboardItem.plus
        ],
        [
            KeyboardItem.tribleZero,
            KeyboardItem.ac,
            KeyboardItem.del
        ]
    ]
    
    var body: some View {
        VStack(alignment: .center) {
            ForEach(data, id: \.self) { items in
                HStack(alignment: .center) {
                    ForEach(items, id: \.self) { item in
                        Button(
                            action: {
                                self.input = item.operateAction(input: self.$input.wrappedValue)
                                self.viewModel.calculateOutput(input: self.input)
                        },
                            label: {
                                Text(item.rawValue)
                                    .font(.title)
                                    .bold()
                                    .frame(
                                        minWidth: 0,
                                        maxWidth: .infinity,
                                        minHeight: 0,
                                        maxHeight: .infinity
                                )
                        }
                        )
                    }
                }
            }
        }
    }
}

#if DEBUG
struct KeyboardViewPreviews: PreviewProvider {
    static var previews: some View {
        KeyboardView(input: .constant("123"))
            .environmentObject(EnviromentViewModel())
            .previewLayout(.fixed(width: 300, height: 500))
    }
}
#endif
