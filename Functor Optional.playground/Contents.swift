import Foundation

enum Optional<T> {
	case None
	case Some(_: T)

	func map<S>(_ transform: (T) -> (S)) -> Optional<S> {
		switch self {
		case .None:
			return .None
		case let .Some(t):
			return .Some(transform(t))
		}
	}
}

let configuration = "{" +
	"\"name\":\"Alex\"," +
	"\"accountType\":\"Premium\"," +
	"\"email\":\"alex@swiftfuncional.com\"," +
	"\"url\":\"www.swiftfuncional.com\"," +
"}"

struct Account {
	let name: String
	let accountType: String
	let email: String
	let url: String
}

func parse(json: String) -> Optional<Account> {
	guard let data = json.data(using: .utf8),
		let dict = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
		let name = dict?["name"] as? String,
		let accountType = dict?["accountType"] as? String,
		let email = dict?["email"] as? String,
		let url = dict?["url"] as? String else {

			return .None
	}

	return .Some(Account(name: name, accountType: accountType, email: email, url: url))
}

func show(account: Account) {
	print(account)
}

parse(json: configuration).map(show)
