#WDn/WDn.g.vcf.gzがたくさんあるフォルダからgvcfのファイル名だけを取り出す。
#genomicDBImportで使えるように"-V" を頭につける。
#ついでに番号順にソートする。
#（nが1-3桁なので普通にllするとWD1,WD10,WD100,WD11のように並んでなんか気持ち悪い）
ll | \
awk '/WD/ {num_pos = match($9,"[0-9]+"); printf "%s:-V %s/%s.g.vcf.gz\n",substr($9,num_pos,RLENGTH), $9, $9;}' \
|sort -t ":" -k 1 -n | sed -r 's/[0-9]{1,3}:(.*)/\1/' > wd_v.txt
