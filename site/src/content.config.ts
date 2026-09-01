import { defineCollection, z } from 'astro:content';
import { glob } from 'astro/loaders';

const papers = defineCollection({
  loader: glob({ pattern: '**/paper-*.md', base: '../papers/published' }),
  schema: z.object({
    title: z.string().min(1, 'Title is required'),
    description: z.string().min(1, 'Description is required'),
    published: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, 'Published date must be YYYY-MM-DD'),
    updated: z.string().regex(/^\d{4}-\d{2}-\d{2}$/, 'Updated date must be YYYY-MM-DD').optional(),
    topics: z.array(z.string()).optional(),
    status: z.literal('published').default('published'),
  }),
});

export const collections = {
  papers,
};
