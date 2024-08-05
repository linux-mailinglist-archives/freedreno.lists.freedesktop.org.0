Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAA39480B4
	for <lists+freedreno@lfdr.de>; Mon,  5 Aug 2024 19:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9078A10E273;
	Mon,  5 Aug 2024 17:51:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="FvenP9BB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE68210E296
 for <freedreno@lists.freedesktop.org>; Mon,  5 Aug 2024 17:51:51 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-825eaedff30so2129417241.0
 for <freedreno@lists.freedesktop.org>; Mon, 05 Aug 2024 10:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1722880311; x=1723485111;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=6nbW348xf8GM2iQnl+TbCKX6Ev0PICegcIqwB4d0fQU=;
 b=FvenP9BB+VLiZdfynyryVgDJ3d42pcoiu8Io2/fOglz/ZMGEm94DF2BkbZAmF6tall
 jXYXN70iNIgqIbwV1rSG20WE55ztpa2qvz1wc+hjiMmKH/JSZV6uevD6i2eqM0DYoC11
 hf4PUM/HA1qtOGOQFSwZCOs800wqegFdDHiL8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722880311; x=1723485111;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6nbW348xf8GM2iQnl+TbCKX6Ev0PICegcIqwB4d0fQU=;
 b=YUI+M04/zjgclMMT0mohud9wpSE5rycV3QCeeuPjL+G+3SwqjFB0BrqkqcLYUgE5kp
 XCJNs2GHhis/QVNb7T+SfVX/I/WpB8BbRHMXZnvje8pKfLZC2Roa74I6OCcf0ZuvTLdJ
 2EdD182Xm+eMFirLj1aRH9R5FGJAgKoTTzr+Kk/lo7p9Oe1tQ+FOvT9iTtyYvpM7jxqn
 Jy50bDwiOvax9eOIX/zK5qD2zH/hSopeCrXl/Or0O4rPQdO928H+0QuIUzsmUwA5WCpc
 czyxMFF5A+2YMZOSz9vO5OAlqHipP+Zj1BV7+q0I14AIfc/+sVjLMaNUCZEXLsLdDHo8
 9BmA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKXIg/vyc1Hjz4B3kaulswSzukPj3U0TdUGnRp71a1Bv35AIGHLVr0oxcLnm8qABQ8BYZmTjwaNvrKQgSKpgLDoGc3lRuv5VBeBDSBoxz0
X-Gm-Message-State: AOJu0Yxc4pYhRioZWvKXudLp4I/K6QR4TeYxeLOzSVI91ZuUAuJj03YW
 h190oQwtUXTuL4sr0TuW43ekVzdZFEmfNMxECgUdZDTI0JG+bNCldBlomGxF55/BDy/hVPZZArk
 C+UTh0+SsVMGHOJ6sKCHi6MyEn2/oXuRdhmEV
X-Google-Smtp-Source: AGHT+IHtSv7JoCebCjJD4wZkVA0SCLR4fN1TlmZof6Lk/RoveBtf7mPpjJXL0Ok2+pD7uFaqEK6RArc9McfQGRl5hOg=
X-Received: by 2002:a05:6122:915:b0:4f5:2c0c:8528 with SMTP id
 71dfb90a1353d-4f8a0018979mr10177984e0c.11.1722880310637; Mon, 05 Aug 2024
 10:51:50 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 5 Aug 2024 10:51:49 -0700
MIME-Version: 1.0
In-Reply-To: <20240730175541.2549592-1-quic_abhinavk@quicinc.com>
References: <20240730175541.2549592-1-quic_abhinavk@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 5 Aug 2024 10:51:49 -0700
Message-ID: <CAE-0n50jN+XivRX8D7cHff26P-kM8hNsQEpj=VBf=bEs9vESGw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: fix the max supported bpp logic
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Guenter Roeck <groeck@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Tanmay Shah <tanmay@codeaurora.org>, freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, neil.armstrong@linaro.org, andersson@kernel.org, 
 abel.vesa@linaro.org, Vara Reddy <quic_varar@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

Quoting Abhinav Kumar (2024-07-30 10:55:40)
> Fix the dp_panel_get_supported_bpp() API to return the minimum
> supported bpp correctly for relevant cases and use this API
> to correct the behavior of DP driver which hard-codes the max supported
> bpp to 30.
>
> This is incorrect because the number of lanes and max data rate
> supported by the lanes need to be taken into account.
>
> Replace the hardcoded limit with the appropriate math which accounts
> for the accurate number of lanes and max data rate.
>
> changes in v2:
>         - Fix the dp_panel_get_supported_bpp() and use it
>         - Drop the max_t usage as dp_panel_get_supported_bpp() already
>           returns the min_bpp correctly now
>
> Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/43
> Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # SM8350-HDK
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---

One note below,

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> index a916b5f3b317..3777b1abacad 100644
> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> @@ -90,22 +90,22 @@ static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
>  static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
>                 u32 mode_edid_bpp, u32 mode_pclk_khz)
>  {
> -       struct dp_link_info *link_info;
> +       const struct dp_link_info *link_info;
>         const u32 max_supported_bpp = 30, min_supported_bpp = 18;
> -       u32 bpp = 0, data_rate_khz = 0;
> +       u32 bpp, data_rate_khz;
>
>         bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);

This can be min() because all types are u32.

>
>         link_info = &dp_panel->link_info;
>         data_rate_khz = link_info->num_lanes * link_info->rate * 8;
>
> -       while (bpp > min_supported_bpp) {
> +       do {
>                 if (mode_pclk_khz * bpp <= data_rate_khz)
> -                       break;
> +                       return bpp;
>                 bpp -= 6;
> -       }
> +       } while (bpp > min_supported_bpp);
>
> -       return bpp;
> +       return min_supported_bpp;
>  }
>
>  int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
