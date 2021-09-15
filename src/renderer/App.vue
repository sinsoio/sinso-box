<template>
  <div id="app">
    <router-view></router-view>
  </div>
</template>

<script>
  export default {
   name: 'my-project',
  created() {
    console.log(this.$route.name)
     console.log(this.$store.state.Public)
       console.log(this.$route.query)
  },
  mounted() {},
}
</script>
</script>

<style>
  /* CSS */
</style>
