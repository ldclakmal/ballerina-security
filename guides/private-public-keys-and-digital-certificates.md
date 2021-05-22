# Private/Public Keys & Digital Certificates

The following are encoding formats.

- **PEM (Base64 (ASCII))** - PEM is Base64 encoded DER: we add a header, optional meta-data, and the Base64 encoded DER data, and we have a PEM file. Governed by RFCs, it is used preferentially by open-source software. It can have a variety of extensions like .pem, .key, .cer, .cert, more. The PEM file can include the server certificate, the intermediate certificate, and the private key in a single file. The server certificate and intermediate certificate can also be in a separate .crt or .cer file. The private key can be in a .key file.

- **DER (Binary)** - The parent format of PEM. It's useful to think of it as a binary version of the Base64-encoded PEM file. Not routinely used very much outside of Windows. It can have extensions like .der or .cer.

The followings are standards that govern the use of particular cryptographic primitives, padding, etc. Also define file formats that are used to store keys, certificates, and other relevant information.

- **PKCS1** - Primarily about using the RSA algorithm. Available in several versions as RFCs 2313, 2437, 3447, and 8017.
- **PKCS8** - A standard for handling private keys for all algorithms, not just RSA algorithm. Available as RFC 5208. Also provides an option to encrypt the private key, using password-based encryption.
- **PKCS12** - A Microsoft private standard that was later defined in an RFC 7292 that provides enhanced security. The 'keystore' may contain both private keys and their corresponding certificates with or without a complete chain.

> NOTE: Since most systems, today need to support multiple algorithms, and wish to be able to adapt to new algorithms as they are developed, PKCS8 is preferred for private keys, and a similar any-algorithm scheme defined by X.509 for public keys. Also, PKCS12/PFX is often preferred to both.

References:
1. [https://www.misterpki.com/](https://www.misterpki.com/)
2. [https://tls.mbed.org/kb/cryptography/asn1-key-structures-in-der-and-pem](https://tls.mbed.org/kb/cryptography/asn1-key-structures-in-der-and-pem)
3. [https://www.cryptosys.net/pki/rsakeyformats.html](https://www.cryptosys.net/pki/rsakeyformats.html)

## Open SSL

OpenSSL is a very useful open-source command-line toolkit for working with X.509 certificates, certificate signing requests (CSRs), and cryptographic keys.

- Check a PKCS#12 file: `openssl pkcs12 -info -in keystore.p12`
- Check a certificate: `openssl x509 -in public.crt -text`
- Check a private key: `openssl rsa -in private.key -check`
- Generate a private key & self-signed certificate: `openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout private.key -out public.crt`

References:
1. [https://www.sslshopper.com/article-most-common-openssl-commands.html](https://www.sslshopper.com/article-most-common-openssl-commands.html)
2. [https://www.sslshopper.com/ssl-certificate-tools.html](https://www.sslshopper.com/ssl-certificate-tools.html)
3. [https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs](https://www.digitalocean.com/community/tutorials/openssl-essentials-working-with-ssl-certificates-private-keys-and-csrs)
4. [https://blog.devolutions.net/2020/07/tutorial-how-to-generate-secure-self-signed-server-and-client-certificates-with-openssl](https://blog.devolutions.net/2020/07/tutorial-how-to-generate-secure-self-signed-server-and-client-certificates-with-openssl)

## Keytool

Java Keytool is a key and certificate management utility. It allows users to manage their public/private key pairs and certificates.

- Check a particular 'keystore' entry using an alias: `keytool -list -v -keystore keystore.p12 -alias foo`
- Check a stand-alone certificate: `keytool -printcert -v -file mycert.crt`
- Import certificate to 'keystore': `keytool -importcert -file mycert.cer -keystore keystore.jks -alias foo`
- Export a certificate from a 'keystore': `keytool -export -alias foo -file mycert.crt -keystore keystore.p12 -rfc`

References:
1. [https://www.sslshopper.com/article-most-common-java-keytool-keystore-commands.html](https://www.sslshopper.com/article-most-common-java-keytool-keystore-commands.html)

## GPG Keys

#### Components

- sec - **SEC**ret key
- ssb - **S**ecret **S**u**B**key
- pub - **PUB**lic key
- sub - public **SUB**key

#### Commands

- Listing secret keys: `gpg -K`
- Listing (public) keys: `gpg -k`
