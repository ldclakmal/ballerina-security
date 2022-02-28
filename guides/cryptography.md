# Cryptography

## The Basic Principles

1. **Confidentiality** - ensures that the secrecy of information.
2. **Integrity** - ensures that the messages that are received by the receiver are not altered anywhere on the communication path.
3. **Authentication** - ensures that the message was originated from the originator claimed in the message.
4. **Non Repudiation** - ensures that an entity cannot refuse the ownership of a previous commitment or an action.

| | Encryption | Hash | Digital Signature |
|---|---|---|---|
| Confidentiality | ✓ | X | X |
| Integrity | X | ✓ | ✓ |
| Authentication | X | X | ✓ |
| Non Repudiation | X | X | ✓ |

**Encryption** - Convert the data in some unreadable form.

**1. Symmetric key cryptography** (Secret Key Cryptography)
> This type of cryptography technique uses just a single key. The sender applies a key to encrypt a message while the receiver applies the same key to decrypt the message.
> Algorithms: AES, DES, 3DES
>
**2. Asymmetric key cryptography** (Public Key Cryptography)
> This type of cryptography technique involves two key crypto system in which a secure communication can take place between receiver and sender over insecure communication channel.
> Algorithms: RSA, Diffie-Hellman, ECC

**Hash Function** - a mathematical function that converts a numerical input value into another compressed numerical value. The input to the hash function is of arbitrary length but output is always of fixed length.

**Digital Signature** - a cryptographic value that is calculated from the data and a secret key known only by the signer.

---

## Private/Public Keys & Digital Certificates

### Encoding Formats

- **PEM (Base64 (ASCII))** - PEM is Base64 encoded DER: we add a header, optional meta-data, and the Base64 encoded DER data, and we have a PEM file. Governed by RFCs, it is used preferentially by open-source software. It can have a variety of extensions like .pem, .key, .cer, .cert, more. The PEM file can include the server certificate, the intermediate certificate, and the private key in a single file. The server certificate and intermediate certificate can also be in a separate .crt or .cer file. The private key can be in a .key file.

- **DER (Binary)** - The parent format of PEM. It's useful to think of it as a binary version of the Base64-encoded PEM file. Not routinely used very much outside of Windows. It can have extensions like .der or .cer.

### Standards

The followings are standards that govern the use of particular cryptographic primitives, padding, etc. Also define file formats that are used to store keys, certificates, and other relevant information.

- **PKCS1** - Primarily about using the RSA algorithm. Available in several versions as RFCs 2313, 2437, 3447, and 8017.
- **PKCS8** - A standard for handling private keys for all algorithms, not just RSA algorithm. Available as RFC 5208. Also provides an option to encrypt the private key, using password-based encryption.
- **PKCS12** - A Microsoft private standard that was later defined in an RFC 7292 that provides enhanced security. The 'keystore' may contain both private keys and their corresponding certificates with or without a complete chain.

> **NOTE**: Since most systems, today need to support multiple algorithms, and wish to be able to adapt to new algorithms as they are developed, PKCS8 is preferred for private keys, and a similar any-algorithm scheme defined by X.509 for public keys. Also, PKCS12/PFX is often preferred to both.

> A sample set of keys and certs can be found [here](https://github.com/ldclakmal/ballerina-security/tree/master/guides/resources/keys-certs/sample-types).

References:
1. <https://www.misterpki.com/>
2. <https://tls.mbed.org/kb/cryptography/asn1-key-structures-in-der-and-pem>
3. <https://www.cryptosys.net/pki/rsakeyformats.html>

### Tools

**OpenSSL** is a very useful open-source command-line toolkit for working with X.509 certificates, certificate signing requests (CSRs), and cryptographic keys.

**Java Keytool** is a key and certificate management utility. It allows users to manage their public/private key pairs and certificates.

Refer to the [1] and [2] for commands.

References:
1. <https://www.sslshopper.com/article-most-common-openssl-commands.html>
2. <https://www.sslshopper.com/article-most-common-java-keytool-keystore-commands.html>
3. <https://www.sslshopper.com/ssl-certificate-tools.html>
4. <https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs>
5. <https://blog.devolutions.net/2020/07/tutorial-how-to-generate-secure-self-signed-server-and-client-certificates-with-openssl>

### Guide to generate certs and keys

#### Generate CA cert and key
```bash
openssl genrsa -out ca.key 2048
openssl req -x509 -sha256 -new -nodes -key ca.key -days 3650 -out ca.crt
```

#### Generate client/server CSR and key
```bash
openssl req -out client.csr -newkey rsa:2048 -nodes -keyout client.key
openssl req -out server.csr -newkey rsa:2048 -nodes -keyout server.key
```

###### [Optional] with `san.conf`
```bash
openssl req -out client.csr -newkey rsa:2048 -nodes -keyout client.key -config san.conf
openssl req -out server.csr -newkey rsa:2048 -nodes -keyout server.key -config san.conf
```

#### Generate client/server cert
```bash
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 3650 -sha256
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650 -sha256
```

###### [Optional] with `san.conf`
```bash
openssl x509 -req -in client.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out client.crt -days 3650 -sha256 -extfile san.conf
openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 3650 -sha256 -extfile san.conf
```

#### Import certs to truststore
```bash
keytool -import -trustcacerts -alias ca -file ca.crt -keystore truststore.p12
keytool -import -trustcacerts -alias client -file client.crt -keystore truststore.p12
keytool -import -trustcacerts -alias server -file server.crt -keystore truststore.p12
```

#### Convert key to PKCS12 and import to keystore
```bash
openssl pkcs12 -export -in client.crt -inkey client.key \
               -out client.p12 -name client \
               -CAfile ca.crt -caname root
openssl pkcs12 -export -in server.crt -inkey server.key \
               -out server.p12 -name server \
               -CAfile ca.crt -caname root

keytool -importkeystore \
        -deststorepass ballerina -destkeypass ballerina -destkeystore keystore.p12 \
        -srckeystore client.p12 -srcstoretype PKCS12 -srcstorepass ballerina \
        -alias client
keytool -importkeystore \
        -deststorepass ballerina -destkeypass ballerina -destkeystore keystore.p12 \
        -srckeystore server.p12 -srcstoretype PKCS12 -srcstorepass ballerina \
        -alias server
```

---

## GPG Keys

GnuPG is a complete and free implementation of the OpenPGP standard as defined by [RFC4880](https://www.ietf.org/rfc/rfc4880.txt) (aka PGP). GnuPG allows you to encrypt and sign your data and communications; it features a versatile key management system, along with access modules for all kinds of public key directories. GnuPG, also known as GPG, is a command line tool with features for easy integration with other applications. GnuPG also provides support for S/MIME and Secure Shell (SSH).

#### Components

- sec - **SEC**ret key
- ssb - **S**ecret **S**u**B**key
- pub - **PUB**lic key
- sub - public **SUB**key

#### Commands

- Listing secret keys: `gpg -K`
- Listing (public) keys: `gpg -k`

References:
1. <https://gnupg.org/index.html>
