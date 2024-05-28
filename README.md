すべてのノードでACL設定で80番を開ける。
そうしないと初回ログイン時のパスワード設定がエラーになる。

ログインノードではsshのポート(22)も開ける。

ログインノードにansibleを入れる
``` bash
sudo apt install ansible -y
```

ログインノードでssh鍵を作る
``` bash
ssh-keyge
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
```
この公開鍵を各計算ノードに配置する。

このGitリポジトリをクローンして、`cluster-setting/`に入る。

LAMでLDAPの設定をするために、sshポートフォワードを使って
``` bash
ssh -L 8080:localhost:80 mdxuser@163.220.177.102
```
などとして、ローカルのブラウザ上で
http://localhost:8080/lam/
