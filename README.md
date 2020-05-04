PgBouncer is a lightweight connection pooler for PostgreSQL.


**Current version 1.13.0**

See the [PgBouncer website](http://www.pgbouncer.org) for more information.

```
$ docker build . -t pgbouncer
$ docker run -v <config_dir>:/etc/pgbouncer -p6432:6432 pgbouncer
```
