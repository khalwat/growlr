<template>
  <div>
    <swiper
      :modules="modules"
      :pagination="{ clickable: true }"
      :slides-per-view="1"
      navigation
    >
      <swiper-slide v-for="pawmate in pawmates" :key="pawmate.id" class="pl-2">
        <h1 class="text-xl">
          Your pawmate is <strong>{{ pawmate.title }}</strong>!
        </h1>
        <img :src="pawmate.imageUrl" class="heart aspect-square object-cover w-full"/>
      </swiper-slide>
    </swiper>
  </div>
</template>

<script lang="ts" setup>
import {defineModel} from "vue";
import {Swiper, SwiperSlide} from "swiper/vue";
import {A11y, Navigation, Pagination, Scrollbar} from 'swiper/modules';
import 'swiper/css/navigation';
import 'swiper/css/pagination';
import 'swiper/css';

const modules = [Pagination, Navigation, Scrollbar, A11y];
const pawmates = defineModel<GrowlrPawmate[]>();
</script>
