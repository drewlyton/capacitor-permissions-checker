/* eslint-disable no-undef */
import { SplashScreen } from '@capacitor/splash-screen';
import { PermissionsChecker } from 'permission-checker';

window.customElements.define(
  'capacitor-welcome',
  class extends HTMLElement {
    constructor() {
      super();

      SplashScreen.hide();

      const root = this.attachShadow({ mode: 'open' });

      root.innerHTML = `
    <style>
      :host {
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        display: block;
        width: 100%;
        height: 100%;
      }
      h1, h2, h3, h4, h5 {
        text-transform: uppercase;
      }
      .button {
        display: inline-block;
        padding: 10px;
        background-color: #73B5F6;
        color: #fff;
        font-size: 0.9em;
        border: 0;
        border-radius: 3px;
        text-decoration: none;
        cursor: pointer;
      }
      main {
        padding: 15px;
      }
      main hr { height: 1px; background-color: #eee; border: 0; }
      main h1 {
        font-size: 1.4em;
        text-transform: uppercase;
        letter-spacing: 1px;
      }
      main h2 {
        font-size: 1.1em;
      }
      main h3 {
        font-size: 0.9em;
      }
      main p {
        color: #333;
      }
      main pre {
        white-space: pre-line;
      }
    </style>
    <div>
      <capacitor-welcome-titlebar>
        <h1>Capacitor</h1>
      </capacitor-welcome-titlebar>
      <main>
        <p>
        <h2>Tiny Demo</h2>
        <p>
          This demo shows how to call Capacitor plugins.
        </p>
        <p>
          <button class="button" id="open-settings">Open Settings</button>
          <button class="button" id="check-perm">Check Perm</button>
          <button class="button" id="request-perm">Request Perm</button>
          <div>Permission Status<div id="permission-status"></div></div>

        </p>
        <p>
          <img id="image" style="max-width: 100%">
        </p>
      </main>
    </div>
    `;
    }

    connectedCallback() {
      const self = this;
      // Open Settings
      self.shadowRoot
        .querySelector('#open-settings')
        .addEventListener('click', async function (e) {
          try {
            console.log('[WEB] openSettings');
            PermissionsChecker.openSettings().then(res => console.log(res));
          } catch (e) {
            console.warn('User cancelled', e);
          }
        });

      // Check Permissions
      console.log('[WEB] checkPermission');
      PermissionsChecker.checkPermission({
        permission: 'local-network',
      }).then(status => {
        self.shadowRoot.querySelector('#permission-status').innerHTML =
          JSON.stringify(status);
      });
      
      // click event
      self.shadowRoot
        .querySelector('#check-perm')
        .addEventListener('click', async function (e) {
          try {
            console.log('[WEB] checkPermission');
            const status = await PermissionsChecker.checkPermission({
              permission: 'local-network',
            });
            console.log('chekpermission status', status);
            self.shadowRoot.querySelector('#permission-status').innerHTML =
              JSON.stringify(status);
          } catch (e) {
            console.warn('User cancelled', e);
          }
        });

      // Request Permissions
      self.shadowRoot
        .querySelector('#request-perm')
        .addEventListener('click', async function (e) {
          try {
            console.log('[WEB] requestPermission');
            const status = await PermissionsChecker.requestPermission({
              permission: 'local-network',
            });
            console.log('requestpermission status', status);
            self.shadowRoot.querySelector('#permission-status').innerHTML =
              JSON.stringify(status);
          } catch (e) {
            console.warn('User cancelled', e);
          }
        });
    }
  },
);

window.customElements.define(
  'capacitor-welcome-titlebar',
  class extends HTMLElement {
    constructor() {
      super();
      const root = this.attachShadow({ mode: 'open' });
      root.innerHTML = `
    <style>
      :host {
        position: relative;
        display: block;
        padding: 15px 15px 15px 15px;
        text-align: center;
        background-color: #73B5F6;
      }
      ::slotted(h1) {
        margin: 0;
        font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
        font-size: 0.9em;
        font-weight: 600;
        color: #fff;
      }
    </style>
    <slot></slot>
    `;
    }
  },
);
