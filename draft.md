import { test } from '@playwright/test'

function base64ToBytes(base64) {
  const binString = atob(base64);
  return Uint8Array.from(binString, (m) => m.codePointAt(0));
}


test.describe("$name$", () => {
    const collection = new TextDecoder().decode(base64ToBytes("$collection$"));
    
    for (const object of collection.children) {
        test(`$${object.title}`, ({ page }) => {
            // run agents in a way that can be stepped through using --debug
        })
    }
})