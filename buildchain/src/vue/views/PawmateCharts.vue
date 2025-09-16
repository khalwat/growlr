<template>
  <div class="w-full text-shadow-sm text-shadow-grey-50">
    <h1 class="text-6xl flex justify-center items-center">
      <strong>All your matches</strong>!
    </h1>
    <apexchart
      :options="barChartOptions"
      :series="barChartSeries"
      type="bar"
    ></apexchart>
    <h1 class="text-6xl flex justify-center items-center">
      <strong>Pawmate attributes!</strong>!
    </h1>
    <apexchart
      :options="lineChartOptions"
      :series="lineChartSeries"
      type="line"
    ></apexchart>
  </div>
</template>

<script lang="ts" setup>
import apexchart from 'vue3-apexcharts';
import {ApexOptions} from 'apexcharts';
import {computed} from "vue";

interface LineSeriesData {
  name: string;
  data: number[];
}

const allPawmates = defineModel<GrowlrPawmate[]>();

const barChartOptions = computed(() => {
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
        const imgUrl = w.config.series[seriesIndex]['img'][dataPointIndex];
        const name = w.globals.labels[dataPointIndex];
        const label = w.config.series[seriesIndex]['name'];
        const matchPercentage = w.config.series[seriesIndex]['data'][dataPointIndex];
        return `
        <div class="w-[200px] bg-pink-200 text-center px-4">
          <div class="py-4 text-2xl font-bold">${name}</div>
          <img class="heart aspect-square object-cover w-full" src="${imgUrl}" alt="${name}"/>
          <div class="py-4 text-xl font-bold">${label}: ${matchPercentage}%</div>
        </div>
        `;
      }
    },
    chart: {
      id: 'pawmate-matches-bar-chart',
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

const barChartSeries = computed(() => {
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

const lineChartOptions = computed(() => {
  return <ApexOptions>{
    chart: {
      id: 'pawmate-attraibutes-line-chart',
    },
    colors: ['#00668E', '#00A9B2', '#2B82A0', '#50A3A2', '#A6518F', '#DB7F5E', '#008FFB', '#807094', '#333333'],
    stroke: {
      width: 10,
      curve: 'smooth'
    },
    xaxis: {
      categories: ['Affection', 'Activity Level', 'Body Size', 'Hairiness', 'Diet', 'Attractiveness'],
      title: {
        text: 'Attributes'
      }
    },
    yaxis: {
      title: {
        text: 'Value'
      },
      min: 0,
      max: 10
    },
  };
});

const lineChartSeries = computed(() => {
  let seriesData: LineSeriesData[] = [];
  let seriesImg: string[] = [];
  if (allPawmates && allPawmates.value) {
    seriesData = allPawmates.value.reduce<LineSeriesData[]>((acc, obj) => {
      const seriesData = {
        name: obj.title ?? '',
        data: [
          obj.affection ?? 5,
          obj.activityLevel ?? 5,
          obj.bodySize ?? 5,
          obj.hairyness ?? 5,
          obj.diet ?? 5,
          obj.attractiveness ?? 5,
        ]
      };
      acc.push(seriesData);
      return acc;
    }, []);
    seriesImg = allPawmates.value.reduce<string[]>((acc, obj) => {
      if (obj.imageUrl) {
        acc.push(obj.imageUrl);
      }
      return acc;
    }, []);
  }
  return seriesData;
});
</script>
