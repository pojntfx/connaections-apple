// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: connections.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

public struct Connaections_Connection {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  public var srcIp: String = String()

  public var srcPort: String = String()

  public var srcCountry: String = String()

  public var dstIp: String = String()

  public var dstPort: String = String()

  public var dstCountry: String = String()

  public var unknownFields = SwiftProtobuf.UnknownStorage()

  public init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "connaections"

extension Connaections_Connection: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  public static let protoMessageName: String = _protobuf_package + ".Connection"
  public static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "srcIP"),
    2: .same(proto: "srcPort"),
    3: .same(proto: "srcCountry"),
    4: .same(proto: "dstIP"),
    5: .same(proto: "dstPort"),
    6: .same(proto: "dstCountry"),
  ]

  public mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      switch fieldNumber {
      case 1: try decoder.decodeSingularStringField(value: &self.srcIp)
      case 2: try decoder.decodeSingularStringField(value: &self.srcPort)
      case 3: try decoder.decodeSingularStringField(value: &self.srcCountry)
      case 4: try decoder.decodeSingularStringField(value: &self.dstIp)
      case 5: try decoder.decodeSingularStringField(value: &self.dstPort)
      case 6: try decoder.decodeSingularStringField(value: &self.dstCountry)
      default: break
      }
    }
  }

  public func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.srcIp.isEmpty {
      try visitor.visitSingularStringField(value: self.srcIp, fieldNumber: 1)
    }
    if !self.srcPort.isEmpty {
      try visitor.visitSingularStringField(value: self.srcPort, fieldNumber: 2)
    }
    if !self.srcCountry.isEmpty {
      try visitor.visitSingularStringField(value: self.srcCountry, fieldNumber: 3)
    }
    if !self.dstIp.isEmpty {
      try visitor.visitSingularStringField(value: self.dstIp, fieldNumber: 4)
    }
    if !self.dstPort.isEmpty {
      try visitor.visitSingularStringField(value: self.dstPort, fieldNumber: 5)
    }
    if !self.dstCountry.isEmpty {
      try visitor.visitSingularStringField(value: self.dstCountry, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  public static func ==(lhs: Connaections_Connection, rhs: Connaections_Connection) -> Bool {
    if lhs.srcIp != rhs.srcIp {return false}
    if lhs.srcPort != rhs.srcPort {return false}
    if lhs.srcCountry != rhs.srcCountry {return false}
    if lhs.dstIp != rhs.dstIp {return false}
    if lhs.dstPort != rhs.dstPort {return false}
    if lhs.dstCountry != rhs.dstCountry {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}