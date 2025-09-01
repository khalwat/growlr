<template>
  <div>
    <div v-for="pawmate in pawmates">
      <div v-if="pawmate" class="pl-2">
        <h1 class="text-xl">
          Your pawmate is <strong>{{ pawmate.title }}</strong>!
        </h1>
        <img v-if="pawmate.imageUrl" :src="pawmate.imageUrl" class="heart aspect-square object-cover w-full"/>
      </div>
    </div>
  </div>
</template>

<script lang="ts" setup>
import {defineModel} from "vue";

const pawmates = defineModel<GrowlrPawmate[]>();
</script>
