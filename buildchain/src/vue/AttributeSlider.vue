<template>
  <div class="py-10">
    <VueSlider
      v-model="model"
      min=0
      max=10
      tooltip="always"
      :labelStyle="{'font-size': '1.5rem'}"
      :marks="props.marks"
    />
  </div>
</template>

<script setup lang="ts">
import {defineModel, defineProps} from 'vue';
import VueSlider from "vue-3-slider-component";

const model = defineModel();
const props = defineProps<{
  marks: object
}>();

</script>

