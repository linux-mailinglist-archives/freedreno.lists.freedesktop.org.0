Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 343B854FE97
	for <lists+freedreno@lfdr.de>; Fri, 17 Jun 2022 22:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D161210E51C;
	Fri, 17 Jun 2022 20:57:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com
 [IPv6:2607:f8b0:4864:20::f30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 019FC10E51C
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 20:57:51 +0000 (UTC)
Received: by mail-qv1-xf30.google.com with SMTP id q104so8108095qvq.8
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 13:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hDtLYPm2MMigLAt4hK4D4gopZVE7gxxmAJsjtSbkquo=;
 b=KvM+zOwenoPEZEM+sD4rQlX4KI0rJiZLzzuMqiBInkMRR3KmfTvp3Nl9FdrppYdBNQ
 pkH2Fti9wP76em/NLAoOXqszBPVd3nRZZ5lGFwww8wQ0gPjHzXERYaG439cSG1fCHWVZ
 vaj8dTD0wenZ/QhWn3mN0AoDigjMjKp6EtyMXBWRb1opO2ySIXiHp4B6QqCU3/n2zAQ3
 zKQqbPQeQT5Yg9ASShFaMZMdzaEKy4lD+EdLWD+seeGLdhTSlZAnKA2J+99HU8B6bCyw
 ot7cFhnLPrmexoYtntm+pVCTb0LNJPt6dWvvNURP+IZkp8h3cl9wqEJevyXJPEeRzlPA
 SESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hDtLYPm2MMigLAt4hK4D4gopZVE7gxxmAJsjtSbkquo=;
 b=dHB3A0tqN/cQ3LLqkTSN4mt/VJpjz2dLxbx6C15VffYve0r0knXX6LrObLF8KH8rv0
 r83lbjmgYcWdriwsLriFeogTJmpHufW7uTmezvGmbK/IROCmg9tHb5xacXOBe0ppsm+M
 8ANyi37U+atlo8Wknh0RCAho2/B89UhqsZ/oWFbiKJPpSE5826h/PlGXvuPNTUvtT00u
 rSoKWelJFqhvKoAogLcA49CTm4mkzX/PVqc0iyjWoZivc+qWyRE2ucHiAItq40bTkd1u
 jyCEMeFSFt7Iknaj1dkmogEasxHzH8Z3fmYaykcy434a0Xl2Pr/z4LfYNoUT/zvHTt/B
 9cTw==
X-Gm-Message-State: AJIora8VlfpionfV0zCPA2YUBMAstVVVuDmQsEETN4lnXP7AAvzHJn2t
 /GebLPhs817vbBNd/BFzeiKg3CA72jnpJYpm9Pwjvg==
X-Google-Smtp-Source: AGRyM1vCXUo2pwCd9vh+yQdc3TauvRb4LW5fVuO1WIW1usW/rP7ntYxG+OndbFZDUC4+ETvTVr4fsiXrD/4xePRqfqU=
X-Received: by 2002:a05:6214:5488:b0:46b:b272:f7d1 with SMTP id
 lg8-20020a056214548800b0046bb272f7d1mr9978782qvb.73.1655499470989; Fri, 17
 Jun 2022 13:57:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220617191429.1087634-1-dmitry.baryshkov@linaro.org>
 <20220617191429.1087634-4-dmitry.baryshkov@linaro.org>
 <CAE-0n51vBRdNNM3BH90uG5TH=Gr51rX9B527L4U2yXh1YXYiQQ@mail.gmail.com>
In-Reply-To: <CAE-0n51vBRdNNM3BH90uG5TH=Gr51rX9B527L4U2yXh1YXYiQQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 17 Jun 2022 23:57:39 +0300
Message-ID: <CAA8EJpq0P+pyfspMQp6ed7kcsmjFPEUCn36rdDWDVO5SQ6vL9A@mail.gmail.com>
To: Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 3/3] drm/msm: stop storing the array of
 CRTCs in struct msm_drm_private
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 17 Jun 2022 at 23:52, Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Dmitry Baryshkov (2022-06-17 12:14:29)
> > diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> > index 44485363f37a..567e77dae43b 100644
> > --- a/drivers/gpu/drm/msm/msm_drv.c
> > +++ b/drivers/gpu/drm/msm/msm_drv.c
> > @@ -427,20 +428,23 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
> >         ddev->mode_config.funcs = &mode_config_funcs;
> >         ddev->mode_config.helper_private = &mode_config_helper_funcs;
> >
> > -       for (i = 0; i < priv->num_crtcs; i++) {
> > +       drm_for_each_crtc(crtc, ddev) {
> > +               struct msm_drm_thread *ev_thread;
> > +
> >                 /* initialize event thread */
> > -               priv->event_thread[i].crtc_id = priv->crtcs[i]->base.id;
> > -               priv->event_thread[i].dev = ddev;
> > -               priv->event_thread[i].worker = kthread_create_worker(0,
> > -                       "crtc_event:%d", priv->event_thread[i].crtc_id);
> > -               if (IS_ERR(priv->event_thread[i].worker)) {
> > -                       ret = PTR_ERR(priv->event_thread[i].worker);
> > +               ev_thread = &priv->event_thread[drm_crtc_index(crtc)];
> > +               ev_thread->crtc = crtc;
> > +               ev_thread->dev = ddev;
> > +               ev_thread->worker = kthread_create_worker(0,
> > +                       "crtc_event:%d", ev_thread->crtc->base.id);
> > +               if (IS_ERR(ev_thread->worker)) {
> > +                       ret = PTR_ERR(ev_thread->worker);
> >                         DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
> > -                       ret = PTR_ERR(priv->event_thread[i].worker);
> > +                       ev_thread->worker = NULL;
>
> This wasn't set to NULL before, so is it necessary to set it to NULL
> now?

The msm_drm_uninit() will loop over the event_thread array and try to
cleanup workers. However if the ev_thread->worker contains the error
code, then we risk getting an oops.

Let me take another glance onto this code and split this into a
separate fixup patch.

-- 
With best wishes
Dmitry
