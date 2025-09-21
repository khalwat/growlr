declare module 'vue-fortune-wheel';

interface WheelPrize {
  id: number,
  name: string,
  value: string,
  bgColor: string,
  color: string,
  probability?: number,
}

type WheelRotateCallback = () => void;
