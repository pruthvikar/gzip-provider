import Transport
import GZIP
import Foundation

public final class GzipStream: WriteableStream {
  let mode: GzipMode
  private let processor: GzipProcessor
  let stream: WriteableStream
  public var isClosed: Bool = false

  init(mode: GzipMode, stream: WriteableStream) throws {
    self.mode = mode
    self.processor = mode.processor()
    try self.processor.initialize()
    self.stream = stream
  }

  public func write(max: Int, from buffer: Bytes) throws -> Int {
    let data = try processor.process(data: Data(buffer), isLast: false)
    return try stream.write(data.makeBytes())
  }

  public func setTimeout(_ timeout: Double) throws {
    try stream.setTimeout(timeout)
  }

  public func close() throws {
    processor.close()
    try stream.close()
    isClosed = true
  }
}
