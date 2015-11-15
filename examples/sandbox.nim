## :Author: Ivan Kokhan
##
## This module demonstrate how use RNS for the Nim programming language.

import bigints, resnsnim

type
  Modules = array[3, int]
  RNSnumb = array[3, BigInt]

when isMainModule:
  var
    test0: BigInt  = initBigInt(25)

    a: BigInt  = initBigInt(9)
    b: BigInt  = initBigInt(14)

    c: BigInt  = initBigInt(4)
    d: BigInt  = initBigInt(5)

    basis1: Modules = [2, 3, 5]
    basis2: Modules = [2, 3, 5]

    numb1: RNSnumb = toRNS(a, basis1)
    numb2: RNSnumb = toRNS(b, basis1)

    numb3: RNSnumb = toRNS(c, basis2)
    numb4: RNSnumb = toRNS(d, basis2)

  echo "---------------------------------------------------"
  echo " Test application for resnsnim library.            "
  echo "---------------------------------------------------"
  echo "  A = ", toString(a), " in RNS = ", toString(numb1)
  echo "  B = ", toString(b), " in RNS = ", toString(numb2)
  echo "  The addition of A and B = ", toString(RNSadd(numb1, numb2, basis1))
  echo "---------------------------------------------------"
  echo "  C = ", toString(c), " in RNS = ", toString(numb3)
  echo "  D = ", toString(d), " in RNS = ", toString(numb4)
  echo "  The multiplication of C and D = ", toString(RNSmult(numb3, numb4, basis2))
  echo "---------------------------------------------------"




