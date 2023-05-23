Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA8070E70E
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 23:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EF110E4DF;
	Tue, 23 May 2023 21:02:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E8110E4DC
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 21:02:36 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5621a279cbbso5291657b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 14:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684875755; x=1687467755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4gNfZIeekSHs7BohS2Orfq0Se0pBECTdaana4cYqBL4=;
 b=tOGPzOTXR3ZwhBy1Ic0ihRryuxQqnniw6YqV0SHZ2xEJbKbV79oNg8iSaUODmLcYpc
 OODVehM/ARBOOUXdzyj94ie3ObrYp2+yDybUY6odfIvlc3vWw4Uu42VIjwf40Qj8jnpv
 /u6BIYptfcGey8tl64SMGH2ekP+e49xLeKTW8DQrLw1PiekWMDf+SVtkboNYCRCGAok6
 r3NGmKXQI7IcDYSXwmcTXA1k8cCjELTw9o7nX5Wa7vfMZ2Cbd4X+B/kwzKnE15M8S45G
 buaYCqxYBK9bQTQOog//pv15RiylJCcZ2FOpBp2rmOQy5OInQOLIQu3TNA64CyDbqbSd
 lTWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684875755; x=1687467755;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4gNfZIeekSHs7BohS2Orfq0Se0pBECTdaana4cYqBL4=;
 b=fPdQ3HEQA1ntevOHnugkWkTe9ys5B0jkgqRrlZL5pgEYIUfatCt9pmYP65Y0ZFJsxv
 Q+KV9UsGTTFCrcAj4R2ci9/xv9dIptcM0E3dUHOSd5EFeVTTDWldFAgxkzdsZpehcAcg
 LIAazp22h4E39aKTYsnL80RbKHpDf/UMxbunLLdJb1DfQaSvqNJoxGN6ZWc/z7q31NC0
 QoKQGjHSZRpS6QcW5IyxeoHMAm32I8nZt1WkOtJCEjnj3SiOfVtwKaIqfM570Fic1+nO
 qppMF611BQ70G8rLs8YQM1DrYdpgV3lyNoDfjrc3e1IPJUOlmwrXcFzizifnWpjQ/tGf
 iZkg==
X-Gm-Message-State: AC+VfDzrOXisWKFZCVQtze7Fo1A0rNIE1ppIXkLuRyZqjbhzJYr+Q4mP
 Hn0WFwa5hIrtuUUzfrWOFyCd7UBgoEX/fKBCFFcbSw==
X-Google-Smtp-Source: ACHHUZ7UXQzwb1RIpn2+dG8waBFp9bePM9jRJQJFoANyzIIkMfYS8DmloLszmqODJrAwBGg2Stn1tqrkrSUfUH7FmaQ=
X-Received: by 2002:a81:1bc8:0:b0:55a:776e:95f3 with SMTP id
 b191-20020a811bc8000000b0055a776e95f3mr15671135ywb.25.1684875754960; Tue, 23
 May 2023 14:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <1684870754-24906-1-git-send-email-quic_khsieh@quicinc.com>
 <1684870754-24906-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1684870754-24906-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 May 2023 00:02:23 +0300
Message-ID: <CAA8EJpq0Gh5Wu5S_9aMytghOer_zPKthCZq9-vf7+vHm+sYH5Q@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/2] drm/msm/dp: no need to disable irq
 after devm_request_irq()
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
 leonard@lausen.nl, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, linux-kernel@vger.kernel.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, daniel@ffwll.ch, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 22:39, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> devm_request_irq() will allocate irq and return with irq enabled.
> At current implementation irq are specified disabled after return from
> devm_request_irq() and re enabled later. It is redundant.

This is not correct. The disable_irq / enable_irq pair is not
redundant. If I understand correctly, it was done so to prevent HPD
IRQs from being delivered before HPD worker is initialized (which was
probably correct at the time of the mentioned commit). So this patch
either can come after the next patch (but then it should not have a
Fixes tag and the commit message should be changed to mention why
disable_irq() call is redundant) or it can be squashed together with
the next patch.

>
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 9 ---------
>  1 file changed, 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3e13acdf..1af49b6 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1094,12 +1094,6 @@ static void dp_display_config_hpd(struct dp_display_private *dp)
>                                 DP_DP_HPD_PLUG_INT_MASK |
>                                 DP_DP_HPD_UNPLUG_INT_MASK,
>                                 true);
> -
> -       /* Enable interrupt first time
> -        * we are leaving dp clocks on during disconnect
> -        * and never disable interrupt
> -        */
> -       enable_irq(dp->irq);
>  }
>
>  void dp_display_set_psr(struct msm_dp *dp_display, bool enter)
> @@ -1282,7 +1276,6 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>                                 dp->irq, rc);
>                 return rc;
>         }
> -       disable_irq(dp->irq);
>
>         return 0;
>  }
> @@ -1570,7 +1563,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>                 dp_display_host_init(dp_priv);
>                 dp_catalog_ctrl_hpd_config(dp_priv->catalog);
>                 dp_display_host_phy_init(dp_priv);
> -               enable_irq(dp_priv->irq);
>
>                 /*
>                  * The code below assumes that the panel will finish probing
> @@ -1612,7 +1604,6 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>
>  error:
>         if (dp->is_edp) {
> -               disable_irq(dp_priv->irq);
>                 dp_display_host_phy_exit(dp_priv);
>                 dp_display_host_deinit(dp_priv);
>         }
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
