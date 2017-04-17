enum Optional<T> {
	case None
	case Some(_: T)
}

class TextField {
	let text: Optional<String> = .None
}