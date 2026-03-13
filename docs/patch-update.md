# パッチファイルの更新方法

## オリジナルソースの取得

```shell
mkdir -p temp/
cd temp

wget https://raw.githubusercontent.com/torvalds/linux/refs/tags/v6.19/drivers/net/vxlan/vxlan_core.c
cp vxlan_core.c{,.orig}

$EDITOR vxlan_core.c

diff -uN vxlan_core.c.orig vxlan_core.c > ../ignore_df.patch
```
