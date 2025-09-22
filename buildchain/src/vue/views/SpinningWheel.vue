<template>
  <div class="flex justify-center items-center">
    <!-- type: canvas -->
    <FortuneWheel
      ref="wheelEl"
      :canvas="wheelOptions"
      :prizes="prizesData"
      duration="3000"
      style="width: 70%; max-width: 70%;"
      @rotateEnd="onRotateEnd"
      @rotateStart="onWheelRotateStart"
    />
    <audio ref="wheelSpinAudio">
      <source src="/audio/wheel-spin.mp3" type="audio/mpeg">
    </audio>

  </div>
</template>

<script lang="ts" setup>
import {computed, onMounted, onUpdated, ref} from 'vue'
import FortuneWheel from 'vue-fortune-wheel'
import 'vue-fortune-wheel/style.css'

const allPawmates = defineModel<GrowlrPawmate[]>('pawmates');
const spinning = defineModel<boolean>('spinning');
const prizeId = ref(0)
const wheelEl = ref()
const wheelSpinAudio = ref<HTMLAudioElement | null>(null);
const wheelOptions = {
  btnWidth: 140,
  borderColor: '#584b43',
  borderWidth: 6,
  lineHeight: 30,
  textDirection: 'vertical',
  btnText: '🐾',
  fontSize: 24,
  textRadius: 220,
  textLength: 20
}

const wheelColors = [
  '#45ace9',
  '#dd3832',
  '#38dd32',
  '#fef151',
  '#7F00FF'
];

let prizesData: WheelPrize[] = [];
if (allPawmates && allPawmates.value) {
  prizesData = allPawmates.value.reduce<WheelPrize[]>((acc, obj, index) => {
    const seriesData = {
      id: index,
      name: obj.title?.replace(/ .*/, '') ?? '',
      value: obj.title ?? '',
      bgColor: wheelColors[index % wheelColors.length],
      color: '#ffffff',
      probability: index === 0 ? 100 : 0,
    };
    acc.push(seriesData);
    return acc;
  }, []);
}
console.log(prizesData);

const prizeRes = computed(() => {
  return prizesData.find(item => item.id === prizeId.value) || prizesData[0]
})

onMounted(() => {
  wheelEl.value.startRotate()
})

onUpdated(() => {
  wheelEl.value.startRotate()
})

function onWheelRotateStart() {
  if (wheelSpinAudio.value) {
    wheelSpinAudio.value.currentTime = 0;
    wheelSpinAudio.value.play();
    wheelSpinAudio.value.addEventListener("ended", () => {
    });
  }
}

function onRotateEnd(prize: WheelPrize) {
  setTimeout(() => {
    spinning.value = false;
  }, 500)
}

function onChangePrize(id: number) {
  prizeId.value = id
}
</script>
