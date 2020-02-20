(async () => { 
  await Notification.requestPermission();

  const timer = setInterval(() => {
      if (!document.querySelectorAll('.color-yellow-7').length) {
          clearInterval(timer);
          new Notification('Workflow action is complete');
      }
  }, 1000);
})();
