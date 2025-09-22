<template>
  <div v-if="value != null" class="py-2">
    <div class="flex justify-between mb-1">
      <span class="text-base font-medium black dark:text-white">{{ title }}</span>
      <span class="text-sm font-medium text-black dark:text-white">{{ value }}</span>
    </div>
    <div class="w-full bg-gray-200 rounded-full h-3 dark:bg-gray-700">
      <div :style="'width: ' + percentage + '%'" class="bg-blue-600 h-2.5 rounded-full"></div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import {computed} from 'vue';

const props = defineProps<{
  title?: string,
  value?: number
}>();
const percentage = computed(() => (props.value ?? 0) * 10);
</script>
