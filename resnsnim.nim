## :Author: Ivan Kokhan
##
## This module implements the residue numeral system for the Nim programming language.

import bigints

type
  Modules = array[3, int]
  RNSnumb = array[3, BigInt]

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
      let summa: BigInt = rnsnumb1[i] + rnsnumb1[i]
      let basis: BigInt = initBigInt(basis[i])

      echo toString(summa)

      if summa < basis: 
        result[i] = summa
      else: 
        result[i] = summa mod basis

      #echo toString(result[i])

proc RNSmult*(rnsnumb1: RNSnumb, rnsnumb2: RNSnumb, basis: Modules): RNSnumb =
  for i in low(basis)..high(basis):
    result[i] = ((rnsnumb1[i] * rnsnumb1[i]) mod initBigInt(basis[i]))

when isMainModule:
  var
    test0: BigInt  = initBigInt(25)
    test1: BigInt  = initBigInt(9)
    test2: BigInt  = initBigInt(14)

    modls: Modules = [2, 3, 5]

    numb1: RNSnumb = toRNS(test1, modls)
    numb2: RNSnumb = toRNS(test2, modls)

  echo toString(RNSadd(numb1, numb2, modls))




