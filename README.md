# アプリで使用するansibleコードのテンプレート

## ansibleのバージョン
ansible version: 2.4.1.0


## 使用方法

1. ssh接続keyを作成して「keys/ssh/access_key」で配置.(ansible-user) <br />
    ```
    ssh-keygen -t rsa -f ./access_key -C ansible-user
    ```


(2.)必要であれば各ユーザ毎のsshに必要な鍵を登録 (例. keys/ssh/operation_user/access_key access_key.pub)

(2.)必要であればssl接続に必要な証明書を登録 (例. keys/ssl/certificate.pem chain_certificate.pem private.key)


3. ansible-galaxyから使用しているroleをインストール
```
    インストールコマンド: ansible-galaxy install -r requirements.yml -p roles/galaxy
    インストールロールリスト: requirements.yml
    インストールディレクトリ: roles/galaxy
```

4. 実行

`ansible-playbook -i [インベントリファイル] site.yml -e "server=[実行環境]"`

例
```shell
ansible-playbook -i inventory/dev.ini site.yml -e "server=web"
```


## その他

※ group_vars以下の各環境フォルダ以下は、ファイルを分けているが環境を選択した時点で全て読み込まれるので注意
http://qiita.com/kotarella1110/items/79af4485bd7985935d6b


## 現在のディレクトリ構造
```
├── README.md
├── ansible.cfg
├── inventory
│   ├── dev.ini
│   ├── group_vars
│   │   ├── all.yml
│   │   ├── ansible.yml
│   │   ├── ladder.yml
│   │   ├── dev
│   │   │   └── dev.yml
│   │   ├── prd
│   │   │   └── prd.yml
│   │   ├── shd
│   │   │   └── shd.yml
│   │   └── stg
│   │       └── stg.yml
│   ├── host_vars
│   ├── prd.ini
│   ├── shd.ini
│   └── stg.ini
├── keys
│   ├── ssh
│   │   ├── access_key
│   │   ├── access_key.pub
│   │   └── operation_user
│   │       ├── id_rsa
│   │       └── id_rsa.pub
│   └── ssl
├── playbooks
│   ├── ansible.yml
│   ├── ladder.yml
│   └── common
│       ├── post_task.yml
│       ├── pre_task.yml
│       └── reboot_task.yml
├── requirements.yml
├── roles
│   ├── consul
│   ├── galaxy
│   │   ├── anyenv
│   │   ├── mackerel
│   │   ├── ntp
│   │   ├── package
│   │   ├── packer
│   │   ├── selinux
│   │   └── users_and_groups
│   ├── gcloud
│   ├── limits
│   └── pip
└── site.yml
```
