<template>
  <div v-if="pawmates && pawmates.length" class="px-[15%] text-shadow-sm text-shadow-grey-50">
    <swiper
      :modules="modules"
      :pagination="{ clickable: true }"
      :slides-per-view="1"
      class="pawmate-wrapper"
      navigation
    >
      <swiper-slide v-for="(pawmate, index) in pawmates" :key="pawmate.id">
        <h1 class="text-6xl flex justify-center items-center">
          <MoreauButton
            v-if="user.together && user.together[index] && user.together[index].url"
            :together-title="user.fullName + ' & ' + pawmate.title + ' together...'"
            :together-url="user.together[index].url"
          />
          <strong>{{ pawmate.title }}</strong>!
          <PawmateInfoButton :pawmate="pawmates[index]"/>
        </h1>
        <img :alt="pawmate.title" :src="pawmate.imageUrl" class="heart aspect-square object-cover w-full"/>
      </swiper-slide>
    </swiper>
    <audio ref="backgroundAudio">
      <source src="/audio/lets-get-it-on.mp3" type="audio/mpeg">
    </audio>
  </div>
</template>

<script lang="ts" setup>
import {onMounted, onUnmounted, onUpdated, ref} from "vue";
import {Swiper, SwiperSlide} from "swiper/vue";
import {A11y, Navigation, Pagination} from 'swiper/modules';
import PawmateInfoButton from "../ui-elements/buttons/PawmateInfoButton.vue";
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css';
import {makeConfetti} from "../../js/make-confetti";
import MoreauButton from "../ui-elements/buttons/MoreauButton.vue";

const modules = [Pagination, Navigation, A11y];
const pawmates = defineModel<GrowlrPawmate[]>();
const backgroundAudio = ref<HTMLAudioElement | null>(null);
const confetti = makeConfetti();
const props = defineProps<{
  user: GrowlrUser,
  expertMode: boolean,
}>();

function bedazzle() {
  setTimeout(() => {
    const elements = document.querySelectorAll('.pawmate-wrapper');
    elements.forEach(element => {
      element.classList.add('heartbeat');
    });
    if (backgroundAudio.value) {
      backgroundAudio.value.currentTime = 0;
      backgroundAudio.value.play();
      backgroundAudio.value.addEventListener("ended", () => {
        unbedazzle();
      });
    }
  }, 500);
}

function unbedazzle() {
  const elements = document.querySelectorAll('.pawmate-wrapper');
  confetti.stop();
  elements.forEach(element => {
    element.classList.remove('heartbeat');
  });
}

onMounted(() => bedazzle());
onUpdated(() => {
  if (!props.expertMode) {
    bedazzle()
  }
});
onUnmounted(() => {
  unbedazzle();
});
</script>

<style scoped>
.heartbeat {
  animation: beat .50s infinite alternate;
  transform-origin: center;
}

@keyframes beat {
  to {
    transform: scale(1.05);
  }
}
</style>
