#!/bin/bash

echo "=============================================="
echo " SAN JOAQUIN VALLEY TOWN HALL"
echo " THIRD COLUMN AUTOGRADER"
echo "=============================================="

MARKS=0
TOTAL=50

# ----------------------------------------------

# TEST 1 - index.html

# ----------------------------------------------

if [ -f index.html ]; then
echo "TEST 1 PASS - index.html found - 5 marks"
MARKS=$((MARKS + 5))
else
echo "TEST 1 FAIL - index.html missing"
fi

# ----------------------------------------------

# TEST 2 - CSS file

# ----------------------------------------------

if [ -f styles/Ex10_main.css ]; then
echo "TEST 2 PASS - CSS file found - 5 marks"
MARKS=$((MARKS + 5))
else
echo "TEST 2 FAIL - CSS file missing"
fi

# Stop if index.html is missing

if [ ! -f index.html ]; then
echo "Cannot continue without index.html"
exit 1
fi

# ----------------------------------------------

# TEST 3 - main element

# ----------------------------------------------

if grep -Eiq '<main[^>]*>' index.html; then
echo "TEST 3 PASS - <main> found - 5 marks"
MARKS=$((MARKS + 5))
else
echo "TEST 3 FAIL - <main> missing"
fi

# ----------------------------------------------

# TEST 4 - section element

# ----------------------------------------------

if grep -Eiq '<section[^>]*>' index.html; then
echo "TEST 4 PASS - <section> found - 5 marks"
MARKS=$((MARKS + 5))
else
echo "TEST 4 FAIL - <section> missing"
fi

# ----------------------------------------------

# TEST 5 - multiple aside elements

# ----------------------------------------------

ASIDE_COUNT=$(grep -Eio '<aside[^>]*>' index.html | wc -l)

if [ "$ASIDE_COUNT" -ge 2 ]; then
echo "TEST 5 PASS - $ASIDE_COUNT aside elements found - 5 marks"
MARKS=$((MARKS + 5))
else
echo "TEST 5 FAIL - Only $ASIDE_COUNT aside element(s) found"
fi

# ----------------------------------------------

# TEST 6 - third column content

# ----------------------------------------------

if [ "$ASIDE_COUNT" -ge 2 ]; then

```
if grep -Eiq \
'Event change|Event Change|November 16|event' index.html; then

    echo "TEST 6 PASS - Third column content found - 5 marks"
    MARKS=$((MARKS + 5))

else
    echo "TEST 6 FAIL - Third column content not found"
fi
```

else
echo "TEST 6 FAIL - Third column not created"
fi

# ----------------------------------------------

# TEST 7 - aside width

# ----------------------------------------------

if [ -f styles/Ex10_main.css ]; then

```
if grep -Eiq \
'aside[[:space:]]*\{[^}]*width[[:space:]]*:' \
styles/Ex10_main.css; then

    echo "TEST 7 PASS - Aside width found - 5 marks"
    MARKS=$((MARKS + 5))

else
    echo "TEST 7 FAIL - Aside width missing"
fi
```

else
echo "TEST 7 FAIL - CSS file missing"
fi

# ----------------------------------------------

# TEST 8 - aside float

# ----------------------------------------------

if [ -f styles/Ex10_main.css ]; then

```
if grep -Eiq \
'aside[[:space:]]*\{[^}]*float[[:space:]]*:' \
styles/Ex10_main.css; then

    echo "TEST 8 PASS - Aside float found - 5 marks"
    MARKS=$((MARKS + 5))

else
    echo "TEST 8 FAIL - Aside float missing"
fi
```

else
echo "TEST 8 FAIL - CSS file missing"
fi

# ----------------------------------------------

# TEST 9 - footer clear

# ----------------------------------------------

if [ -f styles/Ex10_main.css ]; then

```
if grep -Eiq \
'footer[[:space:]]*\{[^}]*clear[[:space:]]*:[[:space:]]*both' \
styles/Ex10_main.css; then

    echo "TEST 9 PASS - footer clear: both found - 5 marks"
    MARKS=$((MARKS + 5))

else
    echo "TEST 9 FAIL - footer clear: both missing"
fi
```

else
echo "TEST 9 FAIL - CSS file missing"
fi

# ----------------------------------------------

# TEST 10 - Original content

# ----------------------------------------------

CONTENT_OK=1

grep -Fqi "San Joaquin Valley Town Hall" index.html || CONTENT_OK=0
grep -Fqi "Our Mission" index.html || CONTENT_OK=0
grep -Fqi "Speaker of the Month" index.html || CONTENT_OK=0
grep -Fqi "Our Ticket Packages" index.html || CONTENT_OK=0
grep -Fqi "Guest speakers" index.html || CONTENT_OK=0

if [ "$CONTENT_OK" -eq 1 ]; then

```
echo "TEST 10 PASS - Original content retained - 5 marks"
MARKS=$((MARKS + 5))
```

else

```
echo "TEST 10 FAIL - Original content missing"
```

fi

# ----------------------------------------------

# FINAL SCORE

# ----------------------------------------------

echo ""
echo "=============================================="
echo " FINAL RESULT"
echo "=============================================="

echo "Marks Obtained : $MARKS / $TOTAL"
echo "Percentage     : $((MARKS * 100 / TOTAL))%"

echo "=============================================="

if [ "$MARKS" -ge 25 ]; then
echo "RESULT: PASS"
exit 0
else
echo "RESULT: FAIL"
exit 1
fi
