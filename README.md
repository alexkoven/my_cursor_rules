This repository contains prompt rules for the coding agent in Cursor.

My typical workflow consists of the following steps:
1. Plan the codebase development using an advanced reasoning LLM.
2. Once the high-level plan is complete, use `plan_creation.mdc` in Cursor to generate a detailed, step-by-step coding plan.
3. The step-by-step plan is then executed by the Cursor agent using `plan_execution.mdc`.

The remaining rules are applied based as indicated by their names.

To create these rules, I used the following resources as references:
- [This GitHub post](https://gist.github.com/aashari/07cc9c1b6c0debbeb4f4d94a3a81339e)
- [This](https://x.com/ryancarson/status/1877170052492824683?s=46) and [this](https://x.com/kregenrek/status/1887574910501105793) Twitter post

