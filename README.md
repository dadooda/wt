
The Working Template paradigm
=============================

Introduction
------------

Working Template ("WT" for short) is a paradigm which helps to **create, maintain, customize and share complex CLI scripts** with ease.

WT is documented and demoed in Ruby, but can be implemented in any high-level scripting language suitable for CLI program development.


The problem
-----------

Many of us developers writing Unix shell scripts have faced the problem of quickly losing control as the script is growing in size and becoming more complex. I'll summarize it in a few cases.

* **Bash scripts quickly become bloated with added functionality.**<br />
  _"Once my Bash script was under 2 pages it was transparent and worked like a charm. Now that I've added some interactivity and command-line options it became bloated, hard to read and very unstable. I get frequent complaints about it from my teammates."_
* **Bash scripts are hard to port between projects.**<br />
  _"I wrote and maintained a complex Bash script for Project A. Now after 12 months I need to reuse the script for Project B with some customizations. The trouble is that I actually have to re-develop it, spending hours if not days. This seems daunting, I just want to reuse the damn script with a few minor changes, not dissect and debug it again."_
* **Bash scripts are hard to share between people.**<br />
  _"A fellow of mine shared a big script with me, saying it works for him. I ran it on my machine, it just failed shortly with a dumb error message. Trying to fix it I looked at the code and got scared to death: it appears that things can go wrong a thousand ways. Now I'm stuck: I need the job done, but my fellow's script is a nightmare. I also don't want to develop it from scratch."_
* **Ruby CLI scripting isn't widely promoted.**<br />
  _"I know that complex Bash script are trouble makers. I'd love to script in Ruby, but I lack proper guidance. Everything I've done in Ruby so far was Rails-specific. I just don't know where to start if I need to write a CLI program in Ruby."_"

If any of these sound familiar to you, please read on.


The solution
------------

Develop CLI scripts under WT paradigm in Ruby or other high-level languages.


Demo
----

<a href="demos/cpuinfo">Proceed to the demo right now</a> for some live code.


The paradigm
------------

Complete description deserves several pages of text and a step-by-step tutorial, which (I hope) are yet to be written. Please ping me by e-mail or post issues with topics you miss the most.

### Overall ###

1. Each executable script **is an instantiatable Ruby class** (_script class_).
2. The script class **controls its data** through _data attributes_ and **makes decisions** through _mode attributes_.
3. All (most) data/mode attributes **obtain their values on-the-fly** upon first invocation. This allows to keep action-taking code (_action code_) simple and free from complicated logic.
4. Tests primarily deal with data/mode attributes. Action code is tested when it's worth the effort.


### Implementation guidelines ###

Here I assume that you've had a quick look at <a href="demos/cpuinfo">the demo</a>.

1. Dealing with data attributes:
    1. Devote each data attribute to **a single** specific piece of information or manageable object.
    2. Per each readable data attribute **always** provide a writable counterpart (`attr_writable` or `def attr=`).
      You'll need it for tests.
2. Dealing with mode attributes:
    1. Create a mode attribute **per each decision** made by the script, even if such decision is made once per run.
    2. Provide a way to force-set any mode attribute to a specific value.
      You'll need it for tests.
      In the demo I do it with `mode`, `mode=` and `mode_attr()`.
3. Dealing with `bin/` scripts and environment boot:
    1. `bin/` scripts contain OS commands to instantiate the script class and call `#main` properly.
      Better not over-optimize them.
    2. The same applies to `boot/`.
      Don't touch it often unless required.
4. Projecting future functionality:
    1. **Just don't.**
      Implement **what you currently need**, back it with tests and use it.
      Treat the script as a continuous work-in-progress **template** which you can extend whenever convenient.
      Hence the name "working template" -- mystery unwinded!
    2. Continuously refactor the script class **to reflect its current end-user functionality** and be nothing else.
      Remove stuff with zero usage count.
5. Enjoying it all:
    1. **Use all of Ruby power:** create class hierarchies, include modules, use 3rd party gems.
      It's not Bash anymore, we can **program** the script now.


### I want to write a WT script, where do I start? ###

At the moment all you have is this README and <a href="demos/cpuinfo">the demo</a>.
Download the demo and use it as a starting point for your project.


Copyright
---------

The WT paradigm was developed in 2014-2017 by Alex Fortuna and is free to use by everyone without restrictions.

Feedback of any kind is greatly appreciated.
