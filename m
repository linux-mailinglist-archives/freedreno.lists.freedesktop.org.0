Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06F830C84
	for <lists+freedreno@lfdr.de>; Wed, 17 Jan 2024 19:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B122710E790;
	Wed, 17 Jan 2024 18:13:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 020E510E790
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jan 2024 18:13:39 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-5edfcba97e3so119551617b3.2
 for <freedreno@lists.freedesktop.org>; Wed, 17 Jan 2024 10:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705515159; x=1706119959; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UZ9iGp7KbU9YOI2Xiw/kWOiOOP5HwW765+PQKI9u1WY=;
 b=OWhNQ8r3sqX1CDMV2AC618+3z36ZTk/fXQtNTTFwTMJWp6RX6eo9NRHVfRV0akGMn+
 Anl20wd9u7lG/qXgdGC9ln+GQGWA5JMSzWe0dHPdUWzJkUEEmdk9h/tsM07StsfkAnEw
 9hCNSs6nwftkFrHf3rzdXRJr+Znx1NFpcIIxoRXsmyIQ25XrukPCDe9r3EMDFr5Aa6ye
 IYa12n4b0TW68/RaesCbrScoXQF+4jXhvooLombQ8gV04MttPe0c6tEFHbUt9GOIG//f
 x46/z4js+Z0VFY3hltomN6v35bS5xbsq271fBePS7egmKbciNLmvul6MXaI6yfG58jOb
 CRNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705515159; x=1706119959;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UZ9iGp7KbU9YOI2Xiw/kWOiOOP5HwW765+PQKI9u1WY=;
 b=Gz3iOSEt6xakQfXpEhI4TFgSjK7y8gTe302VTCWFTgiBC6qaTb1Ar1hpDUw29PRiqH
 iT27jux4fKh3+7e0McR2o2Ib3P58ertVcfkzF309Vy+Fbm2gXHSCdevUZxhVQWiSlls6
 JIF/8KIWyaxSOlAX4IeHdHeChP77WAyQ+fbVnoDF2LNhih5cky1lHCGe47FBDtTz2QT+
 zJbMoWENitJOABAUAbcQAxcEYpGJxF0Y5JiV126a/9Rn769qDb3U31jYSkoT3aE+5Emm
 hWw9XpLCcT4wiWvfqOgCrSyEqemZ1MDzMR3ene3ZLAsOsncz96eofZh/eNXOsicjCDKW
 ll9g==
X-Gm-Message-State: AOJu0Yyb5BKSW2sQkh/C9+Te4yoqkCCOWiFAVf+hy/IAwDR3f5D2CHsA
 cz75njLH4BR0EByCateiySx+LRlPN9vN9QUeCzwFGMvKJ66DNw==
X-Google-Smtp-Source: AGHT+IFkh7uNNJqFCQZmQOQJTDWfRSauz7es7f6BhnoY9dO+BCxZs4hu5/U9+DmfwNxH1z70lQy1YBaP6HpodK4efr4=
X-Received: by 2002:a81:99c3:0:b0:5ea:1eb8:c37 with SMTP id
 q186-20020a8199c3000000b005ea1eb80c37mr6327524ywg.24.1705515159162; Wed, 17
 Jan 2024 10:12:39 -0800 (PST)
MIME-Version: 1.0
References: <1705514068-22394-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1705514068-22394-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jan 2024 20:12:28 +0200
Message-ID: <CAA8EJpqO+SWYcCtH1hOVow18ZTbJ=qh0D68CEP1sGObdd3=ciA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: correct configure Colorimetry Indicator
 Field at MISC0
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, robdclark@gmail.com, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-arm-msm@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 17 Jan 2024 at 19:54, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> MSA MISC0 bit 1 to 7 contains Colorimetry Indicator Field. At
> current implementation, at DP_TEST_DYNAMIC_RANGE_CEA case the

In the current implementation, in the ... case

> Colorimetry Indicator Field is mistakenly left shifted one extra
> bit.

This doesn't make sense. You say that the value is mistakenly shifted,
but the shift is still in place in dp_catalog_ctrl_config_misc().

> This patch return correct value of colorimetry at
> dp_link_get_colorimetry_config() to fix this problem.

See Documentation/process/submitting-patches.rst#_describe_changes

>
> Changes in V2:
> -- drop retrieving colorimetry from colorspace
> -- drop dr = link->dp_link.test_video.test_dyn_range assignment
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_link.c | 11 ++++++-----
>  drivers/gpu/drm/msm/dp/dp_link.h |  3 +++
>  2 files changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 98427d4..2e1bdaf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1082,7 +1082,7 @@ int dp_link_process_request(struct dp_link *dp_link)
>
>  int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>  {
> -       u32 cc;
> +       u32 cc = DP_MISC0_LEGACY_RGB;
>         struct dp_link_private *link;
>
>         if (!dp_link) {
> @@ -1096,10 +1096,11 @@ int dp_link_get_colorimetry_config(struct dp_link *dp_link)
>          * Unless a video pattern CTS test is ongoing, use RGB_VESA
>          * Only RGB_VESA and RGB_CEA supported for now
>          */
> -       if (dp_link_is_video_pattern_requested(link))
> -               cc = link->dp_link.test_video.test_dyn_range;
> -       else
> -               cc = DP_TEST_DYNAMIC_RANGE_VESA;
> +       if (dp_link_is_video_pattern_requested(link)) {
> +               if (link->dp_link.test_video.test_dyn_range &
> +                                       DP_TEST_DYNAMIC_RANGE_CEA)
> +                       cc = DP_MISC0_CEA_RGB;
> +       }
>
>         return cc;
>  }
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
> index 9dd4dd9..fe8f716 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.h
> +++ b/drivers/gpu/drm/msm/dp/dp_link.h
> @@ -12,6 +12,9 @@
>  #define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
>  #define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
>
> +#define DP_MISC0_LEGACY_RGB            0
> +#define DP_MISC0_CEA_RGB               0x04

These should go to dp_reg.h and should start with DP_MISC0_COLORIMETRY_CFG

> +
>  struct dp_link_info {
>         unsigned char revision;
>         unsigned int rate;
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
