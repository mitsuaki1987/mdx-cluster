# Cluster pack usage

[Manual](doc/cluster/Cluster.pdf)

以下マニュアルに書かれていない注意点。

すべてのノードでACL設定で80番を開ける。
そうしないと初回ログイン時のパスワード設定がエラーになる。

ログインノードではsshのポート(22)も開ける。

初回ログイン時にACLの適用のタイミングか何かのためにネットワークの名前解決ができなくなっているので、ネットワークの再起動を行う。
``` bash
sudo systemctl restart NetworkManager.service
```
これをしないと次のaptの実行に失敗する。

ログインノードにansibleを入れる
``` bash
sudo apt install ansible -y
```
※ これはテンプレートに含めるべきではないか？

ログインノードでssh鍵を作る
``` bash
ssh-keygen
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
を開く。

作成したユーザーが動いているか
``` bash
sudo su - testuser
```
で確かめるときに、ssh公開鍵も配置すると良い。また、同時にクラスター内での公開鍵の配置も行う。
``` bash
ssh-keygen
cat .ssh/id_rsa.pub >> .ssh/authorized_keys
```
