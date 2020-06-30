//
//  ContentView.swift
//  Connaections
//
//  Created by Felicitas Pojtinger on 28.06.20.
//  Copyright © 2020 Felicitas Pojtinger. All rights reserved.
//

import SwiftUI
import GRPC
import NIO
import SwiftProtobuf
import CombineGRPC
import Combine

struct Connection : Identifiable {
    var id = UUID()
    var srcIP: String
    var srcPort: String
    var srcCountry: String
    var dstIP: String
    var dstPort: String
    var dstCountry: String
}

class ConnectionsViewModel : ObservableObject {
    @Published var connections: [Connection] = []
    static var retainedCancellables: Set<AnyCancellable> = []
    
    func addConnection(connection: Connaections_Connection) {
        self.connections.append(Connection(
            srcIP: connection.srcIp,
            srcPort: connection.srcPort,
            srcCountry: connection.srcCountry,
            dstIP: connection.dstIp,
            dstPort: connection.dstPort,
            dstCountry: connection.dstCountry
        ))
    }
    
    func subscribeToConnections(address: String) {
        let eventLoopGroup = PlatformSupport.makeEventLoopGroup(loopCount: 1)
        let channel = ClientConnection
          .insecure(group: eventLoopGroup)
            .connect(host: address.components(separatedBy: ":")[0], port: Int(address.components(separatedBy: ":")[1])!)
        let connectionsService = Connaections_ConnectionsClient(channel: channel)
        
        let grpc = GRPCExecutor()
        grpc.call(connectionsService.subscribe(_:callOptions:handler:))(Google_Protobuf_Empty()).receive(on: RunLoop.main).sink(receiveCompletion: { (status) in
            return
        }) { (connection) in
            if !(connection.srcCountry == "ZZ" || connection.dstCountry == "ZZ") {
                self.addConnection(connection: connection)
            }
        }.store(in: &ConnectionsViewModel.retainedCancellables)
    }
}

struct ContentView: View {
    @ObservedObject var connectionsVM = ConnectionsViewModel()
    
    @State var connaectionsServerAddress = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Configuration")) {
                    TextField("Connaections Server Address", text: $connaectionsServerAddress)
                    
                    Button("Subscribe") {
                        self.connectionsVM.subscribeToConnections(address: self.connaectionsServerAddress)
                    }
                }
                
                Section(header: Text("Connections")) {
                    ForEach(connectionsVM.connections) { connection in
                        HStack {
                            Text(connection.srcIP)
                            Text(connection.srcPort)
                            Text(connection.srcCountry)
                            Text(connection.dstIP)
                            Text(connection.dstPort)
                            Text(connection.dstCountry)
                        }
                    }
                }
            }
            
            .navigationBarTitle("Connaections")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
