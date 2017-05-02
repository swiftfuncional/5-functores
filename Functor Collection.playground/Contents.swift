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