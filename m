Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2074ECF5A
	for <lists+freedreno@lfdr.de>; Thu, 31 Mar 2022 00:08:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE6B10EB75;
	Wed, 30 Mar 2022 22:08:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1E110EB75
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 22:08:14 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id e22so18171558qvf.9
 for <freedreno@lists.freedesktop.org>; Wed, 30 Mar 2022 15:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SZiNG3ufWqPM1a0cTW4jnJgQNElQaGHtkTjo01VQU4I=;
 b=MrMWiYyQdINQwVp4gorVlwJbY2td0hmgU/oFNQE3AX6ulipZQWM3VZfF1PuxnzXbPQ
 s+7n6N9jfFqt9BMx/HsWKed8i1GMk7OS8V/tnboQJnOIRo98PT4ST5wx/yiA9oXvLcyI
 Iz/InO8LqH7YaQJ3Nn904oMAzpYKJbo+CslovCmLznn7W20dOdKBVyZCkTdns5VthPL2
 KTfl/1hI1DkypIk69BYPxS1340Yln2MMx2RB+1wh31OIIteFprSvjDcpvfVpOU864J8p
 RKc8Lx8DlFNrjnh+WIUi8WDsIOrld2ex9L7MzW2ytRTGHK9f9QwA7gKmh14MzcdNku44
 SmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SZiNG3ufWqPM1a0cTW4jnJgQNElQaGHtkTjo01VQU4I=;
 b=8N4fNjOpHqnZOyROrtl+xNHDYiHhs2Ed50PVYK3GnvikXhOn9R6y4MypID8Wvz63J+
 VjjuEC+3mODe2GwRt0zofggD/2FMQw7aaZp+JFN/8hIChT4OwN5AUSQIb3KyrL7owK77
 PgePj4IgNbXcXDiT58kO0q6uBocU59Vv08eiD/dcqV9vCo6x0rhOXqo9ieat0f4Hj39q
 /E3CMOgi7qkFEtKGkAdZLCekKquoph8aBJCJ8wkrCKQM2A4lz9TK/OjOoGJIG6l7dhEw
 GqRB2YT5TCSUkJCqgVmAnPtEIShlYExLmAmtyZ3BphVAWOCaDOwFaNPZczAUVw9+wdMz
 MCSQ==
X-Gm-Message-State: AOAM531tzSTNMMs+fMhj4P5alA8JOQzWVsnd6F4tapa+KX8u5upVAtfR
 M2kkUo+MXzEbbP5yY0TOhIDjPSYsXmp1iWGHY4Q3Aw==
X-Google-Smtp-Source: ABdhPJxCxZBIWsAez7ZkGk/I9bUyMuxaiqD6go4xQEddYN9/PXcWZpTyR5GqlMGXgxMx7oeLUil/KGE0zAAmBV88l9w=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr1255162qvv.115.1648678093929; Wed, 30
 Mar 2022 15:08:13 -0700 (PDT)
MIME-Version: 1.0
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1648656179-10347-9-git-send-email-quic_sbillaka@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 31 Mar 2022 01:08:02 +0300
Message-ID: <CAA8EJprvE31ex3fCQHZ-=x+EWHK4UZ0qqHRh+rH4dk5TPhmVyw@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 8/8] drm/msm/dp: Handle eDP mode_valid
 differently from dp
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 bjorn.andersson@linaro.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_vproddut@quicinc.com, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, sean@poorly.run, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_aravindh@quicinc.com,
 quic_khsieh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Mar 2022 at 19:04, Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> The panel-edp driver modes needs to be validated differently from DP
> because the link capabilities are not available for EDP by that time.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

This should not be necessary after
https://patchwork.freedesktop.org/patch/479261/?series=101682&rev=1.
Could you please check?

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 8bafdd0..f9c7d9a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1003,6 +1003,12 @@ enum drm_mode_status dp_bridge_mode_valid(struct drm_bridge *bridge,
>                 return -EINVAL;
>         }
>
> +       if (dp->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +               if (mode_pclk_khz > DP_MAX_PIXEL_CLK_KHZ)
> +                       return MODE_CLOCK_HIGH;
> +               return MODE_OK;
> +       }
> +
>         if ((dp->max_pclk_khz <= 0) ||
>                         (dp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
>                         (mode->clock > dp->max_pclk_khz))
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
