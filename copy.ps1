param (
    [Parameter(Mandatory=$false)]
    [Switch]$useDebug,
    [Parameter(Mandatory=$false)]
    [Switch]$log
)

& ./build.ps1
if ($useDebug.IsPresent) {
    & adb push build/debug/libpython.so /sdcard/Android/data/com.beatgames.beatsaber/files/mods/libpython.so
} else {
    & adb push build/libpython.so /sdcard/Android/data/com.beatgames.beatsaber/files/mods/libpython.so
}

& adb shell am force-stop com.beatgames.beatsaber
& adb shell am start com.beatgames.beatsaber/com.unity3d.player.UnityPlayerActivity
if ($log.IsPresent) {
    & ./log.ps1
}