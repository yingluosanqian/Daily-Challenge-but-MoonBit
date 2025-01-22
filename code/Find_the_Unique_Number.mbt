fn solution(cards : Array[Int]) -> Int {
  cards.fold(init=0, fn(result : Int, ele : Int) { result ^ ele })
}
