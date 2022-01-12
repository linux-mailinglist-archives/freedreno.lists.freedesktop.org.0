Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DB648CD13
	for <lists+freedreno@lfdr.de>; Wed, 12 Jan 2022 21:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0097810EA9A;
	Wed, 12 Jan 2022 20:25:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5CD10EA9A
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jan 2022 20:25:54 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id g2so4700137qkp.1
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jan 2022 12:25:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=++VmqJoKax3ah7uSRFDwxgC8kbP9borlfauTWBBQHLc=;
 b=T9YBr2GYkIcXw8ezHIDXdUe1PZNscTas508LpgO+U26/P69zZ7dsEY/l7jnDnCiPGq
 rf4zz4tXlrFhvV/eOpk1ckt/yXV4e9jwm1ucw4vwdJ/ggS0xfTnNUhtvEQTsxXsUL+hc
 7NjkLHo2v16l54M+nN4j8uapsMJWY0sK7wQ4comTSpFbaUQs+1Q0HCKLozOFoseSJUy0
 2DPUS9Z9yxsNQH6OG2V9g8tdxq1XM+0/+OuZ5CgdbJdgV+3pYGcokBmfVVIp8QuZyHYm
 X4U5L0W5+o9fFR03wttWrol4i8BFDMnU8kWWBr5CsSZWEJPjyvn1wTC5f8v9NuXda9iF
 bpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=++VmqJoKax3ah7uSRFDwxgC8kbP9borlfauTWBBQHLc=;
 b=Oug05Na4NvSlqzTRqauZpSM48RvzSQARmJHDx4PwbB71UtC9bvZCwL3F3F5Li1ntj8
 oQeKZp+iZ+I7yxx8r82DkSuPF3YlPAAo5fQWgchmFOmJYTCPMNkPc2PBIdXBeW64URdM
 htjwGFa0fhLggOVEKRV0NYWYcQyVPYeWDhvkib2Tt0VCWYwTdt4bFfmiCC2DK6UnSvS8
 An14Shx1W9n9auyW2TiAOL/ct8ymukwTx+IV9T3GJ7z/stgi/KLDedawcB7mTy+yWOe3
 BdUGZGI1JoHzHSWrEzFCwfpu2CY03fe+KKEahFxCt5Wp1hArjKBuxx3yaeSDndI5/Abq
 cH2w==
X-Gm-Message-State: AOAM532IyzArR/IonUIKsbxdhYN1gGStHuKXdEWEz2zc6ld8Z3B2XkSY
 LHINuVOcyobyxE5XGZxpN+UOeeVarAnFj1ZYzwJ7Xg==
X-Google-Smtp-Source: ABdhPJxQTSpc2C6HduDZ9nWxF/my5DE7AaW6bDo7ALFrCgkZ2bGOk1F3k0cZ6JdrZEE9iM+Gcs/o5Mkfe+hJDADWiag=
X-Received: by 2002:a05:620a:c52:: with SMTP id
 u18mr1131562qki.203.1642019153033; 
 Wed, 12 Jan 2022 12:25:53 -0800 (PST)
MIME-Version: 1.0
References: <20220107020132.587811-1-dmitry.baryshkov@linaro.org>
 <20220107020132.587811-2-dmitry.baryshkov@linaro.org>
 <383271c1-d815-e26c-02f1-2a8d722166d3@quicinc.com>
In-Reply-To: <383271c1-d815-e26c-02f1-2a8d722166d3@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 12 Jan 2022 23:25:42 +0300
Message-ID: <CAA8EJpqdRUAjjyzyxOaDDA1PC9HF=wpfwhgK3jao4hyP8H2vBw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 1/7] drm/msm/dp: fix panel bridge
 attachment
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 12 Jan 2022 at 20:41, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/6/2022 6:01 PM, Dmitry Baryshkov wrote:
> > In commit 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display
> > enable and disable") the DP driver received a drm_bridge instance, which
> > is always attached to the encoder as a root bridge. However it conflicts
> > with the panel_bridge support for eDP panels. Change panel_bridge
> > attachment to come after dp_bridge attachment.
> >
> > Fixes: 8a3b4c17f863 ("drm/msm/dp: employ bridge mechanism for display enable and disable")
> > Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_drm.c | 21 +++++++++++----------
> >   1 file changed, 11 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index d4d360d19eba..26ef41a4c1b6 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -169,16 +169,6 @@ struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
> >
> >       drm_connector_attach_encoder(connector, dp_display->encoder);
> >
> > -     if (dp_display->panel_bridge) {
> > -             ret = drm_bridge_attach(dp_display->encoder,
> > -                                     dp_display->panel_bridge, NULL,
> > -                                     DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > -             if (ret < 0) {
> > -                     DRM_ERROR("failed to attach panel bridge: %d\n", ret);
> > -                     return ERR_PTR(ret);
> > -             }
> > -     }
> > -
> >       return connector;
> >   }
> >
> > @@ -246,5 +236,16 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
> >               return ERR_PTR(rc);
> >       }
> >
>
> can check connector_type here and if connector_type ==
> DRM_MODE_CONNECTOR_eDP then no drm_bridge  add to eDP?  So that eDP only
> has panel_bridge and DP only has drm_bridge?

No, we still need the DP bridge for the eDP. It handles modesetting,
enabling and disabling of the DP controller, etc.

>
> is this fix all your concerns?
>
>
> > +     if (dp_display->panel_bridge) {
> > +             rc = drm_bridge_attach(dp_display->encoder,
> > +                                     dp_display->panel_bridge, bridge,
> > +                                     DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> > +             if (rc < 0) {
> > +                     DRM_ERROR("failed to attach panel bridge: %d\n", rc);
> > +                     drm_bridge_remove(bridge);
> > +                     return ERR_PTR(rc);
> > +             }
> > +     }
> > +
> >       return bridge;
> >   }



-- 
With best wishes
Dmitry
