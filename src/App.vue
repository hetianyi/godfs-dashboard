<template>
  <div id="app">
    <mdc-layout-app>
      <mdc-toolbar slot="toolbar" fixed>
        <mdc-toolbar-row>
          <mdc-toolbar-section align-start >
            <mdc-toolbar-menu-icon event="toggle-drawer"></mdc-toolbar-menu-icon>
            <mdc-toolbar-title>godfs pot</mdc-toolbar-title>
          </mdc-toolbar-section>
        </mdc-toolbar-row>
      </mdc-toolbar>
      <mdc-drawer :temporary="true" slot="drawer" toggle-on="toggle-drawer">
        <mdc-drawer-list>
          <mdc-drawer-item start-icon="dashboard" to="/">Dashboard</mdc-drawer-item>
          <mdc-drawer-item start-icon="settings_input_component" to="/Management">Management</mdc-drawer-item>
          <mdc-drawer-item start-icon="settings">Settings</mdc-drawer-item>
          <mdc-drawer-item start-icon="help" @click="gotoGithub">Help</mdc-drawer-item>
          <mdc-drawer-item start-icon="favorite" @click="gotoGithub">Star</mdc-drawer-item>
        </mdc-drawer-list>
      </mdc-drawer>
      <main class="content" >
          <router-view/>
      </main>
    </mdc-layout-app>
  </div>
</template>

<script>
export default {
  name: 'app',

  methods: {
    gotoGithub() {
      window.open('https://github.com/hetianyi/godfs-dashboard')
    }
  }
}

</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;

  color: #2c3e50;
}
</style>
