fn solution(k : Int, data : Array[Int]) -> Int {
  fn upd(a: Int, b: Int) {
    if a == -1 {
      b
    } else if a < b {
      a
    } else {
      b
    }
  }

  let n = data.length()
  let mut dp = Array::makei(k, fn (i) {
    if i == 0 {
      0
    } else {
      -1
    }
  })
  for i = 0; i < n; i = i + 1 {
    let ndp = Array::make(k, -1)
    for j = 0; j < k; j = j + 1 {
      if j + 1 < k {
        ndp[j] = dp[j + 1]
      }
      if dp[j] != -1 {
        ndp[j] = upd(ndp[j], dp[j] + data[i])
      }
      if j > 0 && ndp[j - 1] != -1 {
        ndp[j] = upd(ndp[j], ndp[j - 1] + data[i])
      } 
    }
    dp = ndp
  }
  dp[0]
}