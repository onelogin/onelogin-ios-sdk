import XCTest
import RxSwift
import OneLoginSDKiOS

/// Checks that the package works when consumed through SwiftPM. Nothing here makes a
/// network request.
final class SwiftPMIntegrationTests: XCTestCase {
    /// Loads the framework and runs SDK code. With no credentials saved, `genrateToken`
    /// fails before it makes any request.
    func testGenerateTokenWithoutCredentialsFails() {
        var calledBack = false
        OneLoginSDK.shared.genrateToken { success, token, error in
            calledBack = true
            XCTAssertFalse(success)
            XCTAssertNil(token)
            guard case .clientIdNotFound? = error else {
                return XCTFail("expected clientIdNotFound, got \(String(describing: error))")
            }
        }
        XCTAssertTrue(calledBack)
    }

    /// The SDK returns Observables from its own copy of RxSwift. They must type-check and
    /// compose with the app's RxSwift. Observables are cold, so no request is made.
    func testObservablesComposeWithAppRxSwift() {
        let token: Observable<GenerateTokenModel> =
            OneLoginApi.generateToken(clientId: "client-id", clientSecret: "client-secret")
        _ = token.map { $0 }
    }
}
