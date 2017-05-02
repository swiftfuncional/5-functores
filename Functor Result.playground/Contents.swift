enum Result<S, E> {
	case Success(_: S)
	case Failure(_: E)
}