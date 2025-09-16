<template>
  <img :alt="togetherTitle" :src="togetherUrl"/>
</template>

<script lang="ts" setup>
const props = defineProps<{
  togetherUrl: string,
  togetherTitle: string,
}>();
</script>
