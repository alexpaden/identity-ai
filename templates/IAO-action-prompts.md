# IAO Prompt Template

## IAO Format (GENERIC Original Structure)
IAO guiding principle: Explicitly separate each reasoning step into:
1. **Subquestion** (what needs to be addressed)
2. **Input** (relevant data/facts)
3. **Action** (the operation or process to perform)
4. **Output** (the result of applying the action to the input)

### **Template**
**Step [Number]:**  
- **Subquestion:** [Clearly defined subquestion]  
- **Input:** [Relevant facts / previous step’s output]  
- **Action:** [Explicit action or operation to perform]  
- **Output:** [Result from the action on the input]

---

## Example Usage (Referencing a Founder-Growth Prompt)

**Step 1:**  
- **Subquestion:** What is the potential short-term impact of "Meet key people (network expansion)"?  
- **Input:** Difficulty in finding relevant circles and converting intros into long-term relationships.  
- **Action:** Rate immediate strategic value (1–5 scale).  
- **Output:** Short-Term Impact = 3 (moderate immediate benefit; can quickly connect founders to vital resources).

**Step 2:**  
- **Subquestion:** What is the current difficulty in solving the networking problem?  
- **Input:** Challenges: shallow intros, unclear circles.  
- **Action:** Evaluate complexity on a 1–5 scale.  
- **Output:** Current Difficulty = 4 (complex due to external dependencies and personal outreach skills).

*(Continue similarly for additional steps, using **Subquestion**, **Input**, **Action**, **Output**.)*

---

## Modified Version (FOR SOME SITUATIONS)
Sometimes you only need broad categories rather than step-by-step actions. Below is a brief variant:

### **Category Analysis Template**
**Category:** [Problem/Topic Area]  
- **List Item:** [Name/Description of the item]  
  - **Input:** [Key facts, context]  
  - **Analysis Action:** [Categorize or assess according to chosen criteria]  
  - **Output:** [Concise conclusion or recommendation]

### **Example**
**Category:** Market Intel  
- **List Item:** “Track competitors (market intelligence)”  
  - **Input:** Limited public data, hype vs. genuine traction  
  - **Analysis Action:** Rate complexity (High, Medium, Low)  
  - **Output:** High complexity (difficult to confirm data accuracy)

---

## Customizing the Template
- **Granularity:** Add or remove steps depending on complexity (e.g., no subquestions for simpler tasks).  
- **Style:** Adapt fields (e.g., rename “Action” to “Method”) to fit domain jargon.  
- **Length:** Use short or extended explanations based on how detailed you need each reasoning step to be.  

*(Use this template directly in your prompts to ensure clear, traceable reasoning in LLM outputs.)*
