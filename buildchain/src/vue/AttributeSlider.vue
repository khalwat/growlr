<template>
  <div class="py-10">
    <VueSlider
      v-model="model"
      :labelStyle="{'font-size': '1.5rem'}"
      :marks="props.marks"
      :max=10
      :min=0
      tooltip="always"
    />
  </div>
</template>

<script lang="ts" setup>
import {defineModel, defineProps} from 'vue';
import VueSlider from "vue-3-slider-component";

const model = defineModel();
const props = defineProps<{
  marks: object
}>();

</script>

