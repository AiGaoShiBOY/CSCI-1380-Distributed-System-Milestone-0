# M0: Setup & Centralized Computing
> Full name: `yuanfeng`
> Email:  `yuanfeng_li@brown.edu`
> Username:  `yli586`

## Summary
> Summarize your implementation, including key challenges you encountered

My implementation comprises `8` software components, totaling `200` lines of code in the following languages: `100` lines of shell scripts and `100` of JavaScript code. Key challenges included `1. Get to know how to write shell language. 2. get to understand the std i/o, and how the output is passed among different shell scrips. 3. try to finish merge.js and make it pass the end-to-end test`.

## Correctness & Performance Characterization
> Describe how you characterized the correctness and performance of your implementation

*Correctness*: My implementation passes `10` out of the `10` tests (`100`%) already provided for M0. I developed another `5` tests, which focus on `1. the functionally of query.sh, invert.sh, getURL.js, merge.js and stem.js`. All these tests, combined take `2h` to complete. `Besides these tests, The output of each component in my implementation was double-checked by printing to dev/tty to make sure the output was correct.`.

*Performance*: Evaluating the entire system using the `time` command on the three sandboxes reports the following times:

|           | Engine   | Query    |
| --------- | -------- | -------- |
| Sandbox 1 | `10.796s` | `0.342s` |
| Sandbox 2 | `40.127s` | `0.374s` |
| Sandbox 3 | `?` | `?` | 

(sandbox cannot finish running in 5 minutes since the corpus is too big)

## Time to Complete
> Roughly, how many hours did this milestone take you to complete?

Hours: `35h`

## Wild Guess
> How many lines of code do you think it will take to build the fully distributed, scalable version of your search engine? (If at all possible, try to justify your answer — even a rough justification about the order of magnitude is enough)

DLoC: `10,0000`

Justification : 
In this homework, a simple search engine required roughly 500 lines of code; however, firstly, the functionality of this search engine is not complete—it lacks an NLP module, and secondly, this search engine only processes up to 3-grams. The processing speed of the engine is very slow, necessitating further code optimization. The engine does not consider security at all. It is not a distributed engine but a standalone one, lacking concurrency code with other systems. The system does not consider any scalability. Therefore, it is estimated that around 10,000 lines of code are needed to complete a simple search engine. Although online sources mention that search engines like Google or Bing require millions of LOC, this homework has significantly increased my understanding of the challenges in implementing a successful search engine, so I conservatively estimate that 10,000 lines of code are needed to complete it.

