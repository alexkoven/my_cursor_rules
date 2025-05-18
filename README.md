This repository contains prompt rules for the coding agent in Cursor.

My typical workflow consists of the following steps:
1. Plan the codebase development using an advanced reasoning LLM.
2. Once the high-level plan is complete, use `plan_creation.mdc` in Cursor to generate a detailed, step-by-step coding plan.
3. The step-by-step plan is then executed by the Cursor agent using `plan_execution.mdc`.

The remaining rules are used for debugging and for controlling general coding behavior.

I used the following references to create the rules:
- [This GitHub post](https://gist.github.com/aashari/07cc9c1b6c0debbeb4f4d94a3a81339e)
- [This](https://x.com/ryancarson/status/1877170052492824683?s=46) and [this](https://x.com/kregenrek/status/1887574910501105793) Twitter post

To set up the rules in a new codebase, I follow the following steps:
1. I create a `.cursor` folder in the new repo. Inside of the `.cursor` folder, I run the bash script. Note that the bash script will be located at the original `my_cursor_rules` repo.
2. The bash script will set up a new git repo inside `.cursor` folder, which will likely be nested within a git repo of the new codebase. I know that this is not a great way of handling cursor rules across different repos on my machine. However, it is the only option I have found to allow me to keep track of changes to the rules across different repos without having to manually manage code changes or set up complex bash scripts. Since the `.cursor` folder is automatically put into the `.gitignore` of the parent git, there should be no conflicts between the nested git repos. 
