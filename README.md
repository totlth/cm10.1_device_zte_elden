WIP - CM 10.1 Device Tree

Builds successfully with some build system edits, but still does not boot.

device repo: in "source"/device dir make zte dir then cd into it and issue - 
git clone https://github.com/totlth/cm10.1_device_zte_elden.git elden

It is setup to build kernel inline with system

kernel repo : in "source" dir make kernel/zte dir then cd into it and issue -
git clone https://github.com/totlth/android_kernel_zte_elden.git elden

Recovery builds and boots successfully.
