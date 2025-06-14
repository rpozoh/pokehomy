'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "06a7c95614a032b2f8b0aa1050fe9563",
"assets/AssetManifest.bin.json": "c381028add20ad017b9b98cc80990a83",
"assets/AssetManifest.json": "fcc97fe9a621df009e08ff7fd3778db7",
"assets/assets/images/absol.png": "f7631e25e8e82e87fa8e0b4b51405610",
"assets/assets/images/aegislash.png": "3b68de12604e9ebe4217515369b0683a",
"assets/assets/images/alcremie.png": "698d8446a234b491c2e8edaa9fa48958",
"assets/assets/images/alolan-ninetales.png": "f105988f646c35e2d03a5e84437c64f2",
"assets/assets/images/alolan-raichu.png": "24e29084d0dd27918db194fd52b4675b",
"assets/assets/images/armarouge.png": "ced3bdb58b838ade8f042e140c1eacdd",
"assets/assets/images/azumarill.png": "cd335627d8af97f13162a95fcde177a3",
"assets/assets/images/blastoise.png": "7b14b61acc7a840004e9732dceb863cd",
"assets/assets/images/blaziken.png": "570c52124fb261958c397c18d5121d5a",
"assets/assets/images/blissey.png": "5b8166c8a8d423761dde1d95d4263bff",
"assets/assets/images/buzzwole.png": "25d0c6a6622b44d664ceb831babc92a3",
"assets/assets/images/ceruledge.png": "74f671ff57a7012380d76b4e9b56d71c",
"assets/assets/images/chandelure.png": "898701a95cb5708ec0fe4c2c62f88aa1",
"assets/assets/images/charizard.png": "ebdd25473bf824166c8fe4c1aca9982a",
"assets/assets/images/cinderace.png": "96133bc505726de19b479b1e1dcc9c99",
"assets/assets/images/clefable.png": "0e0be6e60d9d0b2e36ba78fee286c2a0",
"assets/assets/images/comfey.png": "7c342bdfc68d463655bb40485eef9fab",
"assets/assets/images/cramorant.png": "abe974d9e90684bd9e82ad7b8371257c",
"assets/assets/images/crustle.png": "e399443c482abf6b70102f977d677c29",
"assets/assets/images/darkrai.png": "a3868ba665d7a6d4d475fda61d696023",
"assets/assets/images/decidueye.png": "571db72d920078ae610837b034120c27",
"assets/assets/images/default.png": "ec004248b7d8d62c912fb320945463c5",
"assets/assets/images/delphox.png": "cb49c72817d11bc614498dc0a3682262",
"assets/assets/images/dodrio.png": "d45e932f05ff5bc6c9aa17f6b30f27a4",
"assets/assets/images/dragapult.png": "8e39fa71029d818d4b8afba5ae5282fe",
"assets/assets/images/dragonite.png": "56a6d817a584a97493904304c6f11aa6",
"assets/assets/images/duraludon.png": "90bc1c9b40a0859021539e764eab3be9",
"assets/assets/images/eldegoss.png": "7aaf2478e55cd92f9ba2858b50290bd9",
"assets/assets/images/espeon.png": "672b39295ed3343f61483ba4b83697d5",
"assets/assets/images/falinks.png": "b795766dec557e61453f7bb2736f5cc1",
"assets/assets/images/galarian-rapidash.png": "eea0a91f03280ca3771a3bb6b45ec22a",
"assets/assets/images/garchomp.png": "b1cd16110dce9050d4b98ce07255c513",
"assets/assets/images/gardevoir.png": "bdc69a80bbc9d3ba73169c5a5ca6b393",
"assets/assets/images/gengar.png": "784d10afe8f61e895c864b4be11c81af",
"assets/assets/images/glaceon.png": "a1304a72c868291b80b2f93bee10a995",
"assets/assets/images/goodra.png": "44b24c73494943f9395694480e685a2a",
"assets/assets/images/greedent.png": "8d92efbf29455b7960ebe0585d521953",
"assets/assets/images/greninja.png": "2c0a791361710919681171132f6e0eba",
"assets/assets/images/gyarados.png": "25ab3112f4bf036fbb05f56b0d9a286c",
"assets/assets/images/ho-oh.png": "e11707e9b00cee8af4dfe7611c908334",
"assets/assets/images/hoopa.png": "7805a473d17020f53b34ab8dd1aac040",
"assets/assets/images/inteleon.png": "3a44f93ea538d215f64c23f2a328151f",
"assets/assets/images/lapras.png": "f5ed5aa9981cc3137abf7f441d3e47ff",
"assets/assets/images/leafeon.png": "e20541336e7ffb3abf3b8ca25ce61359",
"assets/assets/images/lucario.png": "05c24b07ee291b3a9fe684873ef3042e",
"assets/assets/images/machamp.png": "b89f2403843e83b2f084810f24fdd3b5",
"assets/assets/images/mamoswine.png": "ec3343de20425c8b16503e955600c45f",
"assets/assets/images/meowscarada.png": "2504f2dbbe3da7b4160a8a67bbdeff36",
"assets/assets/images/metagross.png": "6dfa673b877381353f483c767edbbcf3",
"assets/assets/images/mew.png": "ac902886683410f26f5f88c52675d9a4",
"assets/assets/images/mewtwoX.png": "a8aedf99afa15f056e277d977d60f353",
"assets/assets/images/mewtwoY.png": "6c4cf7eb914820caee437b7c25533bb9",
"assets/assets/images/mimikyu.png": "aac9648b0e5905c792e9dc2c5606b0b5",
"assets/assets/images/miraidon.png": "710c89b93b464408ac6e8a2c8a3b66ee",
"assets/assets/images/mr-mime.png": "32c36f51c3ca245338d20aac327a51cf",
"assets/assets/images/pikachu.png": "2649722b8a37cf77cb6deb3b8bc4723a",
"assets/assets/images/psyduck.png": "dedee015783977d1ebed6c4756e6e8b2",
"assets/assets/images/sableye.png": "0ecf505894ce9bf780f6fee9b5930516",
"assets/assets/images/scizor.png": "26c8055e185c03bf9fa7488a2844dcb2",
"assets/assets/images/slowbro.png": "f920ffc7364ec4a5d255aecae4dbed83",
"assets/assets/images/snorlax.png": "f946c2c109695f5f56b732bddfa2d11e",
"assets/assets/images/suicune.png": "22d47e186a60988489c50143bb26b5d9",
"assets/assets/images/sylveon.png": "a8164fb33ae47a569d438917401a4770",
"assets/assets/images/talonflame.png": "f320928ad3599bfd007053a1e03edc12",
"assets/assets/images/tinkaton.png": "3c61376bef4339f68675ea7a8ef68ee2",
"assets/assets/images/trevenant.png": "05db71916ec81ce77e8aaca52656e361",
"assets/assets/images/tsareena.png": "bae0cbc7187eba12953ccc3847185310",
"assets/assets/images/tyranitar.png": "ada6a1ccb45f542b325ca4db86051265",
"assets/assets/images/umbreon.png": "8c9501f623ad54918baf3e3981caa804",
"assets/assets/images/urshifu.png": "2b111007f8de842882f0325311ed9703",
"assets/assets/images/venusaur.png": "c4d81cde3a72fcb0b49ac2889a82fa7d",
"assets/assets/images/wigglytuff.png": "3027b74529d43f4912e1d5205f812e3f",
"assets/assets/images/zacian.png": "f722f343e69c6a8b265b75ffad24f42e",
"assets/assets/images/zeraora.png": "d80b4406e5c32b81aa59cba9f40a6292",
"assets/assets/images/zoroark.png": "3b4507fb68da44a5f3b809dc6405b1d4",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/NOTICES": "09c5c408928a4ce43f2e54c7faa982f9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "80a63aff7fdc78c8a1f22a1929b7164b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "90f6d5afa6add31e0cdee6830d79cf94",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "8463611bf4d29fe7bfb183f6508b05f4",
"icons/Icon-512.png": "325db30d3c7972adc21421357a41c7c5",
"icons/Icon-maskable-192.png": "8463611bf4d29fe7bfb183f6508b05f4",
"icons/Icon-maskable-512.png": "325db30d3c7972adc21421357a41c7c5",
"index.html": "a5b772e4f76c434c41bb5a28d85b81bd",
"/": "a5b772e4f76c434c41bb5a28d85b81bd",
"main.dart.js": "b8d5c921ec8b41d84803498e0f0500da",
"manifest.json": "a2603969a23eaf8e0087acb3f6b5ef3f",
"version.json": "75627fe3bf3a6e12ca86a6a22941ebd8"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
