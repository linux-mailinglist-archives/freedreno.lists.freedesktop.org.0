Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A1D79315A
	for <lists+freedreno@lfdr.de>; Tue,  5 Sep 2023 23:52:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9667610E0AE;
	Tue,  5 Sep 2023 21:52:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1612910E09C
 for <freedreno@lists.freedesktop.org>; Tue,  5 Sep 2023 21:52:40 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5007f3d3235so4798790e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 05 Sep 2023 14:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693950758; x=1694555558;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=poTEsy/DpCYMp8kn/k9olR9s+199uTi+MS4Yqzd7g30=;
 b=cREgeim7Z+/K5/YgBrNHqHlcoaZLr5sZpO4OXvL0AeiZ2spCUjJgLisXkf1kOevHi4
 IYwjzi2GZzjeqBEdq9s0tu52fPYltFHMOU/O3VS3x+1b5DGyiMyVwnmzr/nhPyX9xaEc
 ppinVBAsHEnM7qKgSQGaGv1Vn5r3ueXFSVxGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693950758; x=1694555558;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=poTEsy/DpCYMp8kn/k9olR9s+199uTi+MS4Yqzd7g30=;
 b=I4vLdnuCpMM9ndkHVegSNn7/ZDauedXds7bGA4LFuVFGYeRA1vnZ7aToCuydnp5mfb
 aOqAiBLv+uVpxkrbs3Jiu320JctOFJS75UJ457y/hL4lQQBaIxaepapep5eDpBhnCxyy
 i8/7Sk3tFozqQAvXpt2knj/Gy7wUvllKhywsoPW5sZuIM8UYussTLjQkmYjtt3O5TfSG
 jf3FJoM0QZd1V/EwqpsrBr4BrcxN4rhdfYsW+pBxy7PdpVqvSm0NvAyPUJQhaYbfHrZ3
 5Igi0CEdLkiwxUFM4lDgowssaewADZDDnw6kLOARQgKILiBFxYFAbfWIj1XH6APUIWrN
 A2Xg==
X-Gm-Message-State: AOJu0YyS3XTwtLdlRm9s79Wk/v0E210UpZbYnKmvDr2wRefayhz8kYS+
 3uKdJy0x/qflYaKTuovW43fUoYcR+dXds0eWYXgXYg==
X-Google-Smtp-Source: AGHT+IE3JWihciGf0rRrSsH9PjyDJ4bYAVgfmGDiVcDY3TEzyqBgkL1t/dLNdH5Gs/1zTaB+TQSko2czegvMLQZy5cI=
X-Received: by 2002:a19:671a:0:b0:4fe:1681:9378 with SMTP id
 b26-20020a19671a000000b004fe16819378mr706226lfc.66.1693950758130; Tue, 05 Sep
 2023 14:52:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 5 Sep 2023 16:52:37 -0500
MIME-Version: 1.0
In-Reply-To: <726d4be5-d207-4176-bc0d-43492eb2c4e5@linaro.org>
References: <20230829184735.2841739-1-swboyd@chromium.org>
 <20230829184735.2841739-8-swboyd@chromium.org>
 <726d4be5-d207-4176-bc0d-43492eb2c4e5@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 5 Sep 2023 16:52:37 -0500
Message-ID: <CAE-0n50Ka++WMKey_Nqm1drkQZLj6gnPSf=P2NX9=diQ_qCgtg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 7/7] drm/msm/dp: Remove
 dp_display_is_ds_bridge()
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
Cc: Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 patches@lists.linux.dev, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 15:40:49)
> On 29/08/2023 21:47, Stephen Boyd wrote:
> > This function is simply drm_dp_is_branch() so use that instead of
> > open-coding it.
> >
> > Cc: Vinod Polimera <quic_vpolimer@quicinc.com>
> > Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c | 9 +--------
> >   1 file changed, 1 insertion(+), 8 deletions(-)
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thanks.

>
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index 76f13954015b..96bbf6fec2f1 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -341,19 +341,12 @@ static const struct component_ops dp_display_comp_ops = {
> >       .unbind = dp_display_unbind,
> >   };
> >
> > -static bool dp_display_is_ds_bridge(struct dp_panel *panel)
> > -{
> > -     return (panel->dpcd[DP_DOWNSTREAMPORT_PRESENT] &
> > -             DP_DWN_STRM_PORT_PRESENT);
> > -}
> > -
> >   static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
>
> Nit: you might as well inline this function

Ok. I'll send a followup to this series with a patch for that. I found
that with an Apple dongle it always prints out a message to the kernel
log when I have HDMI disconnected that there isn't a sink connected,
which is annoying.

So at least two more patches are incoming.
