<template>
  <div class="py-10">
    <VueSlider
      v-model="model"
      :labelStyle="{'font-size': '1.5rem'}"
      :marks="props.marks"
      :max=10
      :min=0
      :process-style="{backgroundColor: '#2b7fff'}"
      :tooltip-style="{backgroundColor: '#2b7fff'}"
      tooltip="always"
      @change="emit('attribute-slider-changed')"
    />
  </div>
</template>

<script lang="ts" setup>
import VueSlider from "vue-3-slider-component";

const emit = defineEmits(['attribute-slider-changed']);
const model = defineModel();
const props = defineProps<{
  marks: object
}>();
</script>
