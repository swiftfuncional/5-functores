enum Optional<T> {
	case None
	case Some(_: T)
}

class TextField {
	let text: Optional<String> = .None
}

func send(_ username: String) {
	//Logic to send username
}

func sendUserNameOrAlert(textField: TextField) {
	switch textField.text {
	case .None:
		print("ERROR: TextField empty")
	case let .Some(username):
		send(username)
	}
}