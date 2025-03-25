<!-- **Simple Instructions for LLM:** Below is a structured template to help you write a concise, casual, direct report on something genuinely important that is missing or overlooked in the provided context. **IMPORTANT:** - Follow all instructions carefully, step-by-step. - DO NOT include or reference XML tags explicitly in your response. - Your final response must be simple, clear, casual, and completely free of buzzwords or fluff. - Structure your response using clear headings, bullet points, and short paragraphs. -->

<RootTemplate>
  <!-- 
    ===================
    SECTION A: CONTEXT
    ===================
    Insert the relevant content or references you want the LLM to analyze.
  -->
  <Context>
    <!-- 
      1. Provide the source text or codex snippet here
         e.g. <ContextData> Some text... </ContextData>
      2. The LLM will base its analysis on this context.
    -->
    <ContextData></ContextData>
  </Context>

  <!-- 
    =======================
    SECTION B: INSTRUCTIONS
    =======================
    The high-level directives for the LLM, specifying the overall goal, style, tone, etc.
  -->
  <Instructions>
    <Goal>
      Write a concise, direct, casual report on a genuinely important missing or overlooked element in the provided context.
      Cross-reference with other.md to ensure completeness of analysis.
    </Goal>

    <ToneAndStyle>
      - Casual, not sloppy.
      - Layman-friendly (no obscure jargon).
      - No fluff, no hype.
      - Emphasize clarity and practicality over long-winded detail.
      - Consider patterns from other.md when relevant.
    </ToneAndStyle>

    <KeyPoint>
      - Must highlight a specific "missing element."
      - Must show *why* it matters, *what* challenges it creates, and *how* to fix it.
    </KeyPoint>
  </Instructions>

  <!--
    ======================
    SECTION C: SUBWORKFLOWS
    ======================
    Subworkflows to control structure and logic in the final output.
  -->
  <SubWorkflows>

    <SubWorkflow id="1" name="IdentifyMissingElement">
      <!-- 
        Step 1: Interpret the context to find a critical gap
      -->
      <Step>Read <ContextData> and other.md carefully, note any unaddressed or insufficiently covered topic.</Step>
      <Step>Select the most impactful missing or overlooked element.</Step>
      <Step>Validate against existing patterns in other.md.</Step>
    </SubWorkflow>

    <SubWorkflow id="2" name="ExplainWhyItMatters">
      <!-- 
        Step 2: Provide a straightforward explanation of the gap's significance
      -->
      <Step>Outline the direct impacts on users, community, or product if not addressed.</Step>
      <Step>Use layman-friendly examples.</Step>
    </SubWorkflow>

    <SubWorkflow id="3" name="ListChallenges">
      <!-- 
        Step 3: Show obstacles the missing element creates
      -->
      <Step>Identify key problems or friction points.</Step>
      <Step>Create bullet lists for clarity (or short paragraphs).</Step>
    </SubWorkflow>

    <SubWorkflow id="4" name="ProposeSolutions">
      <!-- 
        Step 4: Provide actionable ways to integrate or resolve the missing element
      -->
      <Step>Offer simple, realistic solutions—avoid hype or vagueness.</Step>
      <Step>Ensure bullet lists or enumerated steps for clarity.</Step>
    </SubWorkflow>

    <SubWorkflow id="5" name="MindMapAndNextSteps">
      <!-- 
        Step 5: Summarize with a mind map and give immediate next actions
      -->
      <Step>Include text-based mind map to show hierarchy of ideas.</Step>
      <Step>Conclude with a short list of recommended next steps.</Step>
    </SubWorkflow>

  </SubWorkflows>

  <!--
    =====================
    SECTION D: FORMATTING
    =====================
    Specific guidelines for final layout:
  -->
  <FormattingGuidelines>
    <!-- 
      Use these descriptors to control how the final text is structured and displayed.
    -->
    <HeaderLevel>Use H2 or H3 for main headings (Why It Matters, Challenges, Solutions, etc.).</HeaderLevel>
    <Lists>Use bullet points or numbered steps for clarity.</Lists>
    <MindMapFormat>Use simple ASCII text to illustrate the hierarchy of the missing element, challenges, solutions. Do not put it in a code doc section ``` since it breaks formatting.</MindMapFormat>
  </FormattingGuidelines>

  <!--
    ==========================
    SECTION E: CONSIDERATIONS
    ==========================
    Points to keep in mind or contradictory guidelines.
  -->
  <Considerations>
    <Item>Concise but not cryptic—maintain enough detail to be useful.</Item>
    <Item>Casual but not sloppy—respectful tone.</Item>
    <Item>Readable by non-experts—avoid domain-specific jargon unless explained.</Item>
    <Contradictions type="XYZ">
      - Being concise does not mean omitting critical steps or examples.
      - Being casual does not mean ignoring structure or flow.
      - Being direct does not mean abrupt or impolite phrasing.
    </Contradictions>
  </Considerations>

</RootTemplate>
