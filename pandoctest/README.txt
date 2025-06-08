README 

このディレクトリの内容は，markdown 形式で書かれた数学文書を pandoc によって tex 形式に変換し，さらにそれを lualatex で処理できることを例示する目的で作られています．この際，自分が作成したプリアンブルと参考文献処理をできるようにしてあります．

このような設定があまり自明ではないように思えたので，このサンプルが皆さんのお役に立てば幸いです．

このディレクトリは次のようになっています：

├── Makefile
├── README.txt
├── preamble.tex
├── reference.bib
└── test1.md

test1.md が本体となる markdown 形式の文書です．

preamble.tex はわたしがよく使っているプリアンブルです．

reference.bib は bibファイルです．（参考文献を並べて tex ファイルから参照するために使います）．

Makefile が用意されているので make test1 とすれば次のようなコマンドが実行されるはずです：

mkdir -p cluts
cp -f reference.bib cluts
pandoc test1.md --standalone --output=test1.tex
cluttex --engine=lualatex --output-directory='./cluts' --max-iterations=3 --bibtex='upbibtex -kanji=utf8 -kanji-internal=euc' -o test1.pdf -- test1.tex
mv test1.tex cluts

