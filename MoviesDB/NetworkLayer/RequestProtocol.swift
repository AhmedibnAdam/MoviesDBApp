// MARK: - Request Protocol
protocol RequestProtocol {
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
    var parameters: [String: Any]? { get }
    var body: [String: Any]? { get }
    var contentType: ContentType { get }
    var timeoutInterval: TimeInterval { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var retryCount: Int { get }
    var requiresAuthentication: Bool { get }
}