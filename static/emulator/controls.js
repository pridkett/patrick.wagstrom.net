/* Site-specific controls for the GB Studio / Binjgb runtime. */
function attachPlayerControls() {
  window.w2FlushSave = () => vm.updateExtRam();
  const buttons = [...document.querySelectorAll("[data-button]")];
  const pressedAt = new WeakMap();
  const releaseTimers = new WeakMap();
  const release = button => {
    clearTimeout(releaseTimers.get(button));
    button.classList.remove("held");
    emulator["setJoyp" + button.dataset.button](false);
  };
  const finishPress = button => {
    // Keep quick taps down for several emulated frames so RAF cannot miss them.
    clearTimeout(releaseTimers.get(button));
    const delay = Math.max(0, 80 - (performance.now() - (pressedAt.get(button) || 0)));
    releaseTimers.set(button, setTimeout(() => release(button), delay));
  };
  buttons.forEach(button => {
    button.addEventListener("pointerdown", event => {
      if (event.button !== 0) return;
      event.preventDefault();
      button.setPointerCapture(event.pointerId);
      clearTimeout(releaseTimers.get(button));
      pressedAt.set(button, performance.now());
      button.classList.add("held");
      emulator["setJoyp" + button.dataset.button](true);
      emulator.audio.startPlayback();
    });
    ["pointerup", "lostpointercapture"].forEach(type => button.addEventListener(type, () => finishPress(button)));
    button.addEventListener("pointercancel", () => release(button));
    // Keyboard activation of a semantic button produces a bounded press/release.
    button.addEventListener("click", event => { if (event.detail === 0) {
      emulator["setJoyp" + button.dataset.button](true);
      setTimeout(() => release(button), 100);
    } });
  });
  const pause = document.getElementById("pause-game");
  const sound = document.getElementById("sound-game");
  // The same state update covers button clicks, Space, and background-tab pauses.
  window.w2SyncPlayerControls = () => {
    pause.dataset.paused = String(vm.paused);
    pause.setAttribute("aria-label", vm.paused ? "Resume game" : "Pause game");
    pause.title = pause.getAttribute("aria-label");
    sound.dataset.muted = String(!vm.volume);
    sound.setAttribute("aria-label", vm.volume ? "Mute sound" : "Unmute sound");
    sound.title = sound.getAttribute("aria-label");
  };
  pause.addEventListener("click", () => vm.togglePause());
  // Start muted. The visitor can explicitly enable audio after the cartridge opens.
  vm.volume = 0;
  window.w2SyncPlayerControls();
  sound.addEventListener("click", () => {
    vm.volume = vm.volume ? 0 : 0.5;
    window.w2SyncPlayerControls();
    emulator.audio.startPlayback();
  });
  window.addEventListener("blur", () => buttons.forEach(release));
  let pausedBeforeHidden = false;
  document.addEventListener("visibilitychange", () => {
    if (document.hidden) { pausedBeforeHidden = vm.paused; vm.paused = true; vm.updateExtRam(); }
    else { vm.paused = pausedBeforeHidden; }
  });
  window.addEventListener("pagehide", () => vm.updateExtRam());
  window.addEventListener("unload", () => vm.updateExtRam());
}
