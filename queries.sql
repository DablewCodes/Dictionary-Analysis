--Find word next to or after the specified word
DECLARE word_to_be_searched string DEFAULT "aardwolf";
SELECT
  num_row, word
from
  `english-dictionary-analysis.dictionary_dataset.temp_row_labled`
where
  num_row = (Select num_row from `english-dictionary-analysis.dictionary_dataset.temp_row_labled` where word = word_to_be_searched)(+1/-1)


-- Palindrome words
SELECT
  word,
from
  `english-dictionary-analysis.dictionary_dataset.temp_row_labled`
where
  word = reverse(word)


--Finding occurrence for all word lengths 
SELECT
  LENGTH(word) AS word_char,
  COUNT(*) AS occurence,
FROM
  `english-dictionary-analysis.dictionary_dataset.dataset`
GROUP BY
  word_char
ORDER BY
  word_char ASC


-- Find words starting with a specific letter 
SELECT
  COUNT(*) AS occurence,
FROM
  `english-dictionary-analysis.dictionary_dataset.dataset`
WHERE
  word like 'z%'


-- Sorted all the words by their characters in ascending order and stored them in a temporary table; Queried duplicates for all word lengths to get the anagrams
CREATE TEMPORARY FUNCTION sortString(str STRING)
RETURNS string
LANGUAGE js AS """
  return str.split('').sort().join('')
""";
select sortString(word) from english-dictionary-analysis.dictionary_dataset.temp_row_labled as sortedword
SELECT f0_, count(f0_) FROM `english-dictionary-analysis._eb434fd81856596757dc27fe51d8fc5e25f955d7.anonc1a07081_1aec_48c7_aa91_57d8a84233bd` group by f0_ having count(f0_) = 4
