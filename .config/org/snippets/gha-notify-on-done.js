(async () => { 
  await Notification.requestPermission();

  const timer = setInterval(() => {
      if (!document.querySelectorAll('.color-yellow-7').length) {
          clearInterval(timer);
          console.log('Done');
          new Notification('Workflow action is complete');
          alert('Workflow action is complete');
      }
  }, 1000);
})();
