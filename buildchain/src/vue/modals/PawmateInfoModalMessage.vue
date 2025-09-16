<template>
  <div class="flex px-8 items-center">
    <div class="w-1/2">
      <img :alt="pawmate.title" :src="pawmate.imageUrl" class="heart aspect-square object-cover"/>
    </div>
    <div class="w-1/2 text-center pb-8">
      <h1 class="text-3xl font-bold">{{ pawmate.title }}</h1>
      <h2 class="text-xl font-bold">{{ pawmate.age }} yrs</h2>
      <h2 class="text-3xl font-bold">
        <span v-if="pawmate.sex == 'male'">⚦</span>
        <span v-else-if="pawmate.sex == 'female'">♀</span>
        <span v-else>❔</span>
      </h2>
      <h2 class="text-3xl font-bold">
        <span v-if="pawmate.neutered">🪛</span>
        <span v-else>🥜</span>
      </h2>
    </div>
  </div>
  <p class="text-xl">
    {{ pawmate.shortDescription }}
  </p>
  <p class="py-8 text-3xl font-bold text-center">
    Match: {{ pawmate.matchPercentage }}%!
  </p>
  <div class="px-8">
    <AttributeIndicator :value="pawmate.affection" title="Affection"/>
    <AttributeIndicator :value="pawmate.activityLevel" title="Activity Level"/>
    <AttributeIndicator :value="pawmate.bodySize" title="Body Size"/>
    <AttributeIndicator :value="pawmate.hairyness" title="Hairyness"/>
    <AttributeIndicator :value="pawmate.diet" title="Diet"/>
    <AttributeIndicator :value="pawmate.attractiveness" title="Attractiveness"/>
  </div>
</template>

<script lang="ts" setup>
import AttributeIndicator from "../ui-elements/AttributeIndicator.vue";

const props = defineProps<{
  pawmate: GrowlrPawmate,
}>();
</script>
