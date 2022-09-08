Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430C5B11E7
	for <lists+freedreno@lfdr.de>; Thu,  8 Sep 2022 03:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8662A10E3F5;
	Thu,  8 Sep 2022 01:12:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EC8C10E3F5
 for <freedreno@lists.freedesktop.org>; Thu,  8 Sep 2022 01:12:03 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11eab59db71so40346585fac.11
 for <freedreno@lists.freedesktop.org>; Wed, 07 Sep 2022 18:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=1js7I6nlwi6Zvadq3CzcSF0uX26bi/o6AZUelowSl0M=;
 b=MRBMmjcL+aqwmxRFxgH0QEUQOaA01tzNpQB48lgeC7lMvrt8ahLsEkcfG2wSpOq54o
 +baHokBIau9ogjAtyqS91fYfr6zp3b0rqGqwBjvff6WWB1Q+CoOpZqIn10AvrnPn++h+
 L0osBExe8JvrD2Y6FNuJqm6DDSkTCjKNUEEcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=1js7I6nlwi6Zvadq3CzcSF0uX26bi/o6AZUelowSl0M=;
 b=fvq3sUCrbB27rcDDkSuQ0ebUCKUOeqNsVP2loDa/LcrjyJx78KFvc/sqxD6od4IhIu
 liINli2AWWl3QdaQ+Vts1qEX9BMfrE2HoH2ou5Pr8FbKQ5agZ0HouY/XZwgeK3vVZNns
 KrpC2YjlABWH4fjAWc9j18RkuvRQpmRrwZYOgbAb5mp7Q1xo5/yhQgWtYPZVG3LiY1pw
 JWEzCvaimuw2j/A/02NdvpnSZkLVLGbHVaO/72sQeuzFFcrP50Exn7WkaVNK04aOphds
 5UsD3SCGvW78/SOB2m/y8Mt6QPvMxFYVAv1AYNTlZSYac65sUHLp9S1q99mhVdrriVjT
 CduQ==
X-Gm-Message-State: ACgBeo1bZ3lsxABEp4pKqjgC+jhh01L09/7xy0a6zWYG92Tk4vY/eCoq
 cIuOqZGWoR/bdlkUuN9nq/YBqkJhXCfn/nbFdUp0ag==
X-Google-Smtp-Source: AA6agR7qYgCdOajf2PHfQqRMNp2SZo5EZzSeiNJKWkZ/dY5rl0FXvOIRHPh+4ck/JOInFa4jRMZ7GOllh+S6IH0IYUE=
X-Received: by 2002:a05:6871:6a1:b0:127:3a21:7e00 with SMTP id
 l33-20020a05687106a100b001273a217e00mr648929oao.44.1662599522744; Wed, 07 Sep
 2022 18:12:02 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 20:12:02 -0500
MIME-Version: 1.0
In-Reply-To: <1661830389-22439-4-git-send-email-quic_abhinavk@quicinc.com>
References: <1661830389-22439-1-git-send-email-quic_abhinavk@quicinc.com>
 <1661830389-22439-4-git-send-email-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 7 Sep 2022 20:12:02 -0500
Message-ID: <CAE-0n52YbUaVEyqqBsVWAEHS8kTH8YL=S-H30xgyBzMFizxYkw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH 3/3] drm/msm: filter out modes for
 DP/eDP bridge having unsupported clock
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
Cc: dianders@chromium.org, dri-devel@lists.freedesktop.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2022-08-29 20:33:09)
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index bfd0aeff3f0d..8b91d8adf921 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -117,6 +117,7 @@ struct dp_display_private {
>
>         bool wide_bus_en;
>
> +       int max_ext_pclk;

Same signed comment as before.

>         struct dp_audio *audio;
>  };
>
> @@ -986,8 +987,15 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>         if (dp->is_edp)
>                 return MODE_OK;
>
> -       if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
> -               return MODE_CLOCK_HIGH;
> +       /*
> +        * If DP/eDP supports HPD natively or through a bridge, need to make
> +        * sure that we filter out the modes with pixel clock higher than the
> +        * chipset capabilities
> +        */
> +       if ((bridge->ops & DRM_BRIDGE_OP_HPD) ||
> +                       (dp->next_bridge && (dp->next_bridge->ops & DRM_BRIDGE_OP_HPD)))

Doesn't drm_bridge_chain_mode_valid() already run the mode_valid bridge
function for all bridges in the chain? I don't understand why we need to
peek at the bridge or the next bridge and only filter in that case. Why
can't we always filter modes here? Do we want to allow higher pixel clks
than the chip supports?

> +               if (mode->clock > dp_display->max_ext_pclk)
> +                       return MODE_CLOCK_HIGH;
>
