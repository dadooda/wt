
WT demo: `cpuinfo`
==================

Overview
--------

A simple <a href="https://github.com/dadooda/wt">WT</a> script to print CPU name.

Jump to code: <a href="lib/script/cpuinfo.rb">cpuinfo.rb</a>, <a href="spec/lib/script/cpuinfo_spec.rb">cpuinfo_spec.rb</a>.


Specification
-------------

1. The script obtains and prints CPU name to console.
    1. Unix and Windows platforms are supported.
2. If the script is run interactively, CPU name is printed in bold. Otherwise it's plain text.
3. The script has substantial test coverage.
4. The script manages its dependencies via own Gemfile.
    1. Convenience setup scripts are provided for all supported platforms.
5. The package has complete docs by Yard or compatible generator.


Usage
-----

1. Obtain:

    ```sh
    $ git clone https://github.com/dadooda/wt
    $ cd wt/demos/cpuinfo
    ```

    All commands below assume that current directory is `wt/demos/cpuinfo`.

2. Set up:

    ```sh
    $ bin/setup-cpuinfo
    ```

    On Windows: `bin\setup-cpuinfo.cmd`.

2. Test:

    ```sh
    $ bundle exec rspec
    ```

3. Run:

    ```sh
    $ bin/cpuinfo
    ```
