Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8818E39AAD8
	for <lists+freedreno@lfdr.de>; Thu,  3 Jun 2021 21:19:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B5A6F4FB;
	Thu,  3 Jun 2021 19:19:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E600F6F4FD
 for <freedreno@lists.freedesktop.org>; Thu,  3 Jun 2021 19:19:53 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 q9-20020a9d66490000b02903c741e5b703so5695026otm.0
 for <freedreno@lists.freedesktop.org>; Thu, 03 Jun 2021 12:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XDuTHy+WSy89MPdjzMkB+2AAnStth5q1riD/MqItVU4=;
 b=OI+T3T0cL+t14gfJunetRWN2tgWBdLvB4KxFRPyK5DVeHqTxqvLnfDIA5BvAnl6X2Q
 3QPRLndKmLybEGc4bt8aZ34d10UMz+vVibFdpJL+LApb1vVQutb06CCJcPEC7QV5PXDj
 TBdhq3qXqsTYTBozWkE7SUSfa41pqf+LXpaAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XDuTHy+WSy89MPdjzMkB+2AAnStth5q1riD/MqItVU4=;
 b=YHGgIVrx3jPUlYTvhSy0pv1fG16fnhTOcXX04gsm3E3jKePVPVv4RRRPzeYS2N1mru
 lrd9mgrz3SkkbPbaSWyi54Q9xPCqOrZlH7ODq698+34lc9gmqZpps3wc4jeO56zDukVV
 fKyoVIv1Ku67VNC7YKoVoSCHCdsIDqwKZM+ndsiBvSPoxmoWz17yBn514yg5BOPYNkd+
 Bl8T9EQ5QR5Zs7jADU8eVfTiM2DS/pBILb5bSAgNeTs1EG3iZ+Cu3VFCXthwm2Rs7PqF
 pyBaFO7WfQnjM/8QuZGkFb0q3/iT/Ut2VV6n+GNqb1bZIlEq3XNGv6od1bXyAsABhRUN
 HFnA==
X-Gm-Message-State: AOAM530KsUzYk8COAqhlaN0Q9XuchkM9pLs1Ys1jmPB6miNHjDaU434H
 bmhkzFRBzAPunUAPb7abpWREkWnn3iDVJDw1L2OrGg==
X-Google-Smtp-Source: ABdhPJxn3K6b7ZhhEb/4cSo+a3w6aFxRrwtuOfV0rALuSFrFAk8eTzKE1DKQNbbx3q34atx5iWRm6vKzm7Sjgap1ebk=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr687970otb.281.1622747993300; 
 Thu, 03 Jun 2021 12:19:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210602215252.695994-1-keescook@chromium.org>
 <20210602215252.695994-4-keescook@chromium.org>
 <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
In-Reply-To: <CAL_JsqLO_YbT3VU0+uHH2t6ONs_dWfBhqds9okYD0254ZiBf=A@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 3 Jun 2021 21:19:42 +0200
Message-ID: <CAKMK7uFBQk+KA0fPdjkB9=7By2a9V5i=u84ufO+n3dmjayq+vw@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Kees Cook <keescook@chromium.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Dave Airlie <airlied@redhat.com>, freedreno <freedreno@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Linus Walleij <linus.walleij@linaro.org>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, Jun 3, 2021 at 8:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, Jun 2, 2021 at 4:53 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > Avoid randconfig build failures by requiring VEXPRESS_CONFIG:
> >
> > aarch64-linux-gnu-ld: drivers/gpu/drm/pl111/pl111_versatile.o: in function `pl111_vexpress_clcd_init':
> > pl111_versatile.c:(.text+0x220): undefined reference to `devm_regmap_init_vexpress_config'
>
> pl111_vexpress_clcd_init() starts with:
>
> if (!IS_ENABLED(CONFIG_VEXPRESS_CONFIG))
>                 return -ENODEV;
>
> Isn't that supposed to be enough to avoid an undefined reference?
>
> Making the whole file depend on VEXPRESS_CONFIG is not right either.
> Not all platforms need it.

It needs a compile-time status inline then for the functions we're
using in pl111.
-Daniel

>
> >
> > Fixes: 826fc86b5903 ("drm: pl111: Move VExpress setup into versatile init")
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  drivers/gpu/drm/pl111/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> > index 80f6748055e3..c5210a5bef1b 100644
> > --- a/drivers/gpu/drm/pl111/Kconfig
> > +++ b/drivers/gpu/drm/pl111/Kconfig
> > @@ -2,7 +2,7 @@
> >  config DRM_PL111
> >         tristate "DRM Support for PL111 CLCD Controller"
> >         depends on DRM
> > -       depends on ARM || ARM64 || COMPILE_TEST
> > +       depends on VEXPRESS_CONFIG
> >         depends on COMMON_CLK
> >         select DRM_KMS_HELPER
> >         select DRM_KMS_CMA_HELPER
> > --
> > 2.25.1
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
