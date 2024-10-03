module.exports = {
  parser: "@typescript-eslint/parser", // TypeScriptのパーサーを指定
  plugins: ["@typescript-eslint"], // TypeScriptプラグインを使用
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended", // TypeScriptの推奨ルールを使用
    "plugin:prettier/recommended", // Prettierの推奨設定を使用
  ],
  env: {
    node: true, // Node.jsのグローバル変数とスコープを有効にする
    es2021: true, // ES2021の構文を有効にする
  },
  parserOptions: {
    ecmaVersion: 2021, // ES2021を指定
    sourceType: "module", // モジュールシステムを使用
  },
  rules: {
    // 追加のルールやオーバーライドするルールをここに記述
  },
};
