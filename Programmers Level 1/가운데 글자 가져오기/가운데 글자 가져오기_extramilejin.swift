// 2021.01.16 extramilejin

func solution(_ s:String) -> String {
   
    if s.count % 2 == 1 {
        let index = s.index(s.startIndex, offsetBy: s.count/2)
        return String(s[index])
    }
    
    else {
        let startIdx = s.index(s.startIndex, offsetBy: s.count / 2 - 1)
        let endIdx = s.index(s.startIndex, offsetBy: s.count  / 2 + 1)
        return String(s[startIdx..<endIdx])
    }
}
