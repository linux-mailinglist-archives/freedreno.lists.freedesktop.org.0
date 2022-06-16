Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4EE54EA85
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 22:07:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DFC10E25D;
	Thu, 16 Jun 2022 20:07:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44C5E10E2A2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 20:07:39 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id v4so3130416oiv.1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 13:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=s6YjNqeFkBeitJEod+ywoglNF76LvxWXetZQio3hBl0=;
 b=NTaM09TANSQ9YjApBo2joU0KGvGfREh02jr9HfmBLye/nzoowGhLj1X/iQkqjlvc6W
 VuuHlG1lvdT5J1EdLIYD37uTEbPK5nsoc2SWQvuLrHU5gfzSH6o/adshSSIN7UzkjUyx
 1mT6ppunDhl3A5Vjkg/i3GHnqfSEZkb6yeJEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=s6YjNqeFkBeitJEod+ywoglNF76LvxWXetZQio3hBl0=;
 b=n2NGl31WCh/pIgEGMhLNIRYdROWDqYjqiN7TC+aOPngIZZrB3tLc8uH1Dd4GNdpeDB
 vNKr4ftgFzq4gENINcLWwvMNlRQEMBVQZZRB3ZZtlwbf595l9CEyWJg9YlkgGjXpjsVp
 iomXwcwrgmCK6EvXlmH7zvKawtmSVutp6fRwYlzm6IZy76xDAjO4tB5A3CelRCYKZYNI
 DNjCBBh+vWeLLwSdY1w/7bApuyo8joouxL5WzC8B6dW9QDuk74bWmOIiEEm/mZepIOlT
 cPuoCOQG873VTPABXObcpYxOu6VE5XcJN2dNy8GIhPAW+8gU1f8lwlZQy1mPXluZgNzO
 jswQ==
X-Gm-Message-State: AJIora+huo5icU1/w8XPyUzYAIkYNPYcbVGr3zE8CcohXEqYOLbyo4x9
 lRr3X3tx5ODIY+m+i12z+07gnpwhr6D4yNJZFinUxA==
X-Google-Smtp-Source: AGRyM1vE/OzRxo9t3OzpbmbBYVrPabfJBVXad89oOXTWAGuEN5A0P8WKfJlZlPkQDZQqBd6CO7j07+NCgeWUyhjdZR0=
X-Received: by 2002:a05:6808:1703:b0:32e:851e:7f81 with SMTP id
 bc3-20020a056808170300b0032e851e7f81mr3494471oib.63.1655410058546; Thu, 16
 Jun 2022 13:07:38 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jun 2022 13:07:38 -0700
MIME-Version: 1.0
In-Reply-To: <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>
References: <1655399361-10842-1-git-send-email-quic_khsieh@quicinc.com>
 <1655399361-10842-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 16 Jun 2022 13:07:38 -0700
Message-ID: <CAE-0n50cteV=uYRR=7LmcUB00kjHwDRoutq+sz5FoGmZqLso4Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 2/2] drm/msm/dp: clean up pixel_rate from
 dp_ctrl.c
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-06-16 10:09:21)
> dp_ctrl keep an local cache of pixel_rate which increase confusing
> in regrading how pixel_rate being used. This patch refer pixel_rate
> directly from dp_panel to eliminate unnecessary pixel_rate variable
> from struct dp_ctrl.
>
> Changes in v8:
> -- add this patch to remove pixel_rate from dp_ctrl
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

I can send a proper patch for this myself later.

> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 158 +++++++++++++++++++--------------------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h |   2 -
>  2 files changed, 79 insertions(+), 81 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 01028b5..6fddddd 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1528,36 +1526,6 @@ static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
>         return ret;
>  }
>
> -static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
> -{
> -       int ret = 0;
> -
> -       if (!ctrl->link->phy_params.phy_test_pattern_sel) {
> -               drm_dbg_dp(ctrl->drm_dev,
> -                       "no test pattern selected by sink\n");
> -               return ret;
> -       }
> -
> -       /*
> -        * The global reset will need DP link related clocks to be
> -        * running. Add the global reset just before disabling the
> -        * link clocks and core clocks.
> -        */
> -       ret = dp_ctrl_off(&ctrl->dp_ctrl);
> -       if (ret) {
> -               DRM_ERROR("failed to disable DP controller\n");
> -               return ret;
> -       }
> -
> -       ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> -       if (!ret)
> -               ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
> -       else
> -               DRM_ERROR("failed to enable DP link controller\n");
> -
> -       return ret;
> -}
> -
>  static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>  {
>         bool success = false;
> @@ -1610,6 +1578,56 @@ static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
>         return success;
>  }
>
> +int dp_ctrl_on_stream_phy_test_report(struct dp_ctrl *dp_ctrl)
> +{
> +       int ret = 0;
> +       struct dp_ctrl_private *ctrl;
> +       unsigned long pixel_rate;
> +
> +       ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
> +
> +       pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
> +       ret = dp_ctrl_enable_stream_clocks(ctrl, pixel_rate);
> +       if (ret) {
> +               DRM_ERROR("Failed to start pixel clocks. ret=%d\n", ret);
> +               return ret;
> +       }
> +
> +       dp_ctrl_send_phy_test_pattern(ctrl);
> +
> +       return 0;
> +}
> +
> +static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
> +{
> +       int ret = 0;
> +
> +       if (!ctrl->link->phy_params.phy_test_pattern_sel) {
> +               drm_dbg_dp(ctrl->drm_dev,
> +                       "no test pattern selected by sink\n");
> +               return ret;
> +       }
> +
> +       /*
> +        * The global reset will need DP link related clocks to be
> +        * running. Add the global reset just before disabling the
> +        * link clocks and core clocks.
> +        */
> +       ret = dp_ctrl_off(&ctrl->dp_ctrl);
> +       if (ret) {
> +               DRM_ERROR("failed to disable DP controller\n");
> +               return ret;
> +       }
> +
> +       ret = dp_ctrl_on_link(&ctrl->dp_ctrl);
> +       if (!ret)
> +               ret = dp_ctrl_on_stream_phy_test_report(&ctrl->dp_ctrl);
> +       else
> +               DRM_ERROR("failed to enable DP link controller\n");
> +
> +       return ret;
> +}
> +
>  void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>  {
>         struct dp_ctrl_private *ctrl;

I'd prefer these hunks to be part of a different patch. Either squashed
into the previous patch, or after the previous patch to show that a
forward declaration isn't necessary, but helped minimize the diff of
that patch.

> @@ -1685,6 +1703,7 @@ int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>         u32 const phy_cts_pixel_clk_khz = 148500;
>         u8 link_status[DP_LINK_STATUS_SIZE];
>         unsigned int training_step;
> +       unsigned long pixel_rate;
>
>         if (!dp_ctrl)
>                 return -EINVAL;
