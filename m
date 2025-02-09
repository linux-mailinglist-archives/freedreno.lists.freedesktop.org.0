Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C493A2E164
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 00:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B7B10E0DA;
	Sun,  9 Feb 2025 23:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IckJv4zR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B37C10E0DE
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 23:12:05 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5450475df04so1500871e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 09 Feb 2025 15:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739142723; x=1739747523; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
 b=IckJv4zRc8qUiRud+5BmtAU9185i13yrjCEyPe0F5ApjF1Ysv2SeDyM1ndlyK+3Z0+
 sdAueaghn18apFHkjtQKbhBGycItqD4puD+ha1A30HZQBRXQW8gwv885P94/BsvNPtWA
 aZ6uha+x4itITEg7mmLEVrnpmUe0MzJqjCUFX9EgE20TInawDkGOrpARR3SfbGv/kY0F
 P1Q2rXyQaJEE6Md7PKCCm5RZO8Z7zBO4x54KbudqSpNNkZlBadewF1Wcs+i2noTmn+lE
 /eCxFF/ujaIPUjmW8TExWyznC7GnF8iwhYFl39Ph+ZV90yyPjtq1aK3Ve6DMU8k7kbBm
 G8RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739142723; x=1739747523;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
 b=AMTFw3cf5huqtXctr6osynpS1WTFrZyTeL5JYFMeQDve8uU0vZSeUpZojBsa8CR+pJ
 MyFRZu5htYS/HJXtFWoX2F/sghFF1ZkwOSIMdN8AXAZNuUwEvBkj92TsIiB/ubIBt873
 PgQkkujrmH6y9Wq69gfb2BZHS5doCtOZYqKRWDF5ZuZbA3Qu52VIwVnFAMpxlCv/nh5F
 kzzwg5cbHUVS6hTg4x9Qxix0q25WHSYODaCYmJesQcisnvAs4N/i3bBhmIX/alihRX8d
 Cahtw3S3jrc8143oLcwRtiidfHc8Qeveg9r99LWuw2hMgNtKZ7MJFtI7qQgFTNfu3VLQ
 SNbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjfokr3sNq49eOVL65/Ru4wkcjvMN/mo/MhHlzYJ4oq7qPldlW8MceoH/PKa/j0Ge2fkZd8AgzMFc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz22lypF5ogNTFeKClyY4I3Sg9MQVhuuwc98iiLPtc2Ush5aoAq
 OAAwiAomNz0WKOx1SxODgrHzsfDnPP4bQD6+DVVQi5iEyGI64yEhsFnYQqWzYBg=
X-Gm-Gg: ASbGncv1sy9JIemtWY/9+NH/43dz/H9zKQYT6oX05Maz00DOLqMLxOaVt3je1wX7Wk2
 u516qYAI/vw8+sbKYvF8UHGRr3Y94qM1C/Yx7V5CYAyj9VXUQcxQwxdTfJJdRQcFDan5jKsCqYU
 9NangqryScP2dgSWR/yYl0bXr14b7yXBjuqCGmdSx9CdEDhyrf9ykwhgdy034BReISPl9noUfXm
 c30h9SGVXGcdcSO2S/+9X9kFbY9EXL8kZ+ct/NDmLqTWCOQhU4V4LCmZMsx+efse7AZY/iQyTXl
 666ZgMuLl3OcDOWIqkzjjEXHFFTwayteWIlw+Za/BCsks4fJ/o2ZSVGH4S9EZWZUyJZ5Igg=
X-Google-Smtp-Source: AGHT+IF00rLDAE/Zu8DuAgn3EOiGHavqn93g+Q4K+br4ppdg5/rNEYRwOpkH1xQrqhqfhAl/+SpNmA==
X-Received: by 2002:a05:6512:6c5:b0:545:a89:4dc7 with SMTP id
 2adb3069b0e04-5450a894ef0mr906708e87.52.1739142722973; 
 Sun, 09 Feb 2025 15:12:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450bb646a5sm208604e87.146.2025.02.09.15.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2025 15:12:01 -0800 (PST)
Date: Mon, 10 Feb 2025 01:11:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Message-ID: <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
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

On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> Ordering issues here cause an uninitialized (default STANDALONE)
> usecase to be programmed (which appears to be a MUX) in some cases
> when msm_dsi_host_register() is called, leading to the slave PLL in
> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> 
> This should seemingly not be a problem as the actual dispcc clocks from
> DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> bit still seems to have an effect on them somehow and causes the right
> side of the panel controlled by DSI1 to not function.
> 
> In an ideal world this code is refactored to no longer have such
> error-prone calls "across subsystems", and instead model the "PLL src"
> register field as a regular mux so that changing the clock parents
> programmatically or in DTS via `assigned-clock-parents` has the
> desired effect.
> But for the avid reader, the clocks that we *are* muxing into DSI0's
> tree are way further down, so if this bit turns out to be a simple mux
> between dsiXvco and out_div, that shouldn't have any effect as this
> whole tree is off anyway.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)


Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
>  	int ret;
>  
>  	if (!IS_BONDED_DSI()) {
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +
>  		ret = msm_dsi_host_register(msm_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>  	} else if (other_dsi) {
>  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							msm_dsi : other_dsi;
>  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							other_dsi : msm_dsi;
> +
> +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> +		 *
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> +					MSM_DSI_PHY_MASTER);
> +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> +					MSM_DSI_PHY_SLAVE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> +
>  		/* Register slave host first, so that slave DSI device
>  		 * has a chance to probe, and do not block the master
>  		 * DSI device's probe.
> @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
>  		ret = msm_dsi_host_register(master_link_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> -					MSM_DSI_PHY_MASTER);
> -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> -					MSM_DSI_PHY_SLAVE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
>  	}
>  
>  	return 0;
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry
