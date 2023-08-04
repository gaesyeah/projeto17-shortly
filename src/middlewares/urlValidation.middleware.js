export const isURL = (req, res, next) => {
  const { url } = req.body;
  
  const pattern = /^(http:\/\/www\.|https:\/\/www\.|http:\/\/|https:\/\/)?[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(\/.*)?$/i;

  if (!pattern.test(url)) return res.status(422).send('\"url\" must be a valid url');
  
  next();
};