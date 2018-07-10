<template>
  <div>
    <b-container fluid v-for="(snapshot) in snapshots">
      <b-row >
        <b-col class="snapshot-item"><img v-bind:src="snapshot.img_url"></b-col>
        <b-col class="snapshot-item"><img v-bind:src="snapshot.img_url"></b-col>
      </b-row>
    </b-container>
    <infinite-loading @infinite="requestMoreSnapshots" spinner="circles"></infinite-loading>
  </div>
</template>

<script>
  import InfiniteLoading from 'vue-infinite-loading';
  import eventBus from '../main.js'

  export default {
    props: ['snapshots'],
    components: {
      InfiniteLoading,
    },
    methods: {
      requestMoreSnapshots($state) {
        eventBus.$emit('requestMoreSnapshots', $state);
      }
    }
  }
</script>

<style scoped>
  .snapshot-item {
    padding: 0px;
    border-style: solid;
    border-color: white;
    border-width: 1px;
  }

  img {
    padding: 0;
    margin: 0;
    width: 100%;
    height: 100%;
  }
</style>
