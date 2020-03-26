

# address

1. private key : Big Int   32Bytes.   256bit     64(Hex String)
              bigger than 0 and small than FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141   ( secp256k1 used by bitcoin )
               you can just echo -n "some code" | sha256sum to generate one. BUT NOT SAFE!!!  (called Brainwallet) only useful when flee from a country only have a cloth on your back. :)
               or use python random : NOT safe even. because of they not really random.
               or use python secrets secrets.token_hex(32)  , sounds good enough.
               
               paper wallet: not safe, water demange, or lost, or printer log, or they need external service to valid the balance of the private key which can be a fade website.

               
                ## private key to  WIF(wallet imort format)
                1. private key hexstring:  0C28FCA386C7A227600B2FE50B7CAE11EC86D3BF1FBE471BE89827E19D72AA1D
                2. add 0x80 = 800C28FCA386C7A227600B2FE50B7CAE11EC86D3BF1FBE471BE89827E19D72AA1D
                3. add 0x01 at the end of the key will correspond to a compressed public key.
                4. checkSum =  first 4Bytes of SHA256(SHA256(extended key binary data))
                5. new value = 800C28FCA386C7A227600B2FE50B7CAE11EC86D3BF1FBE471BE89827E19D72AA1D + 507A5B8D
                6. Base58（new value) = 5HueCGU8rMjxEXxiPuD5BDku4MkFqeZyd4dZ1jvhTVqvbTLvyTJ
 
 
               
              
 2. secp256k1  ECDSA 
    input: 32Bytes (private key)
    output: 64Bytes( 32Bytes X and 32Bytes Y) = 128(Hex String)  
    
    Public key = "04" + output = 130 HexString
              or   66 HexString (compressed)         ------- (02 when last(Y) is even or 03 last(Y) is odd) + X
    
    
    
    041e7bcc70c72770dbb72fea022e8a6d07f814d2ebe4de9ae3f7af75bf706902a7
      b73ff919898c836396a6b0c96812c3213b99372050853bd1678da0ead14487d7 
    
    031e7bcc70c72770dbb72fea022e8a6d07f814d2ebe4de9ae3f7af75bf706902a7
    
    
    
 3. address , both Sha256 and RIPEMD is hash function.
    3.1   value1 =  RIPEMD-160( SHA256(public key))   = 160 bit = 40 HexString.
                 = 453233600a96384bb8d73d400984117ac84d7e8b
                
     3.2  mainnet :  Value2 = 00+value1 = 00453233600a96384bb8d73d400984117ac84d7e8b
          testnet :  Value2 = 6f+value1 = 6f453233600a96384bb8d73d400984117ac84d7e8b
          
     3.3  CheckSum = first 4 Bytes of sha256(sha256( binary of  value2))
     
     echo -n "00453233600a96384bb8d73d400984117ac84d7e8b" | xxd -r -p | sha256sum -b  =  a0902318b61f705cf36c97dbbb084e12edca6f537efe6ed872801ae541a26065
     echo -n "a0902318b61f705cf36c97dbbb084e12edca6f537efe6ed872801ae541a26065" | xxd -r -p | sha256sum -b  =  512f43c48517a75e58a7ec4c554ecd1a8f9603c891b46325006abf39c5c6b995
     
     first 4 Bytes = 8 HexString = 512f43c4
     
         
     3.4   the address  = Value2 + checkSum  = 00453233600a96384bb8d73d400984117ac84d7e8b512f43c4
     3.5   the address = base58(address) = 17JsmEygbbEUEpvt4PFtYaTeSqfb9ki1F1    
     
     --futher read. Address type.
     P2PKH which begin with the number 1, eg: 1BvBMSEYstWetqTFn5Au4m4GFg7xJaNVN2.
     P2SH type starting with the number 3, eg: 3J98t1WpEZ73CNmQviecrnyiWrnqRhWNLy.
     Bech32 type starting with bc1, eg: bc1qar0srrr7xfkvy5l643lydnw9re59gtzzwf5mdq 
     P2SH-P2WPKH
     P2SH-P2WSH
     P2WPKH
     P2WSH
     

 
 
 ID:wx658b3d275798a82f
 APPscrect:95df9c7e193c2dacd3e47a916de7e087
 
 
 
 
 
