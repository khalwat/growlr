import Confetti from "vue-confetti/src/confetti.js";

export function makeConfetti(): ConfettiInterface {
  const config: Partial<ConfettiConfig> = {
    defaultType: 'heart',
    defaultSize: 50,
    defaultColors: ['Gold', 'pink', 'Violet', 'SandyBrown', 'Crimson'],
  };
  const confetti: ConfettiInterface = new Confetti();

  setTimeout(() => {
    confetti.start(config);
  }, 500);

  return confetti;
}
