Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C480D797DF9
	for <lists+freedreno@lfdr.de>; Thu,  7 Sep 2023 23:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C61110E3D7;
	Thu,  7 Sep 2023 21:34:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3989510E26A
 for <freedreno@lists.freedesktop.org>; Thu,  7 Sep 2023 21:34:16 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50078e52537so2386001e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 07 Sep 2023 14:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1694122454; x=1694727254;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=xc2O2hD0csi9QFFnQdhQ/KpvPCmGek+8TiHksrVnjcg=;
 b=YokYx3xnN9MUkdVl8dnUsUZqm4LrukPKEfNQMqTDBzgYVwCQ0dG+d5yxqX2NQBRib+
 oZy/3jrVDdelY3ySdUBXD7NyzIQhvRlPhkawSz8Pr6nLKYkSRyojP9dqTKsFk8bS95RA
 fjV+9GSz80kEZj7IGY3/U3BZUhJeISgJSxS2A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694122454; x=1694727254;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xc2O2hD0csi9QFFnQdhQ/KpvPCmGek+8TiHksrVnjcg=;
 b=bB0WLbI1xXtIKLe67eotaTbsfqSJP9y8+tDl4GZJ28fFLC4SdR6hUqgwjAgHxwH2Na
 r1Lncvm2dk3EKvalRwrpIEPu4FGWiGcPcNPlCwBq84e3dUIWPIYLNLP1R5wggWmab1im
 RL+/x9PYYhdpI79c35y4qQhao9Mbjw6mERVYUIKgVXCaOMkDccLEqoQ5y93VV9OoF7cb
 r7C1X/GenYD2NOMbfgsqqM3KSXs9VD5wpxc8wMvxZbh8pIKLfB2vT0zK5lwsuRQVdDbe
 2ZVEpIcc7L/0Qto6ioMoZ2tEgL91Vg7XiVIJozwgx2O/lrcvkukGNSWdJCZ5eBXokCLv
 4bPg==
X-Gm-Message-State: AOJu0YxaCIf8hb3ZEeqm2tMUUJOpTQaztEf4D+LSFQGapR30xR5rnjcY
 wZKoqHs69oLd0cfeVrVIc5w4wwUME1dgV/TcXdrWfw==
X-Google-Smtp-Source: AGHT+IHFSLJRBNk28/pXHA3uV4ZreNC2omLjMVD44CUHGiQJ/6WY/p0NrEsWtw8OkStcCfwFeG5y/zxva1dptUDeGkU=
X-Received: by 2002:a19:7706:0:b0:4f9:7aee:8dc5 with SMTP id
 s6-20020a197706000000b004f97aee8dc5mr384540lfc.19.1694122454365; Thu, 07 Sep
 2023 14:34:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Sep 2023 14:34:13 -0700
MIME-Version: 1.0
In-Reply-To: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
References: <20230903222432.2894093-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Sep 2023 14:34:13 -0700
Message-ID: <CAE-0n53c2kGcR-OWsTn4s2wuLQ+j7WTA9Ho9CEG=cGNEFT-3iA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: support setting the DP
 subconnector type
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2023-09-03 15:24:32)
> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index 97ba41593820..1cb54f26f5aa 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -162,6 +162,11 @@ int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
>                 }
>         }
>
> +       rc = drm_dp_read_downstream_info(panel->aux, dp_panel->dpcd,
> +                                        dp_panel->downstream_ports);
> +       if (rc)
> +               return rc;

I haven't been able to test it yet, but I think with an apple dongle
we'll never populate the 'downstream_ports' member if the HDMI cable is
not connected when this runs. That's because this function bails out
early before trying to read the downstream ports when there isn't a
sink. Perhaps we need to read it again when an hpd_irq comes in, or we
need to read it before bailing out from here?
