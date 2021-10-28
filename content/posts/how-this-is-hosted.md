---
title: "How This Is Hosted"
date: 2021-10-28T05:45:35-04:00
draft: true
---

One of the primary challenges I have run into when chosing to write a blog is the ever important question: `How will I host this thing?`

This usually starts off as an existential crisis as there are so many ways you can host a static website! Here's a short list:
- selfhosted webserver(`nginx|apache|caddy`) on some machine
- GitHub/gitlab pages
- Bucket on a cloud provider
- CloudRun instance
- `Netlify|Vercel|Firebase` like static hosting option

This is not even an exhaustive list! So the question always comes down to how much time and effort am I willing to put in, and how much am I willing to pay for a website? 

## Requirements
This time I want to think about this slightly differently and ask myself, what are my needs? I want:
- no servers to maintain
- minimal external dependencies(looking at you npm)
- under $10/month that can scale if a post hits hackernews or reddit
- Living in GCP since that's the cloud provider I want to further explore
- Some sort of preview environment(IE, PR with a draft should be available for me to consume)

## Solution Options

### Self Hosted

Given these requirements, a selfhosted solution is immediately ruled out. If you haven't had the pleasure of maintaining a single virtual machine, it is not easy without careful planning ahead of time. You need some level automation to keep the OS patched, knowledge on ensuring the machine is secure from external threats, and some way of ensuring that it can scale effectively. These are all solved problems that are well written, but the toil will take my focus away from actually doing research writing posts about them.

### Github/Gitlab

GitHub/Gitlab pages seems like an interesting choice. The general idea is that you have a repository that Git(`hub|lab`) are aware of, and you get a vanity url such as `https://pokom.github.com`. You can then point a DNS record for `blog.markpoko.com` to the vanity url and voila, you have a hosted static website! This doesn't meet the requirement to live in GCP, but that's not entirely important. I do not **believe** either provides the ability for a vanity URL. 


