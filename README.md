Redpen container
=================


Example
---------

```
$ docker run -it quay.io/ainoya/redpen:1.3.0 /usr/local/bin/redpen -c /usr/local/conf/redpen-conf-ja.xml /usr/local/sample-doc/ja/sampledoc-ja.txt


[2015-09-16 05:33:46.024][INFO ] cc.redpen.Main - Configuration file: /usr/local/conf/redpen-conf-ja.xml
[2015-09-16 05:33:46.035][INFO ] cc.redpen.ConfigurationLoader - Loading config from specified config file: "/usr/local/conf/redpen-conf-ja.xml"
[2015-09-16 05:33:46.045][INFO ] cc.redpen.ConfigurationLoader - Succeeded to load configuration file
[2015-09-16 05:33:46.045][INFO ] cc.redpen.ConfigurationLoader - Language is set to "ja"
[2015-09-16 05:33:46.045][WARN ] cc.redpen.ConfigurationLoader - No type configuration...
[2015-09-16 05:33:46.047][INFO ] cc.redpen.ConfigurationLoader - No "symbols" block found in the configuration
[2015-09-16 05:33:46.147][INFO ] cc.redpen.config.SymbolTable - "ja" is specified.
[2015-09-16 05:33:46.148][INFO ] cc.redpen.config.SymbolTable - "normal" type is specified
[2015-09-16 05:33:46.819][INFO ] cc.redpen.parser.SentenceExtractor - "[。, ？, ！]" are added as a end of sentence characters
[2015-09-16 05:33:46.820][INFO ] cc.redpen.parser.SentenceExtractor - "[’, ”]" are added as a right quotation characters
[2015-09-16 05:33:46.836][INFO ] cc.redpen.validator.Validator - max_len is set to 100
[2015-09-16 05:33:46.843][INFO ] cc.redpen.util.DictionaryLoader - Succeeded to load katakana word dictionary.
[2015-09-16 05:33:46.855][INFO ] cc.redpen.validator.Validator - max_num is set to 1500
[2015-09-16 05:33:46.857][INFO ] cc.redpen.validator.Validator - max_num is not set. Use default value of 5
[2015-09-16 05:33:46.859][INFO ] cc.redpen.util.DictionaryLoader - Succeeded to load doubled word skip list.
[2015-09-16 05:33:46.862][INFO ] cc.redpen.validator.Validator - max_num is not set. Use default value of 3
[2015-09-16 05:33:46.877][INFO ] cc.redpen.validator.JavaScriptValidator - JavaScript validators directory: /data/js
sampledoc-ja.txt:1: ValidationError[SentenceLength], The length of the sentence (101) exceeds the maximum of 100. at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:1: ValidationError[InvalidSymbol], Found invalid symbol "，". at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:2: ValidationError[InvalidSymbol], Found invalid symbol ",". at line: 本稿では,複数の計算機（クラスタ）でで動作する各サーバーを「インスタンス」と呼びまます。
sampledoc-ja.txt:2: ValidationError[KatakanaEndHyphen], Found invalid Katakana end-hypen "サーバー". at line: 本稿では,複数の計算機（クラスタ）でで動作する各サーバーを「インスタンス」と呼びまます。
sampledoc-ja.txt:1: ValidationError[DoubledWord], Found repeated word "分散". at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:1: ValidationError[DoubledWord], Found repeated word "ソフトウェア". at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:1: ValidationError[DoubledWord], Found repeated word "複数". at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:1: ValidationError[DoubledWord], Found repeated word "計算". at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:1: ValidationError[DoubledWord], Found repeated word "動作". at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:1: ValidationError[DoubledWord], Found repeated word "たり". at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで大量のデータを扱えたり，高負荷な状況に対処できたりします。
sampledoc-ja.txt:4: ValidationError[SpaceBetweenAlphabeticalWord], Space not present before an alphabetical word. at line: このような場合、各インデクスの結果をマージしてclientプログラムに渡す機構が必要となります。
sampledoc-ja.txt:4: ValidationError[SpaceBetweenAlphabeticalWord], Space not present after an alphabetical word. at line: このような場合、各インデクスの結果をマージしてclientプログラムに渡す機構が必要となります。
sampledoc-ja.txt:2: ValidationError[SuccessiveWord], Found word "で" repeated twice in succession. at line: 本稿では,複数の計算機（クラスタ）でで動作する各サーバーを「インスタンス」と呼びまます。
```
