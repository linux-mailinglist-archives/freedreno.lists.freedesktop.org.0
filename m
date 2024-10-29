Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 683949B535D
	for <lists+freedreno@lfdr.de>; Tue, 29 Oct 2024 21:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42AD210E6F4;
	Tue, 29 Oct 2024 20:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WEOGGojq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F120A10E6F4
 for <freedreno@lists.freedesktop.org>; Tue, 29 Oct 2024 20:25:11 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6e59a9496f9so65358297b3.0
 for <freedreno@lists.freedesktop.org>; Tue, 29 Oct 2024 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730233511; x=1730838311; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mBI2uNkuJz5hUFFer3XXwlG4B2x7GV7bsYE7YJzJyF0=;
 b=WEOGGojqoMeLvqczMBr8S2YUt0GK626KPw+tWtbAzv/NfYH6n5W+7mr2tF6Pmn2i8P
 yj7ff7yVJFSISyLQhAuZp+7fNRTlg5yiMIxmpfB1MrzLW19UK6TAZXxBzq/Mi18ExOU7
 o1AKf9c2bBVqA7f2RsiNstiIhLlJwZn9PF6wH5PL6lrWyggfzDTjnCU1YEd7Xvz6tE3r
 rDNnjqieXLBEGmMx57IpHNT5W0h6L96t9rli4HJZEXRdSJtTWDZj8Tnqoq7NzRLA7CkZ
 x1fTQBBQ30KFvRFE82eiPBUdHeeaERD+IOgjyNgzNsdIrv+ScTUp3STuxKq+rTaqZTXq
 YBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730233511; x=1730838311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mBI2uNkuJz5hUFFer3XXwlG4B2x7GV7bsYE7YJzJyF0=;
 b=hg8WMsr1qOif4gPIOAHZv7y4Jj9Yc/uE4lcRVGco0yWs/nv8CpWOHUQZJuT/V+ls71
 N+skpuebsGKqLi0+aAs1a4WNG47zKDvjr1kLsYM1VCwRewB3UC6LujDZbu7uVYgMKvnv
 9BW6FHL4TjDVaLbCYnEFZcnuy+fpJcuyEK1mllL+VRkU+XTnV5OI+bBDcCm0Rbcwdo/8
 J3joz0ZmbTUecW6oAa5danjyKKMFsm9fOX0pPvJnJkPfyiiFRmx3HawRoOaIYzuxxU4F
 1zSAZ0vnriAUx007vYuCvrNv1/gE6ZMyTwZVtgwHCgDIiCQ64pWNlUnEk7JBFFkecQXp
 ia6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTg9XhXh1nZCylMQMmi7H45LkPFVCHu3RzZgQV1rixswCzf8LhISVIGtf25IqHwwWocdeWq0Onj7Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZUh4HETsD0cLp2E0szD+S6cVrkQwJpDnH9ZXqVgalUKhTjuxz
 jmuK4QxsKHrB6O+4Wuz2GDvGLz9NMohoLjLnQEKsQjiyvjkVdrK0m4AoOi7vwklBME+wf4mF0Zr
 qu0svZAUMbMAflxgt9qaIp7AcKRN/w1qmy6MWFg==
X-Google-Smtp-Source: AGHT+IG6cX2wf0btAXPAAKNWp9X+HWlDbdwmWyBjB7hXl2DJFXF4XbNv617o/puLRUgalkZOG9h9QJAkPDP/9SnuOAI=
X-Received: by 2002:a05:690c:d8e:b0:6ea:34b1:62e3 with SMTP id
 00721157ae682-6ea34b1660cmr28135337b3.7.1730233511044; Tue, 29 Oct 2024
 13:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
 <20241028-msm-dp-rename-v1-2-a2564e9457b0@linaro.org>
 <3d142f8c-f7b1-45dc-9a4b-d0b16843a8ba@quicinc.com>
In-Reply-To: <3d142f8c-f7b1-45dc-9a4b-d0b16843a8ba@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:25:01 +0200
Message-ID: <CAA8EJpqXE4U4nH8yjtYEryJ4ZOmnDxo--+eUm2_AvDymufjVjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: rename edp_ bridge functions and struct
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 29 Oct 2024 at 20:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/28/2024 4:49 AM, Dmitry Baryshkov wrote:
> > Follow the estalished prefix and rename eDP bridge symbols to use
> > msm_dp_ prefix, moving the edp to the end of the symbol name.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
> >   1 file changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index 6a0840266c0f..ff9ce9b15234 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
> >       .debugfs_init = msm_dp_bridge_debugfs_init,
> >   };
> >
> > -static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> > +static int msm_dp_bridge_atomic_check_edp(struct drm_bridge *drm_bridge,
> >                                  struct drm_bridge_state *bridge_state,
> >                                  struct drm_crtc_state *crtc_state,
> >                                  struct drm_connector_state *conn_state)
>
> msm_dp_bridge_atomic_check_edp looks a bit odd.
>
> What about just msm_edp_bridge_atomic_check?
>
> Likewise for other edp names.

Yeah, I was torn between these two options. I'll switch to the second one.

-- 
With best wishes
Dmitry
