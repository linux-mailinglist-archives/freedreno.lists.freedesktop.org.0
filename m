Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 146B952E120
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 02:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A270F10E3D0;
	Fri, 20 May 2022 00:23:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384F710E3D0
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 00:23:43 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id y13so12056634eje.2
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 17:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NkNsmxiQk+nW3UDbjO7QxzvaqncjAzBvhuR1VH6Vk60=;
 b=bA4kB8OhrG3AO6xz5No7HEoss1T72t7wOhdeRdSsdZLYCzD5aJYviGdcdpnznfPifZ
 yuRj+lDxOoXXam02skD8mXDZraaqUDT3pVNFce59ArewYDhYNcYKJahlU2Ir6PagSJtJ
 9VEQUM21705l7JBJccvc9ZdGE5VGkEK28WMdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NkNsmxiQk+nW3UDbjO7QxzvaqncjAzBvhuR1VH6Vk60=;
 b=p8TA8RmMhCVblAFy/C9e0k9QY2+9nLFXVuZeulolY6m7L5lJ9jPxANQ0mqX1Dk0OqA
 nXyOwTHZdtP/JM8gwrLSXfkFhmVScQb4TjtXxoP8hTB/meNUwiXJP6YastMBvdk8qg2g
 aJTKp9XuBJ+NKVGRFNPamXowQznD+3ChPLMGyJkWOEeMz/Y0viSScqKL4twYM2HZ8Xxz
 X7FAXkySodqYVKgQi1Q1Dj0oOVYbs4VycXbJxxTmdD9d8c3W9dbHWmOB/rTMXmTUbcyC
 HlXDQ0km7GsbmNxcdivvESQZnYFK7Z8So8+iCo4g++C23zzWMctbOFFYP0veGoHCOXez
 US5A==
X-Gm-Message-State: AOAM5309777NlzNFk6E5hRWMdC458ZpCmQYIjB7GvehpNf8oldmoWGNo
 MBxfroPLKxuZn0YaYuQABzRFvn9EaoIooM6JMUs=
X-Google-Smtp-Source: ABdhPJxdNCG+F5hSGIUhw1el+qRK+i2bLXZRmC5bvBug+Rv0BqO7cMk3cVBNXEwUOUGwpG4JeobNxw==
X-Received: by 2002:a17:907:7242:b0:6f5:2ca3:f1cd with SMTP id
 ds2-20020a170907724200b006f52ca3f1cdmr6666960ejc.480.1653006221551; 
 Thu, 19 May 2022 17:23:41 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 dv11-20020a170906b80b00b006f3ef214dd5sm2607652ejb.59.2022.05.19.17.23.39
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 May 2022 17:23:39 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id
 r6-20020a1c2b06000000b00396fee5ebc9so3551950wmr.1
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 17:23:39 -0700 (PDT)
X-Received: by 2002:a05:600c:3c99:b0:392:b49c:7b79 with SMTP id
 bg25-20020a05600c3c9900b00392b49c7b79mr5830883wmb.199.1653006218866; Thu, 19
 May 2022 17:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220509161733.v2.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
In-Reply-To: <20220509161733.v2.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 May 2022 17:23:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XWYFDMYvZJWDnV2Yc+5X=NThYnE78aOeMrhrEvBiDLkQ@mail.gmail.com>
Message-ID: <CAD=FV=XWYFDMYvZJWDnV2Yc+5X=NThYnE78aOeMrhrEvBiDLkQ@mail.gmail.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm: Document the power requirements for
 DP AUX transfers
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
Cc: Lyude Paul <lyude@redhat.com>, Kees Cook <keescook@chromium.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, May 9, 2022 at 4:18 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> When doing DP AUX transfers there are two actors that need to be
> powered in order for the DP AUX transfer to work: the DP source and
> the DP sink. Commit bacbab58f09d ("drm: Mention the power state
> requirement on side-channel operations") added some documentation
> saying that the DP source is required to power itself up (if needed)
> to do AUX transfers. However, that commit doesn't talk anything about
> the DP sink.
>
> For full fledged DP the sink isn't really a problem. It's expected
> that if an external DP monitor isn't plugged in that attempting to do
> AUX transfers won't work. It's also expected that if a DP monitor is
> plugged in (and thus asserting HPD) then AUX transfers will work.
>
> When we're looking at eDP, however, things are less obvious. Let's add
> some documentation about expectations. Here's what we'll say:
>
> 1. We don't expect the DP AUX transfer function to power on an eDP
> panel. If an eDP panel is physically connected but powered off then it
> makes sense for the transfer to fail.
>
> 2. We'll document that the official way to power on a panel is via the
> bridge chain, specifically by making sure that the panel's prepare
> function has been called (which is called by
> panel_bridge_pre_enable()). It's already specified in the kernel doc
> of drm_panel_prepare() that this is the way to power the panel on and
> also that after this call "it is possible to communicate with any
> integrated circuitry via a command bus."
>
> 3. We'll also document that for code running in the panel driver
> itself that it is legal for the panel driver to power itself up
> however it wants (it doesn't need to officially call
> drm_panel_pre_enable()) and then it can do AUX bus transfers. This is
> currently the way that edp-panel works when it's running atop the DP
> AUX bus.
>
> NOTE: there was much discussion of all of this in response to v1 [1]
> of this patch. A summary of that is:
> * With the Intel i195 driver, apparently eDP panels do get powered
>   up. We won't forbid this but it is expected that code that wants to
>   run on a variety of platforms should ensure that the drm_panel's
>   prepare() function has been called.
> * There is at least a reasonable amount of agreement that the
>   transfer() functions itself shouldn't be responsible for powering
>   the panel. It's proposed that if we need the DP AUX dev nodes to be
>   robust for eDP that the code handling the DP AUX dev nodes could
>   handle powering the panel by ensuring that the panel's prepare()
>   call was made. Potentially drm_dp_aux_dev_get_by_minor() could be a
>   good place to do this. This is left as a future exercise. Until
>   that's fixed the DP AUX dev nodes for eDP are probably best just
>   used for debugging.
> * If a panel could be in PSR and DP AUX via the dev node needs to be
>   reliable then we need to be able to pull the panel out of PSR. On
>   i915 this is also apparently handled as part of the transfer()
>   function.
>
> [1] https://lore.kernel.org/r/20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> ---
> Hopefully I've resolved everything here to everyone's
> satisfaction. There's no crazy hurry here. I'll give this a week or so
> and then land it on drm-misc if there is no additional discussion.
>
> Changes in v2:
> - Updated wording as per discussion on v1.
> - Updated commit message as per discussion on v1.
> - Add pointer to v1 discussion for future reference.
>
>  include/drm/display/drm_dp_helper.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)

Pushed to drm-misc-next:

69ef4a192bba drm: Document the power requirements for DP AUX transfers
