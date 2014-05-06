WIP - CM 10.1 Device Tree

Main bugs:<br>
audio/phone - audio doesn't work on phone & using phone breaks audio<br>
camera<br>
video

There may be more. I haven't tested everything.

Clone following hardware repos to your "source"/hardware/qcom dir<br>
git clone https://github.com/totlth/cm10.1-elden_hardware_qcom_audio-legacy.git audio-legacy

git clone https://github.com/totlth/cm10.1-elden_hardware_qcom_display-legacy.git display-legacy

git clone https://github.com/totlth/cm10.1-elden_hardware_qcom_media-legacy.git media-legacy

Clone device repo: in "source"/device dir make zte dir then cd into it and issue<br> 
git clone https://github.com/totlth/cm10.1_device_zte_elden.git elden

It is setup to build kernel inline with system

Clone kernel repo : in "source" dir make kernel/zte dir then cd into it and issue<br>
git clone https://github.com/totlth/android_kernel_zte_elden.git elden

Recovery builds and boots successfully.
