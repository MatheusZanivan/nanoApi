//
//  ContentView.swift
//  nanoApi
//
//  Created by Matheus Zanivan on 01/02/23.
//

import SwiftUI

class UserProgress: ObservableObject {
    
    @Published var number: Int
    @State var teste: Int?
    
    init(number: Int) {
        self.number = number
    }
}

struct ContentView: View {
    
    @State private var selectCoin = false
    
    @StateObject var modelo = UserProgress.init(number: Int())
    
    
    var body: some View {
        
        NavigationView{
            
            //MARK: VStack principal
            VStack{
                Spacer()
                    .frame(height: 20)
                HStack(spacing: 45){
                    
                    //MARK: vstack do primeiro
                    VStack(spacing: 20){
                        Button {
                            print("Botão dinheiro 1 apertado")
                            selectCoin = true
                        } label: {
                            Image(systemName: "dollarsign.circle")
                                .resizable()
                                .frame(width: 90, height: 90 )
                                .foregroundColor(Color.black)
                        }
                        .sheet(isPresented: $selectCoin) {
                            CoinListBottonSheetView()
                                .presentationDetents([.medium, .large])
                        }
                        Text("Moeda")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        TextField("", value: $modelo.number, formatter: NumberFormatter())
                            .textFieldStyle(OvalTextFieldStyle())
                            .keyboardType(.decimalPad)
                        
                    }
                    
                    Button {
                        print("Botão seta 1 apertado")
                        
                    } label: {
                        Image(systemName: "arrow.left.arrow.right")
                            .resizable()
                            .frame(width: 50, height: 50 )
                            .foregroundColor(Color.blue)
                    }.buttonStyle(.bordered)
                    
                    //MARK: vstack do segundo botão
                    VStack(spacing: 20){
                        
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .frame(width: 90, height: 90 )
                            .foregroundColor(Color.black)
                        Text("Moeda")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("\(modelo.number * 2)") //efetuando a conta
                            .font(.body)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                    }
                }
                Spacer()
                    .frame(height: 500)
            }.toolbar(){
                ToolbarItem(placement: .automatic){
                    NavigationLink(destination: CoinListView(), label: {
                        Image(systemName: "dollarsign.circle")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color.blue)

                    })
                }
            }
            .padding()
        }.navigationTitle("Conversão")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//MARK: ESTILO DA TEXTFIELD
struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            .background(LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(20)
            .shadow(color: .gray, radius: 10)
    }
}
