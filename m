Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 854A4A38BDA
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 20:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBD810E5AD;
	Mon, 17 Feb 2025 19:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zOZlvMZv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78CB10E5AD
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 19:03:44 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30761be8fa7so47102251fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739819023; x=1740423823; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=wqARAPdYJ/xdElMselfYbhjeGyD6v5q+Wc1NzQmTawk=;
 b=zOZlvMZvoR/2zwT6z7vHa66wBZHxPRy0wEYigLxPx0xr0JCVAZDGwPIHXD7v/lSz8L
 h4jZ5CEtubIZQ+cusSuQdgelBhokOcjHhfvqHEvlYNFs8ohT8OkFUM8WchKlROl2tAOs
 qyPrKYjHGE6xduZJb4Vi9lAruKTG9YjYdmGIhHMiqw6PUOt1fx7ML30bYk17c+fc2vb1
 r3+TZ6KHr+lST71sBeKbSx6KKdbbQAqOB/NYW43OS65RpDHp56znsc4UTH0++NW/kxlU
 GKJbH7QwPGptN/dqp9bDEcMVuzKH/mlwHJJG7T56FCSrxMRczkQe6vONaWCp5VPC7CdJ
 U9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739819023; x=1740423823;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wqARAPdYJ/xdElMselfYbhjeGyD6v5q+Wc1NzQmTawk=;
 b=rHBTpvbN/ZWk62ApggNHBzZfzo/Ra01+AyE6RTj5az8DkicqmoFzK6llOFQR9e4ZMr
 TC4PComSamUDEvOl+6CdV5Mjc4V5Jgr0e5kfPf6bsEno7ojAF6SXpOjcSrB8PC9Lm73t
 yO970j0CgIVVLbkQRZRRLq/mbfV4C65yxSoxsmNv+awI4x6D3V6CvcvF+zFp+PlI9WCG
 +mL2nIpau02nAcji9KTUmcXBNWScP39bSbNOttElcnM+UHnXbDWPlgBQQeA2yPJ8r3rp
 KJ2DqyX3AkqWZg9yUcQ1ynCJ3BDvdahpPlGC3YiNcNtfjWVDUAaMFUQBQBgK7JdavTSj
 lK5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2JTdYQMyExGQ3oyyiN7G1KZpEPUscFxYoRFJqrKRDw62ED9vyCtKt2A2hwpi7ugEX3STfBGIRpJw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJeoG/U7c89XqNHPneRXyOSz+xAawiPJROSvuFoLlOliVLk7y2
 yIWHENM4Z9SvwjMTEQVI/HvNfbi66NDsEu9WQhVD2EHocHxGn0mdUD18WwTKmNs=
X-Gm-Gg: ASbGncvFL1XtDWBLhKt1MPITb5ul+6GH2QyNUBunCenzV2q64wGlZXqOuCH3RCKh3Fg
 R0TKY3HRTtnmBHB6neJ2iuInnU/tGvWnkrvdrAQ0o8AiBr1xBb55eOrC6tRSg6UIsPhwC2gGCsF
 2i6O6sSHXEsVyJwTFh+qCGWf7MUUZfZf8fnzIz6/XjIzPjj4xVbYp5Cd3dqpG2E2CK3K/e/ng+i
 Uzfjw7B+jYc7OIodVbBy8umQtrxw07Wx+P0/gBZJWlePIieJwMIjFu3khQdTyacBKpezKDPpXGT
 69ludfWt9odNFXUoHAck5ZAmBBcuqC2ODGeoeItZN4eKBNafcRcZUKrVsAFkBJ94Mi5TfYU=
X-Google-Smtp-Source: AGHT+IH62f2i1NiC9Y1L4JGihKmed7FGNYzj/K/SBkHNk/de8aDSNi8aRspcctiuRSH4/mHKv2w5Ww==
X-Received: by 2002:a2e:87c7:0:b0:308:f479:5696 with SMTP id
 38308e7fff4ca-30927a48b4emr31189761fa.15.1739819022995; 
 Mon, 17 Feb 2025 11:03:42 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091d025767sm14492051fa.54.2025.02.17.11.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 11:03:41 -0800 (PST)
Date: Mon, 17 Feb 2025 21:03:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH v2 11/16] drm/msm/dsi/phy: Add support for SM8750
Message-ID: <sxepkcq5sbksj3xsq4mlvpzg6ljaz23bdhrehahhfjmalrlege@4atufz3uxs6x>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-11-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-11-d201dcdda6a4@linaro.org>
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

On Mon, Feb 17, 2025 at 05:41:32PM +0100, Krzysztof Kozlowski wrote:
> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with an
> incompatible hardware interface change:
> 
> ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> offsets were just switched.  Currently these registers are not used in
> the driver, so the easiest is to document both but keep them commented
> out to avoid conflict.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1.


:-)


> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 79 ++++++++++++++++++++--
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++
>  4 files changed, 90 insertions(+), 6 deletions(-)
> 
> @@ -191,11 +192,24 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x01b0" name="COMMON_STATUS_ONE"/>
>  	<reg32 offset="0x01b4" name="COMMON_STATUS_TWO"/>
>  	<reg32 offset="0x01b8" name="BAND_SEL_CAL"/>
> +	<!--
> +	Starting from SM8750, offset moved from 0x01bc to 0x01cc, however
> +	we keep only one register map.  That's not a problem, so far,
> +        because this register is not used.  The register map should be split
> +        once it is going to be used.  Comment out the code to prevent
> +	any misuse due to the change in the offset.

Mumbles a lot about the hardware design.

>  	<reg32 offset="0x01bc" name="ICODE_ACCUM_STATUS_LOW"/>
> +	<reg32 offset="0x01cc" name="ICODE_ACCUM_STATUS_LOW"/>
> +	-->
>  	<reg32 offset="0x01c0" name="ICODE_ACCUM_STATUS_HIGH"/>
>  	<reg32 offset="0x01c4" name="FD_OUT_LOW"/>
>  	<reg32 offset="0x01c8" name="FD_OUT_HIGH"/>
> +	<!--
> +	Starting from SM8750, offset moved from 0x01cc to 0x01bc, however
> +	we keep only one register map.  See above comment.
>  	<reg32 offset="0x01cc" name="ALOG_OBSV_BUS_STATUS_1"/>
> +	<reg32 offset="0x01bc" name="ALOG_OBSV_BUS_STATUS_1"/>
> +	-->
>  	<reg32 offset="0x01d0" name="PLL_MISC_CONFIG"/>
>  	<reg32 offset="0x01d4" name="FLL_CONFIG"/>
>  	<reg32 offset="0x01d8" name="FLL_FREQ_ACQ_TIME"/>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
