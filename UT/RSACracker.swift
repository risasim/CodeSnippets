import Foundation

class RSA{
    static func crack(_ n:Int,_ e:Int,_ C:Int)->Int{
        let factors:(Int, Int) = primeFactorisation(n)
        // size of the phi group
        let r = (factors.0 - 1)*(factors.1 - 1)
        let mulInvs = modInverse(e, r)
        return modularExponantiation(C, mulInvs, n)
    }

    static func modularExponantiation(_ C:Int, _ mulInvs:Int, _ n:Int)->Int{
        var res = 1
        var argX = C
        var argN = mulInvs
        while argN >= 1 {
            if argN%2 == 1{
                res = (res * argX) % n
                argN-=1
            }else{
                argX = (argX*argX) % n
                argN = Int(argN/2)
            }
        }
        return res
    }

    private static func modInverse(_ a:Int,_ mod:Int)->Int{
        for i in 1..<mod{
            if (((a%mod)*(i%mod)) % mod == 1){
                return i
            }
        }
        return -1
    }

    private static func primeFactorisation(_ n:Int)->(Int, Int){
        for i in 2..<n{
            for j in 2..<n{
                if i*j == n{
                    return (i, j)
                }
            }
        }
        return (0,0)
    }
}



print(RSA.crack(91,11,3))
print(RSA.crack(55,3,9))