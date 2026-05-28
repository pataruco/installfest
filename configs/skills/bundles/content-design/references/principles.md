# Content Design Principles — Full Reference

## Table of Contents

1. Start with user needs
2. Front-loading
3. Plain language
4. Sentence and paragraph structure
5. Active voice and direct address
6. Specificity over abstraction
7. Scannability and structure
8. Progressive disclosure
9. Content in context — the user journey
10. Accessibility as a baseline
11. Inclusive language
12. Tone and register
13. Numbers, dates, and data
14. Internationalisation considerations

---

## 1. Start with user needs

Every piece of content exists because a user has a need. Before writing anything, answer:

- Who is the user?
- What are they trying to do?
- What do they need to know to do it?
- What's their emotional state at this point in the journey?
- What have they already seen or done before arriving here?

If you cannot answer these questions, the content is not ready to be written. Push back
and ask for context.

User needs are not the same as business requirements. "We need users to verify their email"
is a business requirement. The user need is "I need to know what to do next after signing up
and why." The content should serve the user need, which in turn fulfils the business requirement.

### Evidence over assumption

Where possible, content decisions should be based on evidence: user research, analytics,
search data, support tickets, usability testing. When evidence is not available, state your
assumptions explicitly so they can be tested.

---

## 2. Front-loading

People scan. The first two words of any sentence, heading, or paragraph do the most work.
Put the most important information first — at every level.

**At the page level:** lead with what the user needs to know, not background context.

Bad: "Since the introduction of the 2019 Digital Services Act, all organisations providing
online services to EU citizens have been required to..."
Good: "You must make your online service accessible if you serve EU citizens."

**At the paragraph level:** the first sentence should carry the key point. Subsequent sentences
support or elaborate.

**At the sentence level:** lead with the action or the outcome, not the condition.

Bad: "If you have a valid passport, you can apply online."
Good: "You can apply online if you have a valid passport."

**In lists:** front-load each item so users can scan the first word or two.

Bad:

- To submit your application, click the green button
- For checking your status, use the dashboard

Good:

- Submit your application — click the green button
- Check your status — use the dashboard

---

## 3. Plain language

Plain language is not about dumbing down. It is about removing barriers between the user
and the information they need.

### Word choice

Use everyday words. If a simpler synonym exists and means the same thing, use it.

| Instead of            | Use        |
| --------------------- | ---------- |
| commence              | start      |
| terminate             | end / stop |
| utilise               | use        |
| facilitate            | help       |
| in order to           | to         |
| prior to              | before     |
| subsequent to         | after      |
| in the event of       | if         |
| at this point in time | now        |
| a number of           | some       |
| in excess of          | more than  |
| with regard to        | about      |

### Jargon

Avoid jargon unless writing for a specialist audience who uses those terms daily.
If you must use a technical term, explain it on first use — or better, link to a definition.

When writing for developers or other specialists, domain-specific terms are fine
(API, endpoint, deployment, pipeline). But bureaucratic jargon is not the same as
domain language. "Leverage our API endpoints to facilitate seamless integrations" is jargon.
"Use the API to connect your app" is plain language with domain terms.

### Nominalisations

Avoid turning verbs into nouns. They make sentences longer and harder to parse.

Bad: "The implementation of the system will result in an improvement in performance."
Good: "The new system will improve performance."

---

## 4. Sentence and paragraph structure

### Sentences

- One idea per sentence
- Aim for 15-20 words on average (not a hard rule — vary for rhythm)
- If a sentence has more than 25 words, look for a way to split it
- Avoid subordinate clauses piling up — if you have to re-read it, so will the user

### Paragraphs

- One topic per paragraph
- 2-4 sentences is usually right for digital content
- Single-sentence paragraphs are fine and useful for emphasis
- A wall of text is a wall between the user and what they need

### Connectives

Use simple connectives: and, but, so, because. These keep the reader moving.
Avoid: however, therefore, furthermore, notwithstanding, accordingly.
"However" is fine in long-form or formal content, but "but" does the same job faster.

---

## 5. Active voice and direct address

Active voice makes it clear who is doing what. Passive voice hides the actor and
often hides responsibility.

Bad: "Your application will be reviewed within 5 working days."
Good: "We'll review your application within 5 working days."

Even better when you address the user directly: "You'll hear from us within 5 working days."

### When passive is OK

- When the actor genuinely doesn't matter: "The building was completed in 1923"
- When you deliberately want to de-emphasise the actor for sensitivity:
  "Your account has been suspended" (softer than "We've suspended your account" in some contexts)

But default to active. Most passive constructions in UI copy are laziness, not intentional choice.

---

## 6. Specificity over abstraction

Users need concrete information to make decisions and take action. Vague reassurances
and abstract descriptions create uncertainty.

Bad: "This may take some time."
Good: "This usually takes about 3 minutes."

Bad: "You may be eligible for support."
Good: "You can get support if you earn less than £25,000 a year."

Bad: "An error occurred."
Good: "We could not save your changes because the file is too large. The maximum file size is 10MB."

Specificity also applies to calls to action:

Bad: "Click here" / "Learn more" / "Submit"
Good: "Download your receipt" / "See the full pricing breakdown" / "Send your application"

---

## 7. Scannability and structure

People do not read digital content linearly. They scan for relevant information.
Your structure must support this.

### Headings

- Use headings to break content into scannable sections
- Headings should be descriptive — a user should understand the section content from the heading alone
- Front-load headings: "Apply for a passport" not "How to go about applying for a passport"
- Use sentence case, not title case (easier to scan)
- Maintain a logical hierarchy (don't skip from h2 to h4)

### Lists

- Use bulleted lists for items with no particular order
- Use numbered lists only for sequential steps
- Keep list items parallel in structure (all start with a verb, or all are noun phrases)
- Don't use lists for only two items — use a sentence instead

### Tables

- Use tables for data that needs comparison
- Always include clear column and row headers
- Don't use tables for layout

### Chunk information

Break complex content into logical chunks. Each chunk should answer one question or
support one task. Use headings, whitespace, and clear section boundaries.

---

## 8. Progressive disclosure

Don't give users everything at once. Provide information when they need it, not before.

This applies at multiple levels:

**Page level:** lead with what most users need. Put edge cases, exceptions, and
detailed guidance further down or behind a disclosure (details/summary, accordion, link).

**Journey level:** don't explain step 5 during step 1. Provide information relevant
to the current step and trust the flow to deliver the rest in context.

**Error level:** show the fix, not a treatise on what went wrong. Link to more detail
if needed.

Progressive disclosure is not hiding information — it's revealing it in the right order.
The user should never feel lost or uncertain about what to do next. They should always
know that more detail is available if they need it.

---

## 9. Content in context — the user journey

Content does not exist in isolation. Every screen, message, or notification sits within
a journey. A content designer must consider:

- **Where the user just came from** — what do they already know?
- **What they're trying to do right now** — what information do they need at this moment?
- **Where they're going next** — how does this content transition them?
- **What could go wrong** — what errors or edge cases need handling here?
- **What emotional state they're in** — are they anxious, frustrated, curious, rushed?

### Content and interaction design

Content and interaction design are inseparable. A content designer should be involved
in the design of flows, not just brought in to label them afterward. Questions to ask:

- Does the order of this flow match the user's mental model?
- Is this step necessary, or is it serving the system rather than the user?
- Could we eliminate this error message by designing the interaction differently?
- Is help text compensating for a confusing interface?
- Does the user have enough information to make a decision at this point?

---

## 10. Accessibility as a baseline

Accessible content is good content. These are not extras:

- Use descriptive link text (not "click here" — screen readers navigate by links)
- Write meaningful alt text that serves the same purpose as the image
- Use proper heading hierarchy for screen reader navigation
- Ensure content makes sense without colour as the only indicator
- Write error messages that identify the field and describe the problem
- Use ARIA labels that match what the user sees (or would expect)
- Keep content readable at 200% zoom
- Test content with screen readers and voice assistants

Alt text guidance: describe the function, not just the appearance. A photo of a team
on an "About us" page: "The customer support team at their London office" is better than
"Five people standing in front of a building."

For decorative images, use an empty alt attribute (alt="") — don't describe what doesn't matter.

---

## 11. Inclusive language

Content should not exclude, stereotype, or cause harm.

- Use gender-neutral language by default (they/them, "partner" not "husband/wife")
- Avoid ableist language ("crazy simple", "blind to the problem", "lame excuse")
- Don't use idioms or cultural references that don't translate
- Be careful with metaphors rooted in violence ("kill the process", "blast an email")
  in user-facing content (developer-facing content has different conventions)
- Use person-first or identity-first language based on community preference
  (disabled people — identity-first is preferred in the UK; person with a disability —
  person-first is more common in the US. Know your audience.)
- Avoid unnecessary references to age, gender, ethnicity, or ability

### Assumptions about the user

Don't assume:

- Technical knowledge (unless writing for a technical audience)
- Familiarity with your service or organisation
- English as a first language
- A specific device, connection speed, or ability
- That the user is happy to be here (they might be dealing with something stressful)

---

## 12. Tone and register

Tone should be appropriate to the context, not uniform across all content.

**Neutral/informational:** instructions, form labels, system messages
**Reassuring:** confirmation screens, first-time guidance, sensitive topics
**Urgent but calm:** error recovery, security warnings, data loss prevention
**Celebratory (with restraint):** task completion, milestones — don't overdo it

The underlying voice should be clear, confident, and respectful. Avoid:

- Overfamiliarity ("Hey there! Oops, something went wrong 😅")
- Corporate emptiness ("We value your patience during this process")
- Condescension ("It's easy! Just follow these simple steps")
- Blame ("You entered an invalid email")

Rewrite that last one: "Enter an email address in the format name@example.com"

---

## 13. Numbers, dates, and data

- Use numerals for numbers in UI contexts (even 1-9): "You have 3 items"
- Use words for vague quantities in prose: "a few minutes"
- Write dates in a clear, unambiguous format: "3 April 2025" (not "04/03/2025" which
  is ambiguous between UK and US formats)
- Use commas in large numbers: 1,000 / 10,000 / 1,000,000
- Use % not "percent" in UI contexts
- Present data with context: "3 of 10 completed" not just "30%"
- Avoid mixing formats in the same view

---

## 14. Internationalisation considerations

Even if your current audience speaks one language, content design choices affect
future translation:

- Avoid idioms and culturally-specific metaphors
- Leave space for text expansion (translated text can be 30-40% longer)
- Don't concatenate strings programmatically ("You have " + n + " items") —
  word order changes between languages
- Don't embed text in images
- Use ISO date formats or unambiguous written dates
- Be aware that number formats vary (1,000.00 vs 1.000,00)
- Icons and symbols can have different meanings across cultures
