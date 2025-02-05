
// MARK: - Network Service
final class NetworkService {
    static let shared = NetworkService()
    private let baseURL = "https://your-api-base-url.com"
    private var activeTasks: [URLSessionTask] = []
    private let authToken: String? = "your-auth-token" // Replace with actual token or fetch from keychain
    
    private init() {}
    
    // MARK: - Request Method
    func request<T: Decodable>(_ request: RequestProtocol) async throws -> T {
        guard let url = URL(string: baseURL + request.path) else {
            throw NetworkError.invalidURL
        }
        
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
        
        // Add query parameters for GET requests
        if request.method == .get, let parameters = request.parameters {
            urlComponents?.queryItems = parameters.map {
                URLQueryItem(name: $0.key, value: "\($0.value)")
            }
        }
        
        guard let finalURL = urlComponents?.url else {
            throw NetworkError.invalidURL
        }
        
        var urlRequest = URLRequest(url: finalURL)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.timeoutInterval = request.timeoutInterval
        urlRequest.cachePolicy = request.cachePolicy
        
        // Add headers
        urlRequest.setValue(request.contentType.rawValue, forHTTPHeaderField: "Content-Type")
        request.headers?.forEach { key, value in
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        
        // Add authentication token if required
        if request.requiresAuthentication, let authToken = authToken {
            urlRequest.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }
        
        // Add body for non-GET requests
        if request.method != .get, let body = request.body {
            switch request.contentType {
            case .json:
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
            case .formData:
                let boundary = UUID().uuidString
                urlRequest.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
                urlRequest.httpBody = createMultipartFormData(body: body, boundary: boundary)
            case .urlEncoded:
                urlRequest.httpBody = body.map { "\($0.key)=\($0.value)" }
                    .joined(separator: "&")
                    .data(using: .utf8)
            }
        }
        
        // Show network activity indicator
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = true
        }
        
        // Retry mechanism
        var retryCount = request.retryCount
        var lastError: Error?
        
        repeat {
            do {
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
                // Hide network activity indicator
                DispatchQueue.main.async {
                    UIApplication.shared.isNetworkActivityIndicatorVisible = false
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    throw NetworkError.unknownError(NSError(domain: "Invalid response", code: 0))
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    if httpResponse.statusCode == 401 {
                        throw NetworkError.authenticationFailed
                    } else {
                        throw NetworkError.serverError(statusCode: httpResponse.statusCode)
                    }
                }
                
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    return decodedData
                } catch {
                    throw NetworkError.decodingError(error)
                }
            } catch let error as NetworkError {
                lastError = error
                retryCount -= 1
            } catch {
                lastError = error
                retryCount -= 1
            }
        } while retryCount > 0
        
        // Hide network activity indicator
        DispatchQueue.main.async {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
        }
        
        throw lastError ?? NetworkError.unknownError(NSError(domain: "Unknown error", code: 0))
    }
    
    // MARK: - Multipart Form Data
    private func createMultipartFormData(body: [String: Any], boundary: String) -> Data {
        var bodyData = Data()
        
        for (key, value) in body {
            bodyData.append("--\(boundary)\r\n".data(using: .utf8)!)
            bodyData.append("Content-Disposition: form-data; name=\"\(key)\"\r\n\r\n".data(using: .utf8)!)
            bodyData.append("\(value)\r\n".data(using: .utf8)!)
        }
        
        bodyData.append("--\(boundary)--\r\n".data(using: .utf8)!)
        return bodyData
    }
    
    // MARK: - Cancel All Requests
    func cancelAllRequests() {
        activeTasks.forEach { $0.cancel() }
        activeTasks.removeAll()
    }
}