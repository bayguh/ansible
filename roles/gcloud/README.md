こちらのroleは下記のansible-galaxyから取得して、独自の改変を加えたものです。

```
#https://galaxy.ansible.com/rfhayashi/gcloud/
- src: rfhayashi.gcloud
  name: gcloud
  version: 0.5
```

Role Name
=========

Ansible Role that installs Gooogle Cloud Cli Tooling

Requirements
------------

None.

Role Variables
--------------

gcloud version

```
google_cloud_sdk_version: 136.0.0
```

gcloud platform - see [avaiable platforms] (https://cloud.google.com/sdk/downloads)

```
google_cloud_sdk_platform: linux-x86_64
```

gcloud checksum - see [checksums] (https://cloud.google.com/sdk/downloads)

```
google_cloud_sdk_sha1sum: cea487b1a14cfeaae28c24921ae34fb9f267e639
```

Dependencies
------------

None.

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: rfhayashi.gcloud }

License
-------

MIT
