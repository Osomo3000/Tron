from tronpy import Tron
from tronpy.keys import PrivateKey

client = Tron(network='shasta')

contract = client.get_contract("TDMQL3CEzHRyJf9cbo32YztJgq2Z1RsAd2")
priv_key = PrivateKey(bytes.fromhex("9d8cea9d31843b6a159cc3b0715cc825a3cf1ea209104d0f18e26db86cd65136"))

txn = (
         contract.functions.addDrink('Coca Cola','0.5 L','2 EUR')
         .with_owner('TYyA9fwo9x81hBaK6nfKWoARyYTq4r8NzU')  # address of the private key
         .fee_limit(10000000000)
         .build()
         .sign(priv_key)
)

txn.broadcast().result()

getList = contract.functions.getDrinkList(14)
print(getList)





