//
//  CoinInfo.swift
//  nanoApi
//
//  Created by Sarah dos Santos Silva on 12/02/23.
//

import SwiftUI

struct CoinInfo: View {
    var body: some View {
    
        VStack{
            Spacer()
            Image(systemName: "dollarsign.circle")
                .resizable()
                .frame(width: 190, height: 190)
            Text("Bitcoin")
                .font(.system(size: 45))
                .fontWeight(.semibold)
            Spacer()
            
            VStack(spacing: 15){
                Text("* Lorem ipsum dolor sit amet")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
                Text("* Lorem ipsum dolor sit amet")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
                Text("* Lorem ipsum dolor sit amet")
                    .font(.system(size: 20))
                    .fontWeight(.regular)
            }
            
            Spacer()
        }.padding(.all)
        
    }
}

struct CoinInfo_Previews: PreviewProvider {
    static var previews: some View {
        CoinInfo()
    }
}
