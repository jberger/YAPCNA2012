AV* foo () {
  AV* ret = newAV();
  /* fix mortalization */
  sv_2mortal((SV*)ret);

  av_push(ret, newSViv(1));
  av_push(ret, newSVpvf("%s", "bar"));

  /* return [ 1, "bar" ] */
  return ret;
}
