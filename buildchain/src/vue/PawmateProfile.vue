<template>
  <div v-if="pawmates && pawmates.length" class="px-[15%]">
    <swiper
      :modules="modules"
      :pagination="{ clickable: true }"
      :slides-per-view="1"
      navigation
    >
      <swiper-slide v-for="(pawmate, index) in pawmates" :key="pawmate.id">
        <h1 class="text-6xl flex justify-center items-center">
          <strong>{{ pawmate.title }}</strong>!
          <InfoButton :pawmate="pawmates[index]"/>
        </h1>
        <img :src="pawmate.imageUrl" class="heart aspect-square object-cover w-full"/>
      </swiper-slide>
    </swiper>
    <audio ref="backgroundAudio">
      <source src="/audio/lets-get-it-on.mp3" type="audio/mpeg">
    </audio>
  </div>
</template>

<script lang="ts" setup>
import {onMounted, onUpdated, ref} from "vue";
import {Swiper, SwiperSlide} from "swiper/vue";
import {A11y, Navigation, Pagination, Scrollbar} from 'swiper/modules';
import InfoButton from "./InfoButton.vue";
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css';
import {makeConfetti} from "../js/make-confetti";

const modules = [Pagination, Navigation, Scrollbar, A11y];
const pawmates = defineModel<GrowlrPawmate[]>();
const backgroundAudio = ref<HTMLAudioElement | null>(null);

function bedazzle() {
  setTimeout(() => {
    const confetti = makeConfetti();
    if (backgroundAudio.value) {
      backgroundAudio.value.currentTime = 0;
      backgroundAudio.value.play();
      backgroundAudio.value.addEventListener("ended", () => {
        confetti.stop();
      });
    }
  }, 500);
}

onMounted(() => bedazzle());
onUpdated(() => bedazzle());
</script>
