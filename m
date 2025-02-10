Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33164A2EFA4
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 15:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1B710E569;
	Mon, 10 Feb 2025 14:24:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="n7mzpyZE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FF010E576
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 14:24:46 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-543e47e93a3so4970936e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 06:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739197485; x=1739802285; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rXTOeRR1tSy6DIJNpPaZKkX1fXiI12lzCj4/r2SjPr8=;
 b=n7mzpyZEVuXZYZfWAkE03stGnuGhvtFNO+KRu5YxoCUmxtUorNOBDnIotomW6UaEeg
 TGajhET81U/LzDK101JeBk+oSuGMCAJSntxShd/PA0oPfhgykNuMEG/shbzgQTVK1gp7
 w1wiEvJkZlvDqxYoQWGvrsGay1bAMUb5sdf9rYQyAVab2THcvfU/ly4thdSr2Pe1YNvx
 Q84e/Td8m/z0K4Nff2HYv37zjWktDt830scjXjQhCwdFQfm135ZT6jLjOOrCec8+hJRq
 zf3VnOsr/Olr9mJrN8v7IqZTsMa8cil2/tEZ1Mlxw1BWoTy5yzmCw6Z+57F8UoYpgkHw
 KoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739197485; x=1739802285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rXTOeRR1tSy6DIJNpPaZKkX1fXiI12lzCj4/r2SjPr8=;
 b=Cr5VOQOK+mabXiHTWlXUgBrs71ypyWs1WFRR/k8rZjP5CdLfWEmqlXTS3GZBSGglRp
 3CwaTTAv/s+iFgyDy+KfLUHwmy0PcBdPsvuk17AHGrW8SQYX0FhyEat/4dskRN0GlpHJ
 GVi4eBCBcf+TNFGLHigbXVmQ5eVUO9KHLllQZ5mP2PVcTOiQCRkXfKZY9iBOand76H08
 +DdHihkAtqrGibKomd8YGqblJqAYH8JkwxIe8PrVU8ajHD9qVHIYLx2nXFGcdXqvdpZz
 7yBMsYPSK1s6hWg6pwhZoZE5B7MQ4AERy7P6HDOhM3cGbx85H7MFyz1+ASTuF5YzIbb7
 b/XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfOTwcXOnkJ3IXajmKU6RTfNLliAnQTnXCvTf76qHiLT/W/DFq3LIzNcyuJ+TaOn+NYcTjQa2gEDY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzaB1a3RAfwnrLw3sqd4pnz7TDxJ7b2EBEN7NTlLbaMp1z5StzA
 fTna/VJRpU8Kp2+FBg1dOn+cQy9j3nTp/UnwLbNaYkS0/EyoL0xrnBdkPC4jG6Q=
X-Gm-Gg: ASbGncvmAFH9c8LXYXb8BpGS+x4Ku9+RM+ZoFGSCxlUecyFNMesDxU6MQAvzneN/Iet
 rFDWeHsjGt1mRTBXw8j/Xhrvd8STSvjJORqf0pLydYfFQjJ0MC4dmh+jKrJsAjqvdn6iIIpJTNV
 6j/PvzwEoefDgXCO2fukzW925UWqRiEeFiTqVCl9lr+4Tx5uiWy4RHZXYjCRB1z4A/92BlbInfM
 Le8Ox/GkTjoNd9z03kzzX/KZKTidmoZBVyu4XTX+nVlr1gHQAEOugR5OXBzg/0bcapeZoJfjQER
 qkTF8uceVwSgOLIXk1tgUx7Kd8CBDPxg8axv6yUF9ftRsXpqhVexrf21zyiowdW/+rwxfZE=
X-Google-Smtp-Source: AGHT+IELaktaXJDIQE5h3TJtIdi4mlctf8TeZ8f9LCc0ZKKRgqhqCKUX1/reDvwqcfshWriFj4Hheg==
X-Received: by 2002:a05:6512:2384:b0:545:d45:3958 with SMTP id
 2adb3069b0e04-5450d4539a2mr1325590e87.31.1739197484772; 
 Mon, 10 Feb 2025 06:24:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-544105bfe6fsm1261556e87.110.2025.02.10.06.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 06:24:44 -0800 (PST)
Date: Mon, 10 Feb 2025 16:24:42 +0200
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
Message-ID: <x4jced57uhdfnq4d7tdqsozxbdosu2fcmsjlqtuuvh25ltx2rc@2eqsa7e4vcdv>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
 <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
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

On Mon, Feb 10, 2025 at 01:54:29PM +0100, Marijn Suijten wrote:
> On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
> > On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> > > Ordering issues here cause an uninitialized (default STANDALONE)
> > > usecase to be programmed (which appears to be a MUX) in some cases
> > > when msm_dsi_host_register() is called, leading to the slave PLL in
> > > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> > > 
> > > This should seemingly not be a problem as the actual dispcc clocks from
> > > DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> > > bit still seems to have an effect on them somehow and causes the right
> > > side of the panel controlled by DSI1 to not function.
> > > 
> > > In an ideal world this code is refactored to no longer have such
> > > error-prone calls "across subsystems", and instead model the "PLL src"
> > > register field as a regular mux so that changing the clock parents
> > > programmatically or in DTS via `assigned-clock-parents` has the
> > > desired effect.
> > > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > > tree are way further down, so if this bit turns out to be a simple mux
> > > between dsiXvco and out_div, that shouldn't have any effect as this
> > > whole tree is off anyway.
> > > 
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
> > >  1 file changed, 19 insertions(+), 11 deletions(-)
> > 
> > 
> > Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
> 
> I'm not exactly confident about that.  Abhinav pointed out in
> https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
> msm_dsi_host_register() was not supposed to be enabling the PHY, which I
> provided a counter-stacktrace for to show that is indeed the case.
> 
> Either this was always a problem that's only become visible now (and it's an
> issue with that patch), or a different change causes msm_dsi_host_register()
> to enable the PHY and program the usecase too early?

As currently usecase is being programmed after the DSI host being
registered, there might be a race condition between panel driver probe
_and_ usecase programming.

> 
> What do you think?
> 
> - Marijn
> 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
> > >  	int ret;
> > >  
> > >  	if (!IS_BONDED_DSI()) {
> > > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > > +		 * already program the PLL source mux based on a default usecase.
> > > +		 */
> > > +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > +
> > >  		ret = msm_dsi_host_register(msm_dsi->host);
> > >  		if (ret)
> > >  			return ret;
> > > -
> > > -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > >  	} else if (other_dsi) {
> > >  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > >  							msm_dsi : other_dsi;
> > >  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > >  							other_dsi : msm_dsi;
> > > +
> > > +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> > > +		 *
> > > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > > +		 * already program the PLL source mux based on a default usecase.
> > > +		 */
> > > +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > > +					MSM_DSI_PHY_MASTER);
> > > +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > > +					MSM_DSI_PHY_SLAVE);
> > > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> > > +
> > >  		/* Register slave host first, so that slave DSI device
> > >  		 * has a chance to probe, and do not block the master
> > >  		 * DSI device's probe.
> > > @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
> > >  		ret = msm_dsi_host_register(master_link_dsi->host);
> > >  		if (ret)
> > >  			return ret;
> > > -
> > > -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> > > -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > > -					MSM_DSI_PHY_MASTER);
> > > -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > > -					MSM_DSI_PHY_SLAVE);
> > > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> > >  	}
> > >  
> > >  	return 0;
> > > 
> > > -- 
> > > 2.48.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
