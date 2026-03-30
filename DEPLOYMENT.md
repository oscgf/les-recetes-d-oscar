# Deploy to Vercel Instructions

## Prerequisites
- Push your code to GitHub
- Have your Supabase credentials ready

## Step 1: Deploy to Vercel

1. Go to [vercel.com](https://vercel.com) and sign up/login
2. Click "Add New..." → "Project"
3. Import your GitHub repository
4. Vercel will automatically detect it's an Astro project

## Step 2: Configure Environment Variables

In your Vercel project dashboard:

1. Go to "Settings" → "Environment Variables"
2. Add these variables:
   ```
   PUBLIC_SUPABASE_URL=https://your-project.supabase.co
   PUBLIC_SUPABASE_ANON_KEY=your-anon-key
   ```
3. Replace with your actual Supabase credentials

## Step 3: Deploy

1. Click "Deploy"
2. Wait for the build to complete
3. Your site will be live at `your-project-name.vercel.app`

## Step 4: Verify

- Visit your live site
- Test authentication (login/register)
- Try adding a recipe
- Check that images display correctly

## Automatic Updates

Every time you push to your main branch, Vercel will automatically redeploy your site.

## Troubleshooting

If you get build errors:
- Check that environment variables are set correctly
- Ensure your Supabase project is accessible
- Verify the build completes locally with `npm run build`

## Cost

This deployment is completely free using Vercel's Hobby tier.
