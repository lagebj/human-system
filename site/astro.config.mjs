import { defineConfig } from 'astro/config';

// https://astro.build/config
export default defineConfig({
  site: 'https://lagebj.github.io',
  base: '/human-system',
  compressHTML: true,
  build: {
    inlineStylesheets: 'auto',
  },
});
