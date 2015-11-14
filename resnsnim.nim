## :Author: Ivan Kokhan
##
## This module implements the residue numeral system for the Nim programming language.

import bigints

type
  Modules = array[3, int]
  RNSnumb = array[3, BigInt]

proc toRNS(number: BigInt, basis: Modules): RNSnumb =
  for i in low(basis)..high(basis):
    let basisElement = initBigInt(basis[i])
    result[i] = number mod basisElement

proc toString(rnsnumb: RNSnumb): string =
  result.add("(")

  for i in low(rnsnumb)..high(rnsnumb):
    result.add($rnsnumb[i])

    if i != high(rnsnumb):
      result.add(",")

  result.add(")")

when isMainModule:
  var
    test: BigInt  = initBigInt(25)
    mods: Modules = [3, 5, 7]
    resl: RNSnumb = toRNS(test, mods)

  echo toString(resl)




