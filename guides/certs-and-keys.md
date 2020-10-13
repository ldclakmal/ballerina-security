# Digital Certificates & Private/Public Keys

`.crt`, `.cer`, `.pem`, `.der`

These extensions generally map to two major encoding schemes for **X.509** certificates and keys:
- Base64 (ASCII)
  - PEM
    - .pem
    - .crt
    - .ca-bundle
  - PKCS#7
    - .p7b
    - .p7s
- Binary
  - DER
    - .der
    - .cer
  - PKCS#12
    - .pfx
    - .p12

OpenSSL is a very useful open-source command-line toolkit for working with X.509 certificates, certificate signing requests (CSRs), and cryptographic keys.

## Base64 (ASCII)

### PEM

**PEM (Privacy Enhanced Mail)** is the most common format for X.509 certificates, CSRs, and cryptographic keys. A PEM file is a text file containing one or more items in Base64 ASCII encoding, each with plain-text headers and footers (e.g. `-----BEGIN CERTIFICATE-----` and `-----END CERTIFICATE-----`). A single PEM file could contain an end-entity certificate, a private key, or multiple certificates forming a complete chain of trust. Most certificate files downloaded from SSL.com will be in PEM format.

### PKCS#7

**PKCS#7 (also known as P7B)** is a container format for digital certificates that is most often found in Windows and Java server contexts, and usually has the extension .p7b. PKCS#7 files are not used to store private keys

## Binary

### DER

**DER (Distinguished Encoding Rules)** is a binary encoding for X.509 certificates and private keys. Unlike PEM, DER-encoded files do not contain plain text statements such as `-----BEGIN CERTIFICATE-----`. DER files are most commonly seen in Java contexts. 

### PKCS#12

**PKCS#12 (also known as PKCS12 or PFX)** is a common binary format for storing a certificate chain and private key in a single, encryptable file, and usually have the filename extensions .p12 or .pfx.

https://www.ssls.com/knowledgebase/what-are-certificate-formats-and-what-is-the-difference-between-them/
https://www.ssl.com/guide/pem-der-crt-and-cer-x-509-encodings-and-conversions/

---

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

https://gnupg.org/documentation/manpage.html
http://irtfweb.ifa.hawaii.edu/~lockhart/gpg/
https://stackoverflow.com/questions/44811904/gnupg-which-is-the-public-and-which-is-the-private-key-in-this-pair
