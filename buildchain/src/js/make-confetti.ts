import Confetti from "vue-confetti/src/confetti.js";

export function makeConfetti() {
  const config: Partial<ConfettiConfig> = {
    defaultType: 'heart',
    defaultSize: 50,
    defaultColors: ['Gold', 'pink', 'Violet', 'SandyBrown', 'Crimson'],
  };
  const confetti: ConfettiInterface = new Confetti();

  setTimeout(() => {

    confetti.start(config);
    setTimeout(() => {
      confetti.stop();
    }, 23000);
  }, 500);
}
