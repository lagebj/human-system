#!/usr/bin/env node

/**
 * Historical Overlap Detection
 * 
 * Checks generated reader-facing prose against historical raw corpus and thought-trail fragments.
 * Detects suspicious reuse of historical corpus wording.
 * 
 * Usage: node overlap-check.js <generated-text-file> <corpus-directory>
 */

const fs = require('fs');
const path = require('path');

// Configuration
const MIN_NGRAM_LENGTH = 11; // Flag sequences of 11+ words
const COMMON_PHRASES = [
  'i think', 'it depends', 'i am not sure', 'i do not know',
  'i have noticed', 'i want to', 'i need to', 'we need to',
  'do we really need', 'should we', 'could we', 'what about',
  'for example', 'in other words', 'that is', 'this is',
  'people and their', 'systems are', 'systems contain',
  'official and unofficial', 'love and hate', 'feelings and'
];

function tokenize(text) {
  return text
    .toLowerCase()
    .replace(/[.,!?;:()"\[\]{}]/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
    .split(' ')
    .filter(w => w.length > 0);
}

function extractNgrams(tokens, n) {
  const ngrams = [];
  for (let i = 0; i <= tokens.length - n; i++) {
    ngrams.push(tokens.slice(i, i + n).join(' '));
  }
  return ngrams;
}

function isCommonPhrase(phrase) {
  const lower = phrase.toLowerCase();
  return COMMON_PHRASES.some(common => lower.includes(common));
}

function isProjectTerminology(phrase) {
  const projectTerms = [
    'matchboard', 'human system', 'it depends', 'org chart',
    'pre-match', 'post-match', 'backfill', 'locking',
    'evidence', 'state model', 'decision maker'
  ];
  const lower = phrase.toLowerCase();
  return projectTerms.some(term => lower.includes(term));
}

function loadCorpusFiles(corpusDir) {
  const files = [];
  
  function walk(dir) {
    const entries = fs.readdirSync(dir, { withFileTypes: true });
    for (const entry of entries) {
      const fullPath = path.join(dir, entry.name);
      if (entry.isDirectory()) {
        // Skip compiled directory - we want raw corpus only
        if (entry.name === 'compiled') continue;
        walk(fullPath);
      } else if (entry.isFile() && entry.name.endsWith('.md')) {
        const content = fs.readFileSync(fullPath, 'utf-8');
        // Strip markdown headers and metadata for comparison
        const text = content.replace(/^#+\s+.+$/gm, '')
                           .replace(/^>\s+.+$/gm, '')
                           .replace(/^-\s+.+$/gm, '')
                           .replace(/^\d+:\s+/gm, '');
        files.push({ path: fullPath, text, tokens: tokenize(text) });
      }
    }
  }
  
  walk(corpusDir);
  return files;
}

function checkOverlap(generatedText, corpusFiles) {
  const generatedTokens = tokenize(generatedText);
  const generatedNgrams = extractNgrams(generatedTokens, MIN_NGRAM_LENGTH);
  const overlaps = [];
  
  for (const ngram of generatedNgrams) {
    // Skip common phrases and project terminology
    if (isCommonPhrase(ngram)) continue;
    if (isProjectTerminology(ngram)) continue;
    
    for (const corpusFile of corpusFiles) {
      const corpusNgrams = extractNgrams(corpusFile.tokens, MIN_NGRAM_LENGTH);
      
      for (const corpusNgram of corpusNgrams) {
        if (ngram === corpusNgram) {
          overlaps.push({
            phrase: ngram,
            length: ngram.split(' ').length,
            sourceFile: corpusFile.path,
            context: getCorpusContext(corpusFile.text, ngram)
          });
        }
      }
    }
  }
  
  return overlaps;
}

function getCorpusContext(fullText, phrase) {
  const index = fullText.toLowerCase().indexOf(phrase);
  if (index === -1) return '';
  
  const start = Math.max(0, index - 50);
  const end = Math.min(fullText.length, index + phrase.length + 50);
  const prefix = start > 0 ? '...' : '';
  const suffix = end < fullText.length ? '...' : '';
  
  return prefix + fullText.slice(start, end) + suffix;
}

function main() {
  const args = process.argv.slice(2);
  
  if (args.length < 2) {
    console.error('Usage: node overlap-check.js <generated-text-file> <corpus-directory>');
    process.exit(1);
  }
  
  const [generatedFile, corpusDir] = args;
  
  if (!fs.existsSync(generatedFile)) {
    console.error(`Error: Generated text file not found: ${generatedFile}`);
    process.exit(1);
  }
  
  if (!fs.existsSync(corpusDir)) {
    console.error(`Error: Corpus directory not found: ${corpusDir}`);
    process.exit(1);
  }
  
  const generatedText = fs.readFileSync(generatedFile, 'utf-8');
  const corpusFiles = loadCorpusFiles(corpusDir);
  
  console.log(`Checking overlap...`);
  console.log(`Generated text: ${generatedFile}`);
  console.log(`Corpus directory: ${corpusDir}`);
  console.log(`Corpus files loaded: ${corpusFiles.length}`);
  console.log(`Minimum n-gram length: ${MIN_NGRAM_LENGTH} words`);
  console.log('---');
  
  const overlaps = checkOverlap(generatedText, corpusFiles);
  
  if (overlaps.length === 0) {
    console.log('✓ No suspicious historical overlap detected.');
    process.exit(0);
  } else {
    console.log(`⚠ Found ${overlaps.length} suspicious overlap(s):\n`);
    
    overlaps.forEach((overlap, i) => {
      console.log(`${i + 1}. Phrase (${overlap.length} words): "${overlap.phrase}"`);
      console.log(`   Source: ${overlap.sourceFile}`);
      console.log(`   Context: ${overlap.context}\n`);
    });
    
    console.log('---');
    console.log('Review these overlaps. They may indicate:');
    console.log('- Historical corpus contamination (remove and regenerate)');
    console.log('- Legitimate current-seed language (preserve)');
    console.log('- Common phrases or project terminology (ignore)');
    
    process.exit(overlaps.length > 0 ? 1 : 0);
  }
}

main();
