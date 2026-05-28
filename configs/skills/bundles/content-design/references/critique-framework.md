# Content Critique Framework

A structured approach to reviewing user-facing content. Use this when performing a content
review, audit, or critique.

## Table of Contents
1. Before you start — context gathering
2. The critique dimensions
3. Readability assessment
4. Delivering the critique

---

## 1. Before you start — context gathering

A content critique without context is just opinion. Before evaluating content, establish:

- **Who is the user?** — audience, expertise level, likely emotional state
- **What is the user trying to do?** — the task, the goal
- **Where does this content sit in the journey?** — what came before, what comes after
- **What channel/device?** — mobile, desktop, email, notification, print
- **What constraints exist?** — character limits, brand guidelines, legal requirements,
  translation needs, technical limitations

If the user hasn't provided this context, ask for it. Your critique will be sharper for it.
If they can't or won't provide it, state your assumptions explicitly at the start of the
critique so they can correct them.

---

## 2. The critique dimensions

Evaluate content across these dimensions. Not every dimension applies to every piece of
content — use judgment about which are most relevant.

### A. Task alignment

Does this content help the user complete their task?

- Is the user need clear? Can you state what the user is trying to do?
- Does the content provide the information needed to act?
- Is there anything missing that the user would need?
- Is there anything present that the user does not need?
- Does the content support the user's decision-making?

### B. Clarity

Can the user understand this content quickly and correctly?

- Is the language plain and free of unnecessary jargon?
- Are sentences short and focused on one idea each?
- Is information front-loaded (most important first)?
- Are instructions specific enough to follow?
- Could this be misinterpreted? (Try to misread it — if you can, a user will)

### C. Scannability

Can the user find what they need without reading everything?

- Is the content structured with headings, lists, or other visual hierarchy?
- Do headings accurately describe what follows?
- Is the most critical information visible without scrolling or clicking?
- Can a user get the gist by scanning headings and the first sentence of each paragraph?

### D. Tone and register

Is the tone appropriate for the context and audience?

- Does the tone match the emotional weight of the situation?
- Is it consistent with the rest of the service/product?
- Does it avoid condescension, blame, excessive informality, or corporate emptiness?
- Would the user feel respected reading this?

### E. Actionability

Does the user know what to do next?

- Is there a clear next step or call to action?
- Are calls to action specific (not "click here" or "submit")?
- If there are multiple actions, is the hierarchy clear?
- For errors: is the fix explained, not just the problem?

### F. Accuracy and specificity

Is the content precise and truthful?

- Are specific details provided where the user would expect them (times, dates, amounts)?
- Are vague qualifiers avoided ("quickly", "easy", "may", "some")?
- Does the content promise only what the system can deliver?
- Are edge cases and exceptions handled or acknowledged?

### G. Consistency

Is this content consistent with itself and the broader service?

- Are terms used consistently (not "account" in one place and "profile" in another)?
- Are patterns consistent (if error messages follow a structure, do all of them)?
- Does the tone match the rest of the service?
- Are capitalisation, number formats, and date formats consistent?

### H. Inclusivity

Does this content work for everyone?

- Is the language gender-neutral?
- Are assumptions about the user's knowledge, ability, or context appropriate?
- Would this work for non-native English speakers?
- Are cultural references or idioms used that might not translate?
- Is the content accessible to users of assistive technology?

### I. Accessibility

Does this content meet accessibility requirements?

- Do images have appropriate alt text?
- Is heading hierarchy logical?
- Do links make sense out of context?
- Are error messages associated with their fields?
- Is colour used as the only indicator of meaning anywhere?
- Would this content work with a screen reader?

### J. Content efficiency

Is every word earning its place?

- Could this be shorter without losing meaning or helpfulness?
- Are there redundancies (saying the same thing twice in different words)?
- Are there filler phrases ("in order to", "please note that", "it should be noted")?
- Is there content that serves the organisation but not the user?
- Could any of this content be replaced by better design?

---

## 3. Readability assessment

When reviewing content for general audiences, assess readability.

### Metrics to consider

- **Reading level**: aim for age 9-11 for general public content. You can assess this
  by looking at word length, sentence length, and use of common vocabulary
- **Average sentence length**: 15-20 words is ideal for digital content
- **Paragraph length**: 2-4 sentences for digital
- **Use of passive voice**: flag excessive passive constructions
- **Nominalisations**: flag verbs turned into nouns

### Caveats

Readability metrics are a tool, not a target. A piece of content can score well on
readability tests and still be confusing because it's poorly structured, assumes context
the user doesn't have, or buries the key information. Use metrics as one input,
not the final judgment.

For specialist audiences, readability scores are less relevant. Domain terminology
is expected and appropriate — the question is whether the sentence structure, organisation,
and progressive disclosure still work.

---

## 4. Delivering the critique

### Structure your critique

1. **State the context**: what the content is, who it's for, where it sits in the journey
   (using what you've been told or your stated assumptions)
2. **What's working**: always start here. Acknowledge what the content does well.
   This isn't just politeness — it tells the content author what to keep.
3. **Issues and recommendations**: for each issue, provide:
   - What the issue is
   - Why it matters (the impact on the user, not just a rule violation)
   - A suggested rewrite or approach
4. **Rewritten version**: provide the full revised content, incorporating all your changes.
   This gives the author something concrete to work with or react to.

### Critique principles

- **Be specific**: "The error message is unclear" is not useful. "The error message says
  'invalid input' but doesn't tell the user what valid input looks like" is useful.
- **Explain the why**: don't just cite a rule. Explain what happens for the user when
  the rule is violated. "Front-load the key information because users scan the first
  few words and the current heading buries the action verb."
- **Offer alternatives**: don't just say what's wrong — show what right looks like.
  Even if your rewrite isn't perfect, it gives something concrete to iterate on.
- **Pick your battles**: flag everything you notice, but prioritise. Distinguish between
  "this will cause users to fail" and "this could be slightly better."
- **Respect the constraints**: if there's a character limit, brand guideline, or legal
  requirement, work within it. Note when a constraint is actively harming the user
  experience, but offer solutions that respect the constraint first.
- **Consider the author**: they've made decisions for reasons you might not see. Frame
  suggestions as alternatives to consider, not corrections to mistakes — unless
  the issue is clear-cut (factual error, accessibility failure, user-hostile content).
