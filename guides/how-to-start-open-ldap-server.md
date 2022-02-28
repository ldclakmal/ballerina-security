# How to Start OpenLDAP Server with User Data

First, if you have already started the `osixia/openldap:1.3.0` image, you have to delete the container. If not, ignore this step.
```bash
$ docker container ls -a
$ docker container rm <container-id>
```

Now, you need to create `.ldif` with user data. Refer to [bootstrap.ldif](./resources/ldap/bootstrap.ldif) for a sample.
> Reference: https://www.digitalocean.com/community/tutorials/how-to-use-ldif-files-to-make-changes-to-an-openldap-system

Now, create `docker-compose.yml` file with required env variables, ports, volumes, etc. Refer to [docker-compose.yml](./resources/ldap/docker-compose.yml) for a sample.

Now, execute the following command to start the Docker container.
```bash
$ docker-compose up
```

**NOTE**: Since we have named the container as `openldap-server` in `docker-compose.yml` file the following commands will refer to that name.

Execute the following commands with `ldapsearch` to query the DIT and lookup entries.
```bash
$ docker exec openldap-server ldapsearch -x -H ldap://localhost -D "cn=admin,dc=avix,dc=lk" -w avix123 -b "dc=avix,dc=lk"
$ docker exec openldap-server ldapsearch -x -H ldap://localhost -D "cn=admin,dc=avix,dc=lk" -w avix123 -b "dc=avix,dc=lk" -s one -LLL dn
$ docker exec openldap-server ldapsearch -x -H ldap://localhost -D "cn=admin,dc=avix,dc=lk" -w avix123 -b "dc=avix,dc=lk" -LLL "(uid=ldclakmal)"
$ docker exec openldap-server ldapsearch -x -H ldap://localhost -D "cn=admin,dc=avix,dc=lk" -w avix123 -b "ou=Groups,dc=avix,dc=lk" -LLL "(&(objectClass=groupOfNames)(member=uid=janedoe,ou=users,dc=avix,dc=lk))"
```

Use this command to peek inside the Docker container.
```bash
$ docker exec -it openldap-server bash
```

Use this command to verify the `bootstrap.ldif` is properly installed.
```bash
$ docker exec openldap-server ldapadd -x -H ldap://localhost -D "cn=admin,dc=avix,dc=lk" -w avix123 -f /container/service/slapd/assets/config/bootstrap/ldif/custom/bootstrap.ldif
```

---
**NOTE**: Experimental stage.

An alternative way to start the container without `docker-compose.yml`.
```bash
docker run -p 389:389 -p 636:636 --name openldap-server --env LDAP_ORGANISATION="AVIX" \
    --env LDAP_DOMAIN="avix.lk" --env LDAP_ADMIN_PASSWORD="avix123" --env LDAP_BASE_DN="dc=avix,dc=lk" \
    --volume ./bootstrap.ldif:/container/service/slapd/assets/config/bootstrap/ldif/custom/bootstrap.ldif \
    osixia/openldap:1.3.0 --copy-service
```

---
# References
1. <https://github.com/osixia/docker-openldap>
2. <https://ldap.com/basic-ldap-concepts>
3. <https://www.digitalocean.com/community/tutorials/how-to-use-ldif-files-to-make-changes-to-an-openldap-system>>
4. <https://www.digitalocean.com/community/tutorials/how-to-manage-and-use-ldap-servers-with-openldap-utilities>
