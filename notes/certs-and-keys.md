# Digital Certificates & Private/Public Keys

All the certificate and key extensions generally map to two major encoding schemes for **X.509** certificates and keys:
- Base64 (ASCII)
  - PEM
    - .pem
    - .key
    - .cer
    - .cert
    - .crt
- Binary
  - DER
    - .der
    - .cer

The following is extracted from StackExchange https://serverfault.com/a/9717/490332:

 - **.csr** - This is a Certificate Signing Request. Some applications can generate these for submission to certificate-authorities. The actual format is PKCS10 which is defined in [RFC 2986][1]. It includes some/all of the key details of the requested certificate such as subject, organization, state, whatnot, as well as the *public key* of the certificate to get signed. These get signed by the CA and a certificate is returned. The returned certificate is the public *certificate* (which includes the public key but not the private key), which itself can be in a couple of formats.
 - **.pem** - Defined in RFCs [1421][2] through [1424][3], this is a container format that may include just the public certificate (such as with Apache installs, and CA certificate files `/etc/ssl/certs`), or may include an entire certificate chain including public key, private key, and root certificates. Confusingly, it may also encode a CSR (e.g. as used [here][4]) as the PKCS10 format can be translated into PEM. The name is from [Privacy Enhanced Mail (PEM)](https://en.wikipedia.org/wiki/Privacy-enhanced_Electronic_Mail), a failed method for secure email but the container format it used lives on, and is a base64 translation of the x509 ASN.1 keys. 
 - **.key** - This is a PEM formatted file containing just the private-key of a specific certificate and is merely a conventional name and not a standardized one. In Apache installs, this frequently resides in `/etc/ssl/private`. The rights on these files are very important, and some programs will refuse to load these certificates if they are set wrong.
 - **.pkcs12 .pfx .p12** - Originally defined by RSA in the [Public-Key Cryptography Standards][5] (abbreviated PKCS), the "12" variant was originally enhanced by Microsoft, and later submitted as [RFC 7292][6]. This is a passworded container format that contains both public and private certificate pairs. Unlike .pem files, this container is fully encrypted. Openssl can turn this into a .pem file with both public and private keys: `openssl pkcs12 -in file-to-convert.p12 -out converted-file.pem -nodes` 

A few other formats that show up from time to time:

 - **.der** - A way to encode ASN.1 syntax in binary, a .pem file is just a Base64 encoded .der file. OpenSSL can convert these to .pem (`openssl x509 -inform der -in to-convert.der -out converted.pem`). Windows sees these as Certificate files. By default, Windows will export certificates as .DER formatted files with a different extension. Like...
 - **.cert .cer .crt** - A .pem (or rarely .der) formatted file with a different extension, one that is recognized by Windows Explorer as a certificate, which .pem is not.
 - **.p7b .keystore** - Defined in [RFC 2315][7] as PKCS number 7, this is a format used by Windows for certificate interchange. Java understands these natively, and often uses `.keystore` as an extension instead. Unlike .pem style certificates, this format has a *defined* way to include certification-path certificates. 
 - **.crl** - A certificate revocation list. Certificate Authorities produce these as a way to de-authorize certificates before expiration. You can sometimes download them from CA websites.

In summary, there are four different ways to present certificates and their components:

 - **PEM** - Governed by RFCs, its used preferentially by open-source software. It can have a variety of extensions (.pem, .key, .cer, .cert, more)
 - **PKCS7** - An open standard used by Java and supported by Windows. Does not contain private key material.
 - **PKCS12** - A Microsoft private standard that was later defined in an RFC that provides enhanced security versus the plain-text PEM format. This can contain private key material. Its used preferentially by Windows systems, and can be freely converted to PEM format through use of openssl.
 - **DER** - The parent format of PEM. It's useful to think of it as a binary version of the base64-encoded PEM file. Not routinely used very much outside of Windows. 

  [1]: https://tools.ietf.org/html/rfc2986
  [2]: https://tools.ietf.org/html/rfc1421
  [3]: https://tools.ietf.org/html/rfc1424
  [4]: https://jamielinux.com/docs/openssl-certificate-authority/create-the-intermediate-pair.html
  [5]: https://en.wikipedia.org/wiki/PKCS
  [6]: https://tools.ietf.org/html/rfc7292
  [7]: https://tools.ietf.org/html/rfc2315

## Open SSL

OpenSSL is a very useful open-source command-line toolkit for working with X.509 certificates, certificate signing requests (CSRs), and cryptographic keys.

## Keytool

- List certificate for given alias: `keytool -list -keystore .keystore -alias foo`
- Import certificate to keystore: `keytool -importcert -file certificate.cer -keystore keystore.jks -alias "Alias"`

## GPG Keys

sec => 'SECret key'
ssb => 'Secret SuBkey'
pub => 'PUBlic key'
sub => 'public SUBkey'

- Listing secret keys: `gpg -K`
- Listing (public) keys: `gpg -k`

### References

- https://www.ssls.com/knowledgebase/what-are-certificate-formats-and-what-is-the-difference-between-them/
- https://www.ssl.com/guide/pem-der-crt-and-cer-x-509-encodings-and-conversions/
- https://gnupg.org/documentation/manpage.html
- http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
- https://stackoverflow.com/questions/44811904/gnupg-which-is-the-public-and-which-is-the-private-key-in-this-pair
