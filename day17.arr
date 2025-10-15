use context dcic2024

var dta = [list: 1, 2, 3]
var position = 0
fun advance() -> Number block:
  result = dta.get(position)
  position := position + 1
  when position >= dta.length() block:
    position := 0
    dta := [list: 0] + dta
  end
  result
end
fun process-data() -> Number block:
  first = advance()
  second = advance()
  first + second
end

process-data()
process-data()
process-data()


var multiplier = 1
var base = 5
fun update-multiplier(n :: Number) -> Number block:
  multiplier := multiplier + n
  when num-modulo(multiplier, 3) == 0 block:
    base := base - 1
    multiplier := 1
  end
  multiplier
end
fun calculate(x :: Number) -> Number block:
  update-multiplier(x)
  (x * multiplier) + base
end

calculate(2)
calculate(1)
calculate(4)
calculate(2)

