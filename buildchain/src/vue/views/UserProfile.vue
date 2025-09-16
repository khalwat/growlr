<template>
  <div v-if="user" class="lg:px-[15%] sm:px-[5%] text-shadow-sm text-shadow-grey-50">
    <h1 class="text-xl text-center mb-4">
      <strong><span v-if="user.fullName">{{ user.fullName }}</span><span v-else>Snugglemuffins</span></strong>
      let's find you a pawmate!
    </h1>
    <img v-if="user.photo" :alt="user.fullName" :src="user.photo.url"
         class="rounded-lg aspect-square object-cover w-full"/>
  </div>
</template>

<script lang="ts" setup>

const user = defineModel<GrowlrUser>();
</script>
