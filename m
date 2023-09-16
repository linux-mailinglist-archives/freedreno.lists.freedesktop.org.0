Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6702B7A2C9B
	for <lists+freedreno@lfdr.de>; Sat, 16 Sep 2023 02:42:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3B210E00B;
	Sat, 16 Sep 2023 00:42:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7954210E099
 for <freedreno@lists.freedesktop.org>; Sat, 16 Sep 2023 00:41:58 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-76ef8b91a4bso173728885a.2
 for <freedreno@lists.freedesktop.org>; Fri, 15 Sep 2023 17:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694824917; x=1695429717; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+UPUIgbgZmSTHC431gPSH3MLS9277uNHFZc/nQdeHJ0=;
 b=i718tY4gLIdenZMRybAKCEQIN9taQXBzUHh7L2Q3rrNETTw6h1MhdNNDoVb/Vay6cG
 WAqW3k5XGZD0rp9YP8lUNMAlNO2vH+4FjPNoDUNN9/FrKolmGAukGI6ezExE0JVdoZ5F
 w8SS/cEAS1EFuVbr61om30qUQIchK8trTBtj8tRt7v6WmVVNKJfoBBfnUXJlZ6zezJaT
 k2oKe2H6LS+OBhCIEB8fHdENIZLQXC2MR7/MVtTsfplZM3eYUREpl3S+flqJ9M6RzryW
 HchsLietIlP03VqF3wgDXNmKHB7ngqKts2xhdbVHWXq40GcewwhspnLV3ZrDL5sgE3Jr
 jPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694824917; x=1695429717;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+UPUIgbgZmSTHC431gPSH3MLS9277uNHFZc/nQdeHJ0=;
 b=GJBnaoTT53c97SfzFf/veZXgZBr8nfA2VivL4sNSqPJJh5BBifVuig8Vf7TyNgxBCs
 QaQ9h1d1kJaI7vr4NJXfU2BqA1AIv1SLccmAIdte+b56DTpqFpFV8nxTHh0N28ZAVjKe
 Pg6f9lM6jhCvVVSHsAiRLTjFYQVKahYMkBGBw+X6gpUN45tcDsTYMMZN3bt8p+QR62ub
 bxivIOLxRlvAYfE1ElfGvpPIsawdIgQglbd7DrFad4QBoDzgx7t2hYBlmtx7kCU3e1Fq
 yFuVg3ZmfGvyjBGPBAhm9SoBWvDqDxpdd5VAILGPy4vD5dyKH/QzgPUmYOi34ZEGT+eP
 bHyA==
X-Gm-Message-State: AOJu0YzPgN6D9DZ+A8Ebt84pOHweUvBsiz+qYLCpXnkCfqkwkdRu9qlc
 Kevcp184L4cSr5rRkPxxETcY0BUeaSQuDdrQEtcAVA==
X-Google-Smtp-Source: AGHT+IFct/9WnLc6rXu5KxRB4OXuXrpbd7b28NNSjfm+Rf+bcVJPjE7rZEfbDB+LKjwSbqtiKRR8XcDWna50TruCOlU=
X-Received: by 2002:a05:620a:2944:b0:76e:f0f6:d5b with SMTP id
 n4-20020a05620a294400b0076ef0f60d5bmr3563294qkp.54.1694824917500; Fri, 15 Sep
 2023 17:41:57 -0700 (PDT)
MIME-Version: 1.0
References: <1694813901-26952-1-git-send-email-quic_khsieh@quicinc.com>
 <1694813901-26952-4-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1694813901-26952-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 16 Sep 2023 03:41:46 +0300
Message-ID: <CAA8EJprG8HuhDHV9k5_4+vkejnYmwmg61isZXT7EsBCbGP0pJA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/7] drm/msm/dp: use
 drm_bridge_hpd_notify() to report HPD status changes
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 16 Sept 2023 at 00:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Currently DP driver use drm_helper_hpd_irq_event(), bypassing drm bridge
> framework, to report HPD status changes to user space frame work.
> Replace it with drm_bridge_hpd_notify() since DP driver is part of drm
> bridge.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also see the comment below.

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 18d16c7..59f9d85 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -356,26 +356,10 @@ static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
>                 (dp->link->sink_count == 0);
>  }
>
> -static void dp_display_send_hpd_event(struct msm_dp *dp_display)
> -{
> -       struct dp_display_private *dp;
> -       struct drm_connector *connector;
> -
> -       dp = container_of(dp_display, struct dp_display_private, dp_display);
> -
> -       connector = dp->dp_display.connector;
> -       drm_helper_hpd_irq_event(connector->dev);
> -}
> -
>  static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>                                             bool hpd)
>  {
> -       if ((hpd && dp->dp_display.link_ready) ||
> -                       (!hpd && !dp->dp_display.link_ready)) {
> -               drm_dbg_dp(dp->drm_dev, "HPD already %s\n",
> -                               (hpd ? "on" : "off"));
> -               return 0;
> -       }
> +       struct drm_bridge *bridge = dp->dp_display.bridge;
>
>         /* reset video pattern flag on disconnect */
>         if (!hpd)

Note, this part (resetting the video_test and setting of is_connected)
should be moved to the dp_bridge_hpd_notify() too. Please ignore this
comment if this is handled later in the series.

> @@ -385,7 +369,7 @@ static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>
>         drm_dbg_dp(dp->drm_dev, "type=%d hpd=%d\n",
>                         dp->dp_display.connector_type, hpd);
> -       dp_display_send_hpd_event(&dp->dp_display);
> +       drm_bridge_hpd_notify(bridge, dp->dp_display.link_ready);
>
>         return 0;
>  }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
