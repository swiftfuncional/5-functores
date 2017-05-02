infix operator |>: AdditionPrecedence

func |> <T, U, V>(first: @escaping (T) -> U, second: @escaping (U) -> V) -> (T) -> V {
	return {
		second(first($0))
	}
}

