import Foundation

enum Optional<T> {
	case None
	case Some(_: T)
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

func parse(json: String) -> Account {
	let dict = try! JSONSerialization.jsonObject(with: json.data(using: .utf8)!) as! [String: Any]

	return Account(name: dict["name"] as! String,
	               accountType: dict["accountType"] as! String,
	               email: dict["email"] as! String,
	               url: dict["url"] as! String)
}

func show(account: Account) {
	print(account)
}

show(account: parse(json: configuration))