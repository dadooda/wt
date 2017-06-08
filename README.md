
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


(more to come when I've got time...)


Copyright
---------

The WT paradigm as described above was first used in 2014 by Alex Fortuna and is free to use by everyone without restrictions.
