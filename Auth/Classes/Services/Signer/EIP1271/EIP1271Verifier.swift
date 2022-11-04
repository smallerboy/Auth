import Foundation
import JSONRPC
import WalletConnectNetworking
import WalletConnectUtils

actor EIP1271Verifier {
    private let projectId: String
    private let httpClient: HTTPClient

    init(projectId: String, httpClient: HTTPClient) {
        self.projectId = projectId
        self.httpClient = httpClient
    }

    func verify(signature: Data, message: Data, address: String, chainId: String) async throws {
        let encoder = ValidSignatureMethod(signature: signature, messageHash: message.keccak256)
        let call = EthCall(to: address, data: encoder.encode())
        let params = AnyCodable([AnyCodable(call), AnyCodable("latest")])
        let request = RPCRequest(method: "eth_call", params: params)
        let data = try JSONEncoder().encode(request)
        let httpService = RPCService(data: data, projectId: projectId, chainId: chainId)
        let response = try await httpClient.request(RPCResponse.self, at: httpService)
        try validateResponse(response)
    }

    private func validateResponse(_ response: RPCResponse) throws {
        guard
            let result = try response.result?.get(String.self),
            result.starts(with: ValidSignatureMethod.methodHash)
        else { throw Errors.invalidSignature }
    }
}

extension EIP1271Verifier {

    enum Errors: Error {
        case invalidSignature
    }

    struct EthCall: Codable {
        let to: String
        let data: String
    }
}
