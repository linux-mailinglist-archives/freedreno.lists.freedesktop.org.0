Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56D1855356
	for <lists+freedreno@lfdr.de>; Wed, 14 Feb 2024 20:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ACB10E212;
	Wed, 14 Feb 2024 19:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ye06QZfy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF22B10E038
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 19:41:46 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcbc00f6c04so24414276.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Feb 2024 11:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707939706; x=1708544506; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2OSlP3aylF8ytrd/OKr6EwoDt5u+yI0OOQzWZnhLnhY=;
 b=ye06QZfymoo+whOpzXaTNOEUlLjGr5+RAIF+0IlDdkMgYrvYgDr+sN5JZF1GJbse7I
 BVdlzl4e5tWk0615Th0lxK1KnkRFahoSKZrGW+0lzQLZQ5i7kmp0u8++SQXbHwl14C4M
 hizb1SbK0UNh1fnCGZ+lqNicm7CG6diPQd/hSBwlxIlCuNdCBH3umbDLahqqdZ8JgUof
 43/KjfUvcqE0blgurQMLw7FQgGUAkgF9LAwAuccjpo99ML/EsPv+uV7BpffwkmxTqc3e
 piQ7O7JaWiBgrqGVaXmLH8lU/nXUvgnnkfg/O3hGKTFAm146NGV1iGJU9KmD6f4dN2Ql
 a13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707939706; x=1708544506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2OSlP3aylF8ytrd/OKr6EwoDt5u+yI0OOQzWZnhLnhY=;
 b=L1dCig2fwpy72lHLsPrnY+ZjjGQddEu0iWeHnCoWk65KV+asC/JK/ZFJdVJpTD0hV6
 u0LfgW1j70XXWKxmMZgpmDG4yP8iBevtmTY0MmFPmyjZ0m0WA/+Nncrq2B8q7Ppqi5qK
 1mT2t3wFHUMPBoP23Ox9M9XP9I7awBqV5wyRgnyIV/KvAQnH1HvvgWFYt0QtgwISRff4
 4oxCudP9KT/qkLxSS12Q1IH63hmtcJAd+IExBxKLiMKI6K6KzcmMDw8o16dBLDp5oujg
 EUUW0aBf5ZwgbZoSdZxYITaZctnWofAewVLOUUY6blbouNs8B//XCZ8fJHIwFJyuN+t9
 dBiw==
X-Gm-Message-State: AOJu0YwCdEwBE7nWsSCmlC2pvoSc940jqdhu5rhVUdfuvn4sdapUQWW+
 WoyD8/AaakEun9cl1UJ6T1743+x8aFFy1jcrcuYiTse6ViEWupCYEFpcKovhFd4jXhTnqs1ddIL
 MiUIQGGsk8sMRWDqLSOrQA0mg5WumKFxEkfDiZQ==
X-Google-Smtp-Source: AGHT+IExXjIwVm/q6jwl+Mjt91XVjobuOr3lFXEA9VIx0V17RXPdddohBXeKHoGCqBjbyho89WdtudwJs61X/dngvcY=
X-Received: by 2002:a25:a1a4:0:b0:dcd:5e5d:51e5 with SMTP id
 a33-20020a25a1a4000000b00dcd5e5d51e5mr2715372ybi.60.1707939705764; Wed, 14
 Feb 2024 11:41:45 -0800 (PST)
MIME-Version: 1.0
References: <20240214180347.1399-1-quic_parellan@quicinc.com>
 <20240214180347.1399-16-quic_parellan@quicinc.com>
In-Reply-To: <20240214180347.1399-16-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 14 Feb 2024 21:41:34 +0200
Message-ID: <CAA8EJpp43otRsAKthEgzJPrVf0j4_0=_kRMnqBNYhEgED=wiYg@mail.gmail.com>
Subject: Re: [PATCH v3 15/19] drm/msm/dp: enable SDP and SDE periph flush
 update
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Wed, 14 Feb 2024 at 20:04, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> DP controller can be setup to operate in either SDP update flush mode or
> peripheral flush mode based on the DP controller hardware version.
>
> Starting in DP v1.2, the hardware documents require the use of
> peripheral flush mode for SDP packets such as PPS OR VSC SDP packets.
>
> In-line with this guidance, lets program the DP controller to use
> peripheral flush mode starting DP v1.2
>
> Changes in v3:
>         - Clear up that the DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE
>           macro is setting bits [24:23] to a value of 3
>
> Changes in v2:
>         - Use the original dp_catalog_hw_revision() function to
>           correctly check the DP HW version
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 17 +++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_catalog.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  5 +++++
>  4 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index 61d5317efe683..823eeba7e71d3 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -440,6 +440,23 @@ void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
>         dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
>  }
>
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog)
> +{
> +       u32 mainlink_ctrl, hw_revision;
> +       struct dp_catalog_private *catalog = container_of(dp_catalog,
> +                               struct dp_catalog_private, dp_catalog);
> +
> +       mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
> +
> +       hw_revision = dp_catalog_hw_revision(dp_catalog);
> +       if (hw_revision >= DP_HW_VERSION_1_2)
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE;
> +       else
> +               mainlink_ctrl |= DP_MAINLINK_FLUSH_MODE_UPDATE_SDP;
> +
> +       dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
> +}
> +
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
>                                         u32 rate, u32 stream_rate_khz,
>                                         bool fixed_nvid, bool is_ycbcr_420)
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
> index 4bf08c27a9bf3..eb05a37837beb 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.h
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
> @@ -98,6 +98,7 @@ void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
>  void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
>  void dp_catalog_ctrl_psr_mainlink_enable(struct dp_catalog *dp_catalog, bool enable);
> +void dp_catalog_setup_peripheral_flush(struct dp_catalog *dp_catalog);
>  void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
>  void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
>                                 u32 stream_rate_khz, bool fixed_nvid, bool is_ycbcr_420);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index beef86b1aaf81..f1e7b0a5ee5d1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -170,6 +170,7 @@ static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
>
>         dp_catalog_ctrl_lane_mapping(ctrl->catalog);
>         dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
> +       dp_catalog_setup_peripheral_flush(ctrl->catalog);
>
>         dp_ctrl_config_ctrl(ctrl);
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
> index 2983756c125cd..d4fb8572cd1e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
> @@ -6,6 +6,9 @@
>  #ifndef _DP_REG_H_
>  #define _DP_REG_H_
>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +
>  /* DP_TX Registers */
>  #define REG_DP_HW_VERSION                      (0x00000000)
>
> @@ -102,6 +105,8 @@
>  #define DP_MAINLINK_CTRL_ENABLE                        (0x00000001)
>  #define DP_MAINLINK_CTRL_RESET                 (0x00000002)
>  #define DP_MAINLINK_CTRL_SW_BYPASS_SCRAMBLER   (0x00000010)
> +#define DP_MAINLINK_FLUSH_MODE_UPDATE_SDP      (0x00800000)

This define covers data from the same bit field. Please use FIELD_PREP too.

> +#define DP_MAINLINK_FLUSH_MODE_SDE_PERIPH_UPDATE       FIELD_PREP(GENMASK(24, 23), 3)

#define DP_foo_MASK GENMASK(24,23)

>  #define DP_MAINLINK_FB_BOUNDARY_SEL            (0x02000000)
>
>  #define REG_DP_STATE_CTRL                      (0x00000004)
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
