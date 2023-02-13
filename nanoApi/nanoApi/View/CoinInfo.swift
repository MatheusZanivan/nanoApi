//
//  CoinInfo.swift
//  nanoApi
//
//  Created by Sarah dos Santos Silva on 12/02/23.
//

import SwiftUI

struct CoinInfo: View {
    
    @State var coin: CoinModel
    
    
    var body: some View {
        
        VStack{
            Spacer()
            AsyncImage(url: URL(string: coin.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                Color.gray
            }
//            .frame(width: 30, height: 30)
            .frame(width: 190, height: 190)
            .padding()
            Text(coin.name)
                .font(.system(size: 45))
                .fontWeight(.semibold)
            Spacer()
                .frame(height: 100)
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
                .frame(height: 200)
        }.padding(.all)
        
    }
}

//struct CoinInfo_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinInfo()
//    }
//}
