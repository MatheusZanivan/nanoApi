//
//  ContentView.swift
//  nanoApi
//
//  Created by Matheus Zanivan on 01/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tf: String = "" //teste
    @State private var teste = "0" //TESTE10
    @State private var selectCoin = false
    
    
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
                            Text("ABRIU A BOTTOM SHEET")
                                .presentationDetents([.medium, .large])
                        }
                        Text("Moeda")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        TextField("0", text: $tf)
                            .textFieldStyle(OvalTextFieldStyle())
                    }
                    
                    Button {
                        print("Botão seta 1 apertado")
                        teste = tf //TESTE
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
     
                        Text(teste)
                            .font(.body)
                            .fontWeight(.medium)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)

                    }
                }
                Spacer()
            }.toolbar(){
                ToolbarItem(placement: .automatic){
                    Image(systemName: "dollarsign.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.blue)
                        .onTapGesture {
                            print("moedas")
                        }
                }
            }
            .navigationTitle("Conversão")
            .padding()
            
        }
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
