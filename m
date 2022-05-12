Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78910525782
	for <lists+freedreno@lfdr.de>; Fri, 13 May 2022 00:02:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2A410E36E;
	Thu, 12 May 2022 22:02:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1653A10E36E
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 22:02:14 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id j6so12759343ejc.13
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 15:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qrcFnQX5TKrAaSWz2egEofhfAACl36nsw6XjrjYC63Y=;
 b=kUdCvWoKFKqd2DECKwKOUZZMOgwaUIBR0oNZV8k8LmwvpiRlxUhX8z349mWXSeUHwj
 U4QWNVYNXSoHe9D558M7yqKGsIQauYAzEZN7Wp2Akwgc2KAhac4TMyRegvJFqPDEU7c/
 rtc2WhmiJ0UCk0/Vh46m3OKqFsqaYreMiLm1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qrcFnQX5TKrAaSWz2egEofhfAACl36nsw6XjrjYC63Y=;
 b=Hb0t1DlNKAqFZhGmayJzSkvLImHWn+LC/Q6yNvdYrnVQYP59ZrobcA8Fro1RIQf6P3
 JOqQz0cICkAGKiHZNwoFi3S4CtgAgNMgWMx4cbMqwkcnYaFy9CZtsnayCt+5S/XYLUWB
 5glmlCzWq74SZCRSEvh2jrFpkVhsp04WQGCJvuSrXfaT0TnpVOhwZKXd5jYU5p/XyXFV
 Frodw3GQguLIi58yXHpFutSR6La8SRdsNnoHhva3BNUAfYCN2AsxK2u5aInwnzqtzK21
 hognuO3nzboxC6YIBoJ22y4TLatwQcD0cv0no8ODOAk6+fNIzVg3k279T+qVIc1kE++q
 8V2g==
X-Gm-Message-State: AOAM530PKal3pNnIGND4K93QitQ7nfAClvEp4j2o/canWctKI+h18Lx9
 jr+xtcyT37JjGqPXfm2BojDF035YUaiZBTag
X-Google-Smtp-Source: ABdhPJxIhPv5NpMjD+ERKeSUvCXIA1P4cr2KUvUDiv03WIF+ej/oIGYxxDiweaKZzyFaXYl2auRapw==
X-Received: by 2002:a17:907:3d89:b0:6f4:7e66:b500 with SMTP id
 he9-20020a1709073d8900b006f47e66b500mr1701616ejc.134.1652392932329; 
 Thu, 12 May 2022 15:02:12 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 n21-20020a17090673d500b006f506ed0b42sm164921ejl.48.2022.05.12.15.02.11
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 15:02:11 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id
 n6-20020a05600c3b8600b0039492b44ce7so3765302wms.5
 for <freedreno@lists.freedesktop.org>; Thu, 12 May 2022 15:02:11 -0700 (PDT)
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr12055524wmb.29.1652392930664; Thu, 12
 May 2022 15:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220512135134.v3.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid>
 <e8d75148-22ee-5809-fc65-d0fb38ad4876@linaro.org>
In-Reply-To: <e8d75148-22ee-5809-fc65-d0fb38ad4876@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 May 2022 15:01:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UhTuhOOjG15S=bXQBq1UAskr2s5fubsD4xvnp589-8_Q@mail.gmail.com>
Message-ID: <CAD=FV=UhTuhOOjG15S=bXQBq1UAskr2s5fubsD4xvnp589-8_Q@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3] drm/msm/dsi: only powerup at modeset
 time if "early_poweron" modparam
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
Cc: Vinod Koul <vkoul@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, freedreno <freedreno@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, May 12, 2022 at 1:59 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/05/2022 23:52, Douglas Anderson wrote:
> > Commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> > time") caused sc7180 Chromebooks that use the parade-ps8640 bridge
> > chip to fail to turn the display back on after it turns off.
> >
> > Unfortunately, it doesn't look easy to fix the parade-ps8640 driver to
> > handle the new power sequence. The Linux driver has almost nothing in
> > it and most of the logic for this bridge chip is in black-box firmware
> > that the bridge chip uses.
> >
> > Also unfortunately, reverting the patch will break "tc358762".
> >
> > The long term solution here is probably Dave Stevenson's series [1]
> > that would give more flexibility. However, that is likely not a quick
> > fix.
> >
> > For the short term, let's introduce a module parameter that selects
> > between the two behaviors. This is a short term hack but at least can
> > keep both users working. We'll default the value of the module
> > parameter to the old behavior. Given that the old behavior has existed
> > for longer it's probably a safer default.
> >
> > [1] https://lore.kernel.org/r/cover.1646406653.git.dave.stevenson@raspberrypi.com
> >
> > Fixes: 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset time")
> > Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Two minor issues below.

I only saw one, so hopefully I didn't miss another request. ;-)


> > ---
> >
> > Changes in v3:
> > - No longer a revert; now a module parameter.
> >
> > Changes in v2:
> > - Remove the mud from my face.
> >
> >   drivers/gpu/drm/msm/dsi/dsi_manager.c | 10 +++++++++-
> >   1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > index 50b987658b1f..2bf4123ef5df 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > @@ -34,6 +34,10 @@ static struct msm_dsi_manager msm_dsim_glb;
> >   #define IS_SYNC_NEEDED()    (msm_dsim_glb.is_sync_needed)
> >   #define IS_MASTER_DSI_LINK(id)      (msm_dsim_glb.master_dsi_link_id == id)
> >
> > +bool early_poweron;
> > +MODULE_PARM_DESC(early_poweron, "Power DSI controller early");
> > +module_param(early_poweron, bool, 0600);
>
> Nit: dsi_early_poweron (to be clear that it related to DSI only).
>
> I thought about suggesting 'dsi_no_early_poweron' instead to catch
> possible issues with other bridges. But... I think with Dave's series
> will have to enable bridges one by one, so it doesn't make real sense.

I made the change you requested and was about to send out a v4 when
offline Rob pointed out a better way that seems to work. I can use the
`compatible` of the next bridge. I've sent out v4 as per Rob's
suggestion:

https://lore.kernel.org/r/20220512145954.v4.1.Ia196e35ad985059e77b038a41662faae9e26f411@changeid

-Doug
