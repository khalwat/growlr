<template>
  <div class="w-full text-shadow-sm text-shadow-grey-50">
    <h1 class="text-6xl flex justify-center items-center">
      <strong>All your matches</strong>!
    </h1>
    <apexchart
      :options="chartOptions"
      :series="series"
      type="bar"
    ></apexchart>
  </div>
</template>

<script lang="ts" setup>
import apexchart from 'vue3-apexcharts';
import {ApexOptions} from 'apexcharts';
import {computed} from "vue";

const allPawmates = defineModel<GrowlrPawmate[]>();

const chartOptions = computed(() => {
  let optionsData: string[] = [];
  if (allPawmates && allPawmates.value) {
    optionsData = allPawmates.value.reduce<string[]>((acc, obj) => {
      if (obj.title) {
        acc.push(obj.title);
      }
      return acc;
    }, []);
  }
  return <ApexOptions>{
    tooltip: {
      custom: function ({series, seriesIndex, dataPointIndex, w}) {
        console.log(w.config.series[seriesIndex]);
        const imgUrl = w.config.series[seriesIndex]['img'][dataPointIndex];
        const name = w.globals.labels[dataPointIndex];
        const label = w.config.series[seriesIndex]['name'];
        const matchPercentage = w.config.series[seriesIndex]['data'][dataPointIndex];
        return `
        <div class="w-[200px] bg-pink-200 text-center px-4">
          <div class="py-4 text-2xl font-bold">${name}</div>
          <img class="heart aspect-square object-cover w-full" src="${imgUrl}" />
          <div class="py-4 text-xl font-bold">${label}: ${matchPercentage}%</div>
        </div>
        `;
      }
    },
    chart: {
      id: 'vuechart-example',
      type: 'bar',
    },
    legend: {
      show: false
    },
    plotOptions: {
      bar: {
        distributed: true, // Enable individual coloring
      }
    },
    colors: ['#008FFB', '#90D5FF'], // Provide your desired colors
    xaxis: {
      categories: optionsData,
    },
  };
});

const series = computed(() => {
  let seriesData: number[] = [];
  let seriesImg: string[] = [];
  if (allPawmates && allPawmates.value) {
    seriesData = allPawmates.value.reduce<number[]>((acc, obj) => {
      if (obj.matchPercentage) {
        acc.push(obj.matchPercentage);
      }
      return acc;
    }, []);
    seriesImg = allPawmates.value.reduce<string[]>((acc, obj) => {
      if (obj.imageUrl) {
        acc.push(obj.imageUrl);
      }
      return acc;
    }, []);
  }
  return [
    {
      name: 'Match:',
      data: seriesData,
      img: seriesImg
    },
  ];
});
</script>
