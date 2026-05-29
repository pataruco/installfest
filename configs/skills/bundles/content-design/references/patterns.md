# Content Patterns — Full Reference

Patterns for specific content types. Each pattern includes the principle, structure,
examples, and common mistakes.

## Table of Contents

1. Error messages
2. Empty states
3. Form labels and hint text
4. Confirmation and success messages
5. Notifications and alerts
6. Onboarding and first-run experiences
7. Calls to action
8. Navigation and wayfinding
9. Help and instructional text
10. Destructive action warnings
11. Loading and progress states
12. Accessibility-specific content

---

## 1. Error messages

Error messages are some of the most important content in any service. The user is stuck.
They need to get unstuck. Every second of confusion costs trust.

### Structure

A good error message has three parts:

1. **What happened** — describe the problem in human terms
2. **Why it happened** — if relevant, a brief cause (skip if obvious)
3. **What to do next** — the most important part. Give the user a path forward

### Tone

Calm, specific, and helpful. Never blame the user. Never be vague.

### Examples

Bad: "Error 403: Forbidden"
Good: "You do not have access to this page. Ask your team admin to invite you."

Bad: "Invalid input"
Good: "Enter a phone number with 10 or 11 digits, like 07700 900000"

Bad: "Something went wrong. Please try again later."
Good: "We could not load your messages. Check your internet connection and try again."
(And if "try again later" is genuinely the only option, say roughly how long.)

Bad: "Oops! That didn't work 😬"
Good: "We could not save your changes. Your internet connection may have dropped — check
your connection and try again."

### Common mistakes

- **Vagueness**: "An error occurred" tells the user nothing
- **Technical leaking**: "NullPointerException at line 342" / "Error code: ERR_CONN_REFUSED"
- **Blame**: "You entered an invalid date" → "Enter a date in the format DD/MM/YYYY"
- **False reassurance**: "Don't worry!" — this is content for the writer's comfort, not the user's
- **Missing the fix**: describing the problem without explaining how to resolve it
- **Excessive personality**: an error message is not the place for jokes or brand voice

### Inline validation vs. summary errors

- Use inline validation for immediate, field-level errors (shown next to the field)
- Use a summary at the top of a form for submission-level errors
- Link each summary item to the relevant field
- Keep inline messages extremely concise: "Enter your last name"
- Summary messages can include slightly more context: "Enter your last name — we need this to
  verify your identity"

---

## 2. Empty states

An empty state is a screen with no content yet — no items, no data, no history. It's
an opportunity, not a dead end.

### Purpose

An empty state should:

1. Explain why there's nothing here (is it new? filtered to nothing? an error?)
2. Guide the user toward the action that will fill this space
3. Reassure them this is expected (if it is)

### Structure

1. **A clear, friendly headline** — describes the state, not the absence
2. **A brief explanation** — why it's empty and what goes here
3. **A primary action** — the thing they should do next

### Examples

Bad: "No results found."
Good: "No results for 'quarterly report'. Try a broader search or check for typos."

Bad: "Your inbox is empty."
Good: "No messages yet. Messages from your team will appear here."

Bad: (Completely blank screen with no guidance)
Good: "You haven't created any projects yet. Create your first project to get started."
[Button: Create project]

### Types of empty state

- **First use**: the user is new, nothing exists yet → welcome and guide
- **No results**: a search or filter returned nothing → help them adjust
- **Cleared/completed**: they've dealt with everything → celebrate briefly, suggest what's next
- **Error-caused**: data failed to load → treat as an error message, not an empty state

---

## 3. Form labels and hint text

Forms are where content design and interaction design meet most directly.
Every label, hint, and error message is a design decision.

### Labels

- Be concise and specific: "Email address" not "Please provide your email address"
- Use sentence case
- Label every input — don't rely on placeholder text as a label (it disappears on focus
  and is an accessibility problem)
- Match the label to what the user would call it, not your internal system name

### Hint text

Hint text (sometimes called help text) sits below or near the label. It provides
additional context the user needs to fill in the field correctly.

- Only add hint text if users actually need it — don't add it to every field
- Be specific: "Must be at least 8 characters with a number and a letter"
  not "Enter a strong password"
- If the format matters, show the format: "DD/MM/YYYY" or "07700 900000"
- Keep it to one line if possible

### Placeholder text

- Never use placeholder text as a replacement for labels
- Placeholder text should be an example, not an instruction: "e.g. name@company.com"
- Remember: placeholder text disappears on focus and has low contrast — don't put
  anything essential in it

### Required vs optional

- If most fields are required, mark the optional ones "(optional)"
- If most fields are optional, mark the required ones "(required)"
- Don't use asterisks (\*) without explanation — not everyone knows what they mean
- Don't use colour alone to indicate required fields

### Grouping

- Group related fields logically (address fields together, contact details together)
- Use fieldsets and legends for screen reader users
- Order fields in the sequence the user would naturally think of them

---

## 4. Confirmation and success messages

The user has completed a task. Now they need to know it worked and what happens next.

### Structure

1. **Confirm the action**: "Application submitted" / "Password changed" / "Payment received"
2. **What happens next**: "We'll email you within 3 working days" / "You can now sign in"
3. **What to do now** (if applicable): "Return to dashboard" / "View your receipt"

### Examples

Bad: "Success!"
Good: "Your password has been changed. You can now sign in with your new password."

Bad: "Thank you for your submission. We appreciate your patience and will be in touch."
Good: "Application submitted. We'll email you a decision within 5 working days."

### Tone

Confirmation messages can be slightly warmer than other UI content, but don't overdo
the celebration. Completing a tax return is not the same as completing a game level.
Match the emotional weight of the task:

- Filing a tax return: "Tax return submitted. You'll receive a confirmation email shortly."
- Finishing a course: "Course completed! You'll find your certificate in your profile."
- Deleting an account: "Your account has been deleted. We've sent a confirmation email to
  your address."

---

## 5. Notifications and alerts

Notifications interrupt the user. That interruption must be worth it.

### When to notify

Ask: does the user need to know this right now? If not, don't notify.

- **Time-sensitive action needed**: yes, notify
- **Something completed that they were waiting for**: yes
- **FYI/marketing**: probably not — or at least make it dismissible and non-blocking
- **System status the user didn't ask about**: probably not

### Structure

1. **What happened or what's needed** — the headline
2. **Enough context to decide** — do they need to act, or just know?
3. **Action (if applicable)** — a direct link or button to the relevant place

### Alert levels

- **Informational**: neutral, "Your export is ready to download"
- **Warning**: something needs attention but isn't urgent, "Your trial ends in 3 days"
- **Error/critical**: something is wrong and needs action, "Payment failed — update your card"
- **Success**: confirming something went well, "Changes saved"

Match the visual weight (colour, icon, position) to the severity. Don't cry wolf —
if everything is an alert, nothing is.

---

## 6. Onboarding and first-run experiences

Onboarding is teaching by doing, not teaching before doing. The best onboarding
gets out of the way as quickly as possible.

### Principles

- **Show, don't tell**: let users learn by using the product, not by reading about it
- **One thing at a time**: don't dump a 5-slide tutorial on a new user
- **Progressive**: reveal features as they become relevant
- **Skippable**: always let users skip or dismiss onboarding
- **Recoverable**: users should be able to find onboarding help again later

### Common mistakes

- **The feature tour**: a carousel of 5 screens explaining things the user hasn't tried yet.
  They won't remember any of it.
- **Tooltip overload**: pointing at every UI element at once
- **Blocking setup**: requiring 10 fields of information before the user sees any value
- **No clear first action**: leaving the user on a blank screen with no guidance

### Better patterns

- An empty state that suggests the first action
- A single, contextual tooltip that appears when the user reaches the relevant feature
- A checklist of 3-4 setup tasks they can complete at their own pace
- Inline guidance that disappears once the user has done the thing

---

## 7. Calls to action

A call to action (CTA) tells the user what they can do. It should be specific,
action-oriented, and honest about what happens next.

### Button and link labels

Use a verb that describes what will happen: "Save changes", "Download receipt",
"Send application"

Avoid:

- "Click here" — meaningless, and assumes a mouse
- "Submit" — vague. Submit what?
- "Learn more" — learn more about what? Be specific
- "OK" / "Cancel" — only acceptable in very obvious contexts (simple confirmations)
- "Yes" / "No" — fine for binary confirmations, but consider being specific:
  "Delete project" / "Keep project" instead of "Yes" / "No"

### Primary vs secondary actions

Every screen should have a clear primary action. If there are multiple actions,
establish a visual hierarchy:

- **Primary**: the main thing the user is here to do — visually prominent
- **Secondary**: alternatives — visually present but less prominent
- **Tertiary**: rarely-used actions — text links or less prominent buttons

Don't give equal visual weight to "Delete account" and "Save changes."

### Destructive actions

See section 10. Destructive actions deserve their own pattern.

---

## 8. Navigation and wayfinding

Navigation labels are content. They help users build a mental model of the service.

### Principles

- Use words the user uses, not internal team names
- Be concise: "Settings" not "Account settings and preferences"
- Be consistent: if it's called "Projects" in the nav, don't call it "Your work" elsewhere
- Front-load: "Billing history" not "View your billing history"

### Breadcrumbs

- Show the path from the top level to the current page
- Each breadcrumb should be a clickable link (except the current page)
- Use > or / as separators, not custom icons
- Match breadcrumb labels exactly to page titles

### Page titles

- The page title should describe what's on the page: "Your applications" not "Dashboard"
- Page titles appear in browser tabs, bookmarks, search results, and screen reader
  navigation — make them specific and useful out of context

---

## 9. Help and instructional text

Help text should exist only because the interface cannot be made self-explanatory.
If you're writing a lot of help text, the design may need to change.

### Contextual help

- Place help text near the thing it explains
- Keep it concise — one or two sentences
- Consider a "Learn more" link to detailed guidance rather than inline walls of text
- Use progressive disclosure: show the basic instruction, hide the edge cases

### Instructional pages

For longer guidance (how-to pages, setup guides):

1. Start with what the user needs to achieve, not background
2. Use numbered steps for sequential tasks
3. One action per step
4. Start each step with a verb
5. Include what the user should see or expect at each point
6. End with what happens next / confirmation of success

### Tone

Help text should be patient and clear, never condescending. Assume the user is
intelligent but unfamiliar. Don't say "simply" or "just" — if it were simple,
they wouldn't need help text.

---

## 10. Destructive action warnings

A destructive action is irreversible or has significant consequences: deleting data,
removing access, cancelling a subscription, sending a message to many people.

### Structure

1. **What will happen**: be specific about the consequences
2. **What will be lost**: "Your 47 projects and all associated files will be permanently deleted"
3. **Whether it's reversible**: "This cannot be undone" (if true — don't say it if it can be undone)
4. **An alternative** (if applicable): "You can deactivate your account instead, which keeps your data"
5. **Clear actions**: the destructive button should name the action ("Delete account"),
   and the safe option should be the visually primary one ("Keep account")

### Examples

Bad: "Are you sure?" [Yes] [No]
Good: "Delete 'Q3 Report'? This will permanently remove the file and its 12 comments.
This cannot be undone." [Keep file] [Delete file]

Bad: "Warning: this action is irreversible." [OK] [Cancel]
Good: "Cancel your subscription? You'll lose access to premium features on 15 April 2025.
You can resubscribe at any time." [Keep subscription] [Cancel subscription]

### Design considerations

- Never make the destructive action the default or visually primary button
- Consider a confirmation mechanism (typing the name to confirm, a delay before the button activates)
- Don't rely solely on colour to distinguish safe from destructive actions (accessibility)

---

## 11. Loading and progress states

Users need to know the system is working. Silence feels like failure.

### Short waits (under 2-3 seconds)

- A spinner or skeleton screen is sufficient
- No text needed unless the context is ambiguous

### Longer waits (3-30 seconds)

- Tell the user what's happening: "Loading your messages..."
- If possible, show progress: "Uploading 3 of 7 files..."
- Avoid false precision — a percentage bar that stalls at 99% is worse than a spinner

### Very long waits (30+ seconds)

- Set expectations upfront: "This usually takes 1-2 minutes"
- Let the user do something else: "We'll email you when it's ready"
- If in the background, show status in a non-blocking way

### Common mistakes

- "Loading..." with no context about what's loading
- A progress bar that doesn't actually reflect progress
- No indication that anything is happening at all
- "Please wait" — add what they're waiting for

---

## 12. Accessibility-specific content

Beyond general accessibility principles (covered in the principles reference),
some content types have specific accessibility requirements.

### Alt text

- Describe the function, not just the appearance
- For informational images: describe what the image conveys
- For decorative images: use empty alt (alt="")
- For charts/graphs: describe the trend or key finding, not every data point
- For complex images: consider a longer description in adjacent text or a details/summary
- Keep alt text under about 125 characters (screen readers may truncate)
- Don't start with "Image of..." — screen readers already announce it as an image

### ARIA labels

- Use aria-label when visible text is insufficient (e.g., an icon-only button)
- The ARIA label should match the action: aria-label="Close dialog" not aria-label="X"
- For repeated elements, differentiate: aria-label="Remove project Alpha"
  not just aria-label="Remove"
- Keep ARIA labels concise and action-oriented

### Screen reader announcements

- For dynamic content (live regions), announce meaningful changes only
- Don't announce every minor UI update — it's noisy and unhelpful
- Status messages should be concise: "3 results found" not "We've found 3 results
  matching your search criteria"
- Error announcements should identify the problem and the field

### Skip links

- Provide "Skip to main content" as the first focusable element
- Label skip links clearly
- Ensure they work — test with keyboard navigation

### Link text

- Links should make sense out of context (screen reader users navigate by links)
- "Read the accessibility guidelines" not "click here"
- Don't use the URL as link text unless the URL itself is the information
- Group related information so link text has enough surrounding context
