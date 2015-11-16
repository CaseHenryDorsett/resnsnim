## :Author: Ivan Kokhan
##
## This module implements the Residue Numeral System using the Nim programming 
## language.

import bigints

const
  basisLenght: int = 3

type
  Modules = array[basisLenght, int]
  RnsNumb = array[basisLenght, BigInt]

proc toRns*(number: BigInt, basis: Modules): RnsNumb =
  ## This procedure take big integer number and transform it to number in RNS
  ## For transform using basis.
  for i in low(basis)..high(basis):
    let basisElement = initBigInt(basis[i])
    result[i] = number mod basisElement

proc toString*(rnsNumb: RnsNumb): string =
  ## This procedure transform number from RNS to string. String no print in this
  ## procedure, but return in result variable. In this procedure result variable
  ## does not belonge to simple type and need initialization in start.
  result = "("

  for i in low(rnsNumb)..high(rnsNumb):
    result.add(toString(rnsNumb[i]))
    if i != high(rnsNumb): result.add(",")

  result.add(")")

proc addRns*(rnsNumb1: RnsNumb, rnsNumb2: RnsNumb, basis: Modules): RnsNumb =
  ## This procedure is implementing the addition of two RNS numbers.
  for i in low(basis)..high(basis):
    let summa: BigInt = rnsNumb1[i] + rnsNumb2[i]
    let basis: BigInt = initBigInt(basis[i])

    if summa < basis: result[i] = summa
    else: result[i] = summa mod basis

proc mulRns*(rnsNumb1: RnsNumb, rnsNumb2: RnsNumb, basis: Modules): RnsNumb =
  ## This procedure is implementing the multiplication of two RNS numbers.
  for i in low(basis)..high(basis):
    let multp: BigInt = rnsNumb1[i] * rnsNumb2[i]
    let basis: BigInt = initBigInt(basis[i])

    if multp < basis: result[i] = multp
    else: result[i] = multp mod basis

proc basMax*(basis: Modules): int =
  ## This procedure search and return maximum number, which may be represented
  ## using a given basis.
  for i in low(basis)..high(basis):
    result = result * basis[i]

when isMainModule:
  var
    test0: BigInt = initBigInt(25)

    test1: BigInt = initBigInt(9)
    test2: BigInt = initBigInt(14)

    test3: BigInt = initBigInt(4)
    test4: BigInt = initBigInt(5)

    basis1: Modules = [2, 3, 5]
    basis2: Modules = [2, 3, 5]

    numb1: RnsNumb = toRns(test1, basis1)
    numb2: RnsNumb = toRns(test2, basis1)

    numb3: RnsNumb = toRns(test3, basis2)
    numb4: RnsNumb = toRns(test4, basis2)

  echo toString(addRns(numb1, numb2, basis1))
  echo toString(mulRns(numb3, numb4, basis2))




