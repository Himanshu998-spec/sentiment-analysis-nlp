USE SentimentAnalysisDB;
GO


SELECT COUNT(*) AS Total_Records
FROM SentimentData;

    
SELECT TOP 10
    ID,
    status,
    character_count,
    word_count,
    sentence_count
FROM SentimentData
ORDER BY ID;

--1.How many statements belong to each classification category, and what percentage of the total does each category represent?

SELECT
    status,
    COUNT(*) AS total_statements,
    CAST(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER ()
        AS DECIMAL(5,2)
    ) AS percentage_of_total
FROM SentimentData
GROUP BY status
ORDER BY total_statements DESC;

--2.What is the average character count, word count, and sentence count for each category?

SELECT
    status,
    ROUND(AVG(CAST(character_count AS FLOAT)), 2) AS avg_characters,
    ROUND(AVG(CAST(word_count AS FLOAT)), 2) AS avg_words,
    ROUND(AVG(CAST(sentence_count AS FLOAT)), 2) AS avg_sentences
FROM SentimentData
GROUP BY status
ORDER BY avg_words DESC;

--7. Category-wise text length comparison

SELECT
    status,
    ROUND(AVG(CAST(character_count AS FLOAT)), 2) AS avg_characters,
    ROUND(AVG(CAST(word_count AS FLOAT)), 2) AS avg_words,
    ROUND(AVG(CAST(sentence_count AS FLOAT)), 2) AS avg_sentences
FROM SentimentData
GROUP BY status
ORDER BY avg_words DESC;

-- 4. Find the longest statements

SELECT TOP 10
    ID,
    status,
    word_count,
    character_count,
    sentence_count,
    statement
FROM SentimentData
ORDER BY word_count DESC;

-- 5. Find average text length overall

SELECT
    COUNT(*) AS total_statements,
    ROUND(AVG(CAST(character_count AS FLOAT)), 2) AS avg_characters,
    ROUND(AVG(CAST(word_count AS FLOAT)), 2) AS avg_words,
    ROUND(AVG(CAST(sentence_count AS FLOAT)), 2) AS avg_sentences,
    MIN(word_count) AS shortest_statement_words,
    MAX(word_count) AS longest_statement_words
FROM SentimentData;

-- 6. Find the category with the highest average word count

SELECT TOP 1
    status,
    ROUND(AVG(CAST(word_count AS FLOAT)), 2) AS avg_word_count
FROM SentimentData
GROUP BY status
ORDER BY avg_word_count DESC;

-- 7.Classify statements by text length

SELECT
    CASE
        WHEN word_count < 50 THEN 'Short'
        WHEN word_count BETWEEN 50 AND 150 THEN 'Medium'
        ELSE 'Long'
    END AS text_length_category,
    COUNT(*) AS total_statements,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_total
FROM SentimentData
GROUP BY
    CASE
        WHEN word_count < 50 THEN 'Short'
        WHEN word_count BETWEEN 50 AND 150 THEN 'Medium'
        ELSE 'Long'
    END
ORDER BY total_statements DESC;

-- 8.We'll create a compact category-level summary containing:

--Total statements
--Average words
--Average characters
--Average sentences
--Minimum words
--Maximum words

SELECT
    status,
    COUNT(*) AS total_statements,
    ROUND(AVG(CAST(word_count AS FLOAT)), 2) AS avg_words,
    ROUND(AVG(CAST(character_count AS FLOAT)), 2) AS avg_characters,
    ROUND(AVG(CAST(sentence_count AS FLOAT)), 2) AS avg_sentences,
    MIN(word_count) AS min_words,
    MAX(word_count) AS max_words
FROM SentimentData
GROUP BY status
ORDER BY total_statements DESC;