
const readLineStr = require('readline');

class RemoveVowels {
    constructor() {
      this.vowels = new Set(['a', 'e', 'i', 'o', 'u', 'A', 'E', 'I', 'O', 'U']);
    }
  
    removeVowels(str) {
      try {
        return str.split('').filter(char => !this.vowels.has(char)).join('');
      } catch (error) {
        console.error('Error removing vowels: ' + error.message);
        return '';
      }
    }
  }
  
  function main() {
    const rls = readLineStr.createInterface({
      input: process.stdin,
      output: process.stdout
    });
  
    rls.question('Please enter the word from which to remove the vowels: ', (answer) => {
      const removeVowels = new RemoveVowels();
      const result = removeVowels.removeVowels(answer);
  
      console.log(`Input: ${answer}`);
      console.log(`Result: ${result}`);
  
      rls.close();
    });
  }
  
  main();