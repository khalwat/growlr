<template>
  <div class="py-10">
    <VueSlider
      v-model="model"
      :labelStyle="{'font-size': '1.5rem'}"
      :marks="props.marks"
      :max=10
      :min=0
      tooltip="always"
      @change="emit('attribute-slider-changed')"
    />
  </div>
</template>

<script lang="ts" setup>
import {defineEmits, defineModel} from 'vue';
import VueSlider from "vue-3-slider-component";

const emit = defineEmits(['attribute-slider-changed']);
const model = defineModel();
const props = defineProps<{
  marks: object
}>();

</script>
