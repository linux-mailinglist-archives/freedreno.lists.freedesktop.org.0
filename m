Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3A45B111E
	for <lists+freedreno@lfdr.de>; Thu,  8 Sep 2022 02:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E6BB10E3A0;
	Thu,  8 Sep 2022 00:29:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A41810E3E7
 for <freedreno@lists.freedesktop.org>; Thu,  8 Sep 2022 00:29:27 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-127dca21a7dso12949976fac.12
 for <freedreno@lists.freedesktop.org>; Wed, 07 Sep 2022 17:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date;
 bh=ozHfaly1J/Vj3NpHL8RULu2aTSSdx3cJPa3wiZPcUlw=;
 b=lw3IWH3zeCUY+ZirNKCzUEH+Z2dV06zJUWskDo0vk9ET2/PbDMJf/UI8cF4gt79MbA
 F2I/MRQSAjQVcOX+nukTBuy9RuWn64a4khUoRx2eQEF0PqOpsTdYg4YzXQcv/G+tjtLR
 8Q9rRb6pgl/doFyiPb/K4yafWUP/yF2SUHZ4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ozHfaly1J/Vj3NpHL8RULu2aTSSdx3cJPa3wiZPcUlw=;
 b=T7A15JCqIPHL/oujRT2pdut2AT8E2Nmx7ZCxzrKnq1x99fSS6cLnRtWWpAjQLSjSk+
 /TlNnzvpqsawBi16on+L/aQ2Yi4aWXW/IvpSt/g6za/nddA5xj9WgMHVnQBbrGSdItJT
 35q4KMB5fcUvRB/4IQ5kQrBU6duOPhamEkBD79BtO3yKu5jk/zu/c3N28wYjx1G59wO/
 GZ1lwmq7UtT4kW+yToGly+JHb2Yc6XgfUUcUxhc7tU9vGEYqex/hpLjsaRkAzLMqnEL9
 w7N+evHJ91D7GyKw9PXJ5BvAaMcLgd6cN9rrCzsfQGyEwJ5S0JE5jhtSq6kncftce1as
 MNnQ==
X-Gm-Message-State: ACgBeo09Huq4YGGty8iyapPakcO5c1MVk6TXxmFmfh0hrzVdJpAzPTXp
 9rt596L2sV/Fv+60HAnNjsPX8vNHAHKfUSOH9FAsVA==
X-Google-Smtp-Source: AA6agR49zGgntBFStbKHjweMvZ2AslFV8Et4HfRnp0kT8gW+7j/9O2dBm9cdrWlIDYLSeUJOBpgrG8JhSoMrfVpbtI8=
X-Received: by 2002:a05:6870:e748:b0:127:dcb9:c59a with SMTP id
 t8-20020a056870e74800b00127dcb9c59amr537055oak.0.1662596966584; Wed, 07 Sep
 2022 17:29:26 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 7 Sep 2022 19:29:25 -0500
MIME-Version: 1.0
In-Reply-To: <1662580237-5684-1-git-send-email-quic_khsieh@quicinc.com>
References: <1662580237-5684-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 7 Sep 2022 19:29:25 -0500
Message-ID: <CAE-0n53ty_FPH4pyTrQkUb_RcDXQttvk8CZL0Skh+M6PZunFZg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL
 register before start link training
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
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-09-07 12:50:37)
> DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
> upstream device disconnect. This patch will enforce this rule by always
> cleared DOWNPREAD_CTRL register to 0 before start link training. At rare

DOWNSPREAD_CTRL

> case that DP MSA timing parameters may be mis-interpreted by the sink
> which causes audio sampling rate be calculated wrongly and cause audio
> did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.
> This patch also make sure bring sink out of D3 power-down mode into D0
> (normal operation mode) successfully by retrying 3 times.

Split it into two patches? Is 3 times determined by experiment or
purely random?

>
> Changes in v2:
> 1) fix spelling at commit text
> 2) merge ssc variable into encoding[0]
>
> Fixes: 154b5a7da0fd ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 13 +++++--------
>  drivers/gpu/drm/msm/dp/dp_link.c | 17 +++++++++++------
>  2 files changed, 16 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index ab6aa13..1b63220 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1245,8 +1245,7 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>  {
>         int ret = 0;
>         const u8 *dpcd = ctrl->panel->dpcd;
> -       u8 encoding = DP_SET_ANSI_8B10B;
> -       u8 ssc;
> +       u8 encoding[2] = {0, DP_SET_ANSI_8B10B};

Add space after { and before } please. Also, the 2 isn't necessary as
it's implied.

>         u8 assr;
>         struct dp_link_info link_info = {0};
>
> @@ -1258,13 +1257,11 @@ static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl,
>
>         dp_aux_link_configure(ctrl->aux, &link_info);
>
> -       if (drm_dp_max_downspread(dpcd)) {
> -               ssc = DP_SPREAD_AMP_0_5;
> -               drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, &ssc, 1);
> -       }
> +       if (drm_dp_max_downspread(dpcd))
> +               encoding[0] |= DP_SPREAD_AMP_0_5;
>
> -       drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
> -                               &encoding, 1);
> +       /* config DOWNSPREAD_CTRL and MAIN_LINK_CHANNEL_CODING_SET */
> +       drm_dp_dpcd_write(ctrl->aux, DP_DOWNSPREAD_CTRL, encoding, 2);

Please use ARRAY_SIZE(encoding) instead of '2' here.

>
>         if (drm_dp_alternate_scrambler_reset_cap(dpcd)) {
>                 assr = DP_ALTERNATE_SCRAMBLER_RESET_ENABLE;
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36f0af0..3ad3826 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -49,7 +49,7 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>                                         struct dp_link_info *link)
>  {
>         u8 value;
> -       int err;
> +       int i, err;
>
>         if (link->revision < 0x11)
>                 return 0;
> @@ -61,11 +61,16 @@ static int dp_aux_link_power_up(struct drm_dp_aux *aux,
>         value &= ~DP_SET_POWER_MASK;
>         value |= DP_SET_POWER_D0;
>
> -       err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
> -       if (err < 0)
> -               return err;
> -
> -       usleep_range(1000, 2000);
> +       /*
> +        * When turning on, we need to retry for 1ms to give the sink
> +        * time to wake up.
> +        */
> +       for (i = 0; i < 3; i++) {
> +               err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);

Can 'err' be ssize_t type? And also renamed to something like
'bytes_written' so that the if condition reads easier?

> +               usleep_range(1000, 2000);
> +               if (err == 1)
> +                       break;
> +       }
>
