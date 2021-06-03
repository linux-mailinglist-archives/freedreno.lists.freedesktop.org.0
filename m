Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB8539AD06
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 23:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A736E7FE;
	Thu,  3 Jun 2021 21:41:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD906E804
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 21:41:12 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 67-20020a4a01460000b0290245b81f6261so1747001oor.6
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 14:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RKsmemGX84EJleDwuX+VwjFITpOdDOrQ1e3N8W4mlJE=;
 b=d7L6nRkj4iaP/ufzhvVC9HwhcDgFshS3f/urYGb/o/KbsmpZjWl0X8oQqqrL4jFjc7
 mJ7PiijubS520NjTOfvbDIgLab2sfsj568JQqgv1nuEJ59IbGbVpf2kyAswnofdQxWqP
 hEL3ncRTU5rQIYIJym51umthtqAnyRqKq34Vg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RKsmemGX84EJleDwuX+VwjFITpOdDOrQ1e3N8W4mlJE=;
 b=nr4p8kZViFh+xILmw1y8Vn7BEs0hrYou8jP2vXq9RDfESiRtHV3+S69ZATOmLqDKzp
 6mFfPM+DwgHxfpfASZEpeQpCv3DbK2BV9lpiJMulSJ8/928D6U/i05LL0YO+yQjR042w
 qfs97D5wopuCaJ3NSEq1bNcHTWP9WpE2v0IH9Coembf0mXIZPveZ4AAdAn+6A1dzLBe7
 RC6iiCzW73c9/+xU1Zyu6YqFriIIQ3XWTb2CxYHQYepUkXhnLsu1g+zCLsIFDC8/z8s2
 Hfnh/LqLltoHLB9DeuZuxESF/OqtMbmKrKmU3tI5FsERxHnZoHzrKsPZZ3LK8We7QX6M
 vJAQ==
X-Gm-Message-State: AOAM531cvR+SLIttlEob+lHrzg0bjZaAcZuO3rmvznjb6Yc2JTHw/sma
 GlwHCdbnhbyBtwXxXS1AN3zwwxgsG9WPmi7kN4cPjA==
X-Google-Smtp-Source: ABdhPJwMTirpF78qU3DTBAb2T6KPK2kTp9cTZhJvFiseeoINwxORVyJshbam+gpZ22hM3YWxEiWocM4lnAJfSkJ3W8A=
X-Received: by 2002:a4a:8e04:: with SMTP id q4mr1101448ook.28.1622756472081;
 Thu, 03 Jun 2021 14:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org>
 <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
 <CAKMK7uFBQk+KA0fPdjkB9=7By2a9V5i=u84ufO+n3dmjayq+vw@mail.gmail.com>
 <202106031357.BE2A09DA8F@keescook> <202106031422.FD9E3C5755@keescook>
In-Reply-To: <202106031422.FD9E3C5755@keescook>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 23:41:01 +0200
Message-ID: <CAKMK7uG8ZiToP2vFsr7TuhntWWh0yiaHkwU5mx5EaESoy+tTHQ@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [Freedreno] [PATCH 3/3] drm/pl111: depend on
 CONFIG_VEXPRESS_CONFIG
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
Cc: Rob Herring <robh@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 kernel test robot <lkp@intel.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@kernel.org>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Sharat Masetty <smasetty@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 11:29 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Jun 03, 2021 at 02:19:52PM -0700, Kees Cook wrote:
> > On Thu, Jun 03, 2021 at 09:19:42PM +0200, Daniel Vetter wrote:
> > > On Thu, Jun 3, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> > > > >
> > > > > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> > > > >
> > > > > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > > > > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
> > > >
> > > > pl111_vexpress_clcd_init() starts with:
> > > >
> > > > if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
> > > >                 return -ENODEV;
> > > >
> > > > Isn't that supposed to be enough to avoid an undefined reference?
> >
> > Ah! I missed that when reading the code. I see the problem now. It's
> > because of:
> >
> > CONFIG_VEXPRESS_CONFIG=m
> > CONFIG_DRM_PL111=y
> >
> > I think the right fix is:
> >
> > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > index 80f6748055e3..662fc38f92ba 100644
> > --- a/drivers/gpu/drm/pl111/Kconfig
> > +++ b/drivers/gpu/drm/pl111/Kconfig
> > @@ -3,6 +3,7 @@ config DRM_PL111
> >       tristate "DRM Support for PL111 CLCD Controller"
> >       depends on DRM
> >       depends on ARM || ARM64 || COMPILE_TEST
> > +     depends on VEXPRESS_CONFIG=y || VEXPRESS_CONFIG=DRM
>
> Oops, no, I had this backwairds:
>
>         depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM

Can you pls throw this into an incremental patch on top of
drm-misc-next? It's a non-rebasing tree and all that (linux-next
should have it next day too I guess).

Thanks, Daniel

> _that_ lets me build with:
>
> # CONFIG_VEXPRESS_CONFIG is not set
> CONFIG_DRM_PL111=y
>
> CONFIG_VEXPRESS_CONFIG=y
> CONFIG_DRM_PL111=y
>
> CONFIG_VEXPRESS_CONFIG=m
> CONFIG_DRM_PL111=m
>
> CONFIG_VEXPRESS_CONFIG=y
> CONFIG_DRM_PL111=m
>
> and disallows:
>
> CONFIG_VEXPRESS_CONFIG=m
> CONFIG_DRM_PL111=y
>
> (this will force CONFIG_DRM_PL111=m)
>
> -Kees
>
> >       depends on COMMON_CLK
> >       select DRM_KMS_HELPER
> >       select DRM_KMS_CMA_HELPER
> >
> > I will go check the defconfigs Rob mentioned...
> >
> > > > Making the whole file depend on VEXPRESS_CONFIG is not right either.
> > > > Not all platforms need it.
> > >
> > > It needs a compile-time status inline then for the functions we're
> > > using in pl111.
> >
> > FYI, this is the config I was working from, which was throwing link errors:
> > https://lore.kernel.org/lkml/202105300926.fX0MYySp-lkp@intel.com/
> >
> > > -Daniel
> > >
> > > >
> > > > >
> > > > > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > > > > Signed-off-by: Kees Cook <keescook@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/pl111/Kconfig | 2 +-
> > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > > > > index 80f6748055e3..c5210a5bef1b 100644
> > > > > --- a/drivers/gpu/drm/pl111/Kconfig
> > > > > +++ b/drivers/gpu/drm/pl111/Kconfig
> > > > > @@ -2,7 +2,7 @@
> > > > >  config DRM_PL111
> > > > >         tristate "DRM Support for PL111 CLCD Controller"
> > > > >         depends on DRM
> > > > > -       depends on ARM || ARM64 || COMPILE_TEST
> > > > > +       depends on VEXPRESS_CONFIG
> > > > >         depends on COMMON_CLK
> > > > >         select DRM_KMS_HELPER
> > > > >         select DRM_KMS_CMA_HELPER
> > > > > --
> > > > > 2.25.1
> > > > >
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> > --
> > Kees Cook
>
> --
> Kees Cook



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
