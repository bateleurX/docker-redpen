Another Redpen container
=================

https://github.com/ainoya/docker-redpen をフォークして、最新のRedpenへの対応を行ったコンテナです。開発中なのでいろいろと不都合があるかもしれません。

# 主要な変更点
- Redpenのバージョンアップ
- 利用するJDKをOracle JDK 8からOpenJDK 11に変更
- ベースOSをUbuntu 15.04からDebian 11に変更
- （主にm1 mac向け）arm64向けコンテナの追加

# 使い方
`docker run`コマンドで実行可能です。

```
docker run -it lighthawk/redpen:latest -h
usage: redpen-cli [Options] [<INPUT FILE>]

Validate input documents with specified configuration settings.

Options:
 -c,--conf <CONF FILE>                Configuration file (REQUIRED)
 -f,--format <FORMAT>                 Input file format
                                      (markdown,plain,wiki,asciidoc,latex,rest)
 -h,--help                            Displays this help information and exits
 -l,--limit <LIMIT NUMBER>            Error limit number
 -L,--lang <LANGUAGE>                 Language of error messages
 -r,--result-format <RESULT FORMAT>   Output result format
                                      (json,json2,plain,plain2,xml)
 -s,--sentence <INPUT SENTENCES>      Input sentences
 -t,--threshold <THRESHOLD>           Threshold of error level (info, warn,
                                      error)
 -v,--version                         Displays version information and exits


Example:

$redpen -c redpen-config.xml input.md

Note:
Setting files can be generated in http://redpen.herokuapp.com/
```
# Redpenそのものの利用方法
[Redpenの公式ドキュメント](https://redpen.cc/docs/latest/index_ja.html "RedPen 1.10 ドキュメント")を参照してください。

Example
---------

```
docker run -it lighthawk/redpen:latest -c /usr/local/conf/redpen-conf-ja.xml /usr/local/sample-doc/ja/sampledoc-ja.txt
[2021-08-16 10:09:39.727][INFO ] cc.redpen.Main - Configuration file: /usr/local/conf/redpen-conf-ja.xml
[2021-08-16 10:09:39.732][INFO ] cc.redpen.config.ConfigurationLoader - Loading config from specified config file: "/usr/local/conf/redpen-conf-ja.xml"
[2021-08-16 10:09:39.743][INFO ] cc.redpen.config.ConfigurationLoader - Succeeded to load configuration file
[2021-08-16 10:09:39.743][INFO ] cc.redpen.config.ConfigurationLoader - Language is set to "ja"
[2021-08-16 10:09:39.744][WARN ] cc.redpen.config.ConfigurationLoader - No variant configuration...
[2021-08-16 10:09:39.746][INFO ] cc.redpen.config.ConfigurationLoader - No "symbols" block found in the configuration
[2021-08-16 10:09:39.749][INFO ] cc.redpen.config.SymbolTable - "ja" is specified.
[2021-08-16 10:09:39.749][INFO ] cc.redpen.config.SymbolTable - "zenkaku" variant is specified
[2021-08-16 10:09:40.440][INFO ] cc.redpen.parser.SentenceExtractor - "[。, ？, ！]" are added as a end of sentence characters
[2021-08-16 10:09:40.440][INFO ] cc.redpen.parser.SentenceExtractor - "[’, ”]" are added as a right quotation characters
WARNING: An illegal reflective access operation has occurred
WARNING: Illegal reflective access by org.parboiled.transform.AsmUtils (file:/usr/local/lib/parboiled-java-1.1.7.jar) to method java.lang.ClassLoader.findLoadedClass(java.lang.String)
WARNING: Please consider reporting this to the maintainers of org.parboiled.transform.AsmUtils
WARNING: Use --illegal-access=warn to enable warnings of further illegal reflective access operations
WARNING: All illegal access operations will be denied in a future release
[2021-08-16 10:09:40.705][INFO ] org.reflections.Reflections - Reflections took 34 ms to scan 1 urls, producing 6 keys and 58 values
[2021-08-16 10:09:40.751][WARN ] cc.redpen.validator.ValidatorFactory - cc.redpen.validator.section.VoidSectionValidator is deprecated
[2021-08-16 10:09:40.767][WARN ] cc.redpen.validator.ValidatorFactory - cc.redpen.validator.sentence.SpaceBeginningOfSentenceValidator is deprecated
[2021-08-16 10:09:40.789][INFO ] org.reflections.Reflections - Reflections took 2 ms to scan 1 urls, producing 176 keys and 181 values
[2021-08-16 10:09:40.795][INFO ] cc.redpen.util.DictionaryLoader - Succeeded to load InvalidExpressionValidator default dictionary.
[2021-08-16 10:09:40.802][INFO ] cc.redpen.util.DictionaryLoader - Succeeded to load double negative expression rules.
[2021-08-16 10:09:40.802][INFO ] cc.redpen.util.DictionaryLoader - Succeeded to load double negative words.
[2021-08-16 10:09:40.806][INFO ] cc.redpen.validator.JavaScriptValidator - JavaScript validators directory: js
/usr/local/sample-doc/ja/sampledoc-ja.txt:1: ValidationError[SentenceLength], The length of the sentence (125) exceeds the maximum of 100. at line: 最近利用されているソフトウェアの中には複数の計算機上で動作（分散）するものが多く存在し、このような分散ソフトウェアは複数の計算機で動作することで一台では処理が追いつかない大量のデータを扱えたり、高負荷な状況に対処できたり、可用性を向上できたりします。
/usr/local/sample-doc/ja/sampledoc-ja.txt:2: ValidationError[SuccessiveWord], Found word "で" repeated twice in succession. at line: 本稿では,複数の計算機（Cluster)でで動作する各サーバーを「インスタンス」と呼びます。
/usr/local/sample-doc/ja/sampledoc-ja.txt:2: ValidationError[InvalidSymbol], Found invalid symbol ")". at line: 本稿では,複数の計算機（Cluster)でで動作する各サーバーを「インスタンス」と呼びます。
/usr/local/sample-doc/ja/sampledoc-ja.txt:2: ValidationError[InvalidSymbol], Found invalid symbol ",". at line: 本稿では,複数の計算機（Cluster)でで動作する各サーバーを「インスタンス」と呼びます。
/usr/local/sample-doc/ja/sampledoc-ja.txt:2: ValidationError[KatakanaEndHyphen], Found invalid Katakana end-hyphen "サーバー". at line: 本稿では,複数の計算機（Cluster)でで動作する各サーバーを「インスタンス」と呼びます。
/usr/local/sample-doc/ja/sampledoc-ja.txt:4: ValidationError[KatakanaEndHyphen], Found invalid Katakana end-hyphen "クラスター". at line: このような場合、クラスターの各インデクスが返す結果をマージしてクライアントにわたす機構が必要です。

[2021-08-16 10:09:40.834][ERROR] cc.redpen.Main - The number of errors "6" is larger than specified (limit is "1").
```
