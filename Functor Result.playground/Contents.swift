enum Result<S, E> {
	case Success(_: S)
	case Failure(_: E)

	func map<T>(_ transform: (S) -> T) -> Result<T, E> {
		switch self {
		case let .Failure(reason):
			return .Failure(reason)
		case let .Success(value):
			return .Success(transform(value))
		}
	}
}

infix operator |>: AdditionPrecedence

func |> <T, U, V>(first: @escaping (T) -> U, second: @escaping (U) -> V) -> (T) -> V {
	return {
		second(first($0))
	}
}

func add2(to number: Int) -> Int {
	return number + 2
}

func double(of number: Int) -> Int {
	return number * 2
}

enum Error {
	case MustBeInt
}

func mustBeInt(_ string: String) -> Result<Int, Error> {
	return Int(string).map { .Success($0) } ?? .Failure(.MustBeInt)
}

mustBeInt("10").map(add2)
mustBeInt("5").map(double)
mustBeInt("swift").map(add2)

