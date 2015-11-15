## :Author: Ivan Kokhan
##
## This module implements the residue numeral system for the Nim programming language.

import bigints

const
  basisLen: int = 3

type
  Modules = array[basisLen, int]
  RNSnumb = array[basisLen, BigInt]

proc toRNS*(number: BigInt, basis: Modules): RNSnumb =
  for i in low(basis)..high(basis):
    let basisElement = initBigInt(basis[i])
    result[i] = number mod basisElement

proc toString*(rnsnumb: RNSnumb): string =
  result = "("

  for i in low(rnsnumb)..high(rnsnumb):
    result.add(toString(rnsnumb[i]))
    if i != high(rnsnumb): result.add(",")

  result.add(")")

proc RNSadd*(rnsnumb1: RNSnumb, rnsnumb2: RNSnumb, basis: Modules): RNSnumb =
  if (len(rnsnumb1) == len(rnsnumb2)):
    for i in low(basis)..high(basis):
      let summa: BigInt = rnsnumb1[i] + rnsnumb2[i]
      let basis: BigInt = initBigInt(basis[i])

      if summa < basis: 
        result[i] = summa
      else: 
        result[i] = summa mod basis

proc RNSmult*(rnsnumb1: RNSnumb, rnsnumb2: RNSnumb, basis: Modules): RNSnumb =
  for i in low(basis)..high(basis):
    let multp: BigInt = rnsnumb1[i] * rnsnumb2[i]
    let basis: BigInt = initBigInt(basis[i])

    if multp < basis: 
      result[i] = multp
    else: 
      result[i] = multp mod basis

proc BasisMAX*(basis: Modules): int =
  result = 1
  for i in low(basis)..high(basis):
    result = result * basis[i]

when isMainModule:
  var
    test0: BigInt  = initBigInt(25)

    test1: BigInt  = initBigInt(9)
    test2: BigInt  = initBigInt(14)

    test3: BigInt  = initBigInt(4)
    test4: BigInt  = initBigInt(5)

    basis1: Modules = [2, 3, 5]
    basis2: Modules = [2, 3, 5]

    numb1: RNSnumb = toRNS(test1, basis1)
    numb2: RNSnumb = toRNS(test2, basis1)

    numb3: RNSnumb = toRNS(test3, basis2)
    numb4: RNSnumb = toRNS(test4, basis2)

  echo toString(RNSadd(numb1, numb2, basis1))
  echo toString(RNSmult(numb3, numb4, basis2))




