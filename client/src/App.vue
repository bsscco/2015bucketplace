<template>
  <div>
    <snapshot-feed v-bind:snapshots="snapshots"></snapshot-feed>
  </div>
</template>

<script>
  import axios from 'axios';
  import SnapshotFeed from './components/SnapshotFeed'
  import eventBus from './main.js'

  export default {
    name: 'app',
    data() {
      return {
        snapshots: []
      }
    },
    created() {
      eventBus.$on('requestMoreSnapshots', $state => {
        axios
          .get('https://ohou.se/cards/feed.json', {
            params: {
              per: 20,
              page: this.snapshots.length / 20 + 1,
            },
          })
          .then(({data}) => {
            console.log(data);
            if (data.cards.length) {
              this.snapshots = this.snapshots.concat(data.cards);
              $state.loaded();
              if (this.snapshots.length / 20 === 10) {
                $state.complete();
              }
            } else {
              $state.complete();
            }
          });
      });
    },
    components: {
      SnapshotFeed,
    },
  }
</script>

<style>
</style>
