<template>
  <div>
    <h3>Catan Tools</h3>
    <div class="footer">
      <github-button
        href="https://github.com/alex-wzm/catan-tools"
        data-icon="octicon-star"
        data-size="large"
        aria-label="Star ntkme/github-buttons on GitHub"
        >Star</github-button
      >
      <a href="https://vuejs.org/" target="_blank">
        <img height="50px" alt="Vue logo" src="../assets/logo.png" />
      </a>
    </div>
  </div>
</template>

<script>
import GithubButton from "vue-github-button";

export default {
  name: "Home",
  components: { GithubButton },
};
</script>

<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
.footer {
  position: absolute;
  display: flex;
  align-items: flex-end;
  justify-content: space-between;
  bottom: 0%;
  width: 100%;
}
</style>
