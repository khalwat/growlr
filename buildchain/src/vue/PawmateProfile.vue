<template>
  <div v-if="pawmate" class="pl-2">
    <h1 class="text-xl">
      Your pawmate is <strong>{{ pawmate.title }}</strong>!
    </h1>
    <img v-if="pawmate.imageUrl" :src="pawmate.imageUrl" class="heart aspect-square object-cover w-full"/>
  </div>
</template>

<script lang="ts" setup>
import {defineModel} from "vue";

const pawmate = defineModel<GrowlrPawmate>();
</script>
