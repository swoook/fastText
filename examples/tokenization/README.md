# Example: Tokenization

- This example shows how to tokenize a Korean corpus for fastText

## System envrionments

| system | version |
| --- | --- |
| Ubuntu | 18.04 LTS |
| Docker | 20.10.14 |

## Morphemes

- fastText tokenize a corpus based on the ASCII characters below:
1. **space**
2. tab
3. vertical tab
4. carriage return
5. formfeed
6. the null character
- But it's difficult to reflect the meaning if we tokenize Korean corpus based on spacing because Korean belongs to an agglutinative language
- So it’s more appropriate to tokenize it based on morphemes if we’re dealing with Korean
- One of the most famous korean morpheme analysis is `mecab-ko`
- It's a fork project of MeCab for korean morphological analysis
- It includes some exclusive features to address some challenges of Korean morphological analysis
- Besides, there are various projects as follows:
1. hannanum:: 한나눔 한국어 형태소 분석기 (HanNanum)
2. [꼬꼬마 세종 말뭉치 활용 시스템 (snu.ac.kr)](http://kkma.snu.ac.kr/)
3. https://github.com/shineware/KOMORAN
4. [MeCab: Yet Another Part-of-Speech and Morphological Analyzer (taku910.github.io)](http://taku910.github.io/mecab/)
5. https://github.com/open-korean-text/open-korean-text