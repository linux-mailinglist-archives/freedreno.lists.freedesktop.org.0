Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EAC9D39A8
	for <lists+freedreno@lfdr.de>; Wed, 20 Nov 2024 12:42:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8408C10E71D;
	Wed, 20 Nov 2024 11:42:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NXAkrsFE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B422E10E71D
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 11:42:06 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539e59dadebso2665892e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 20 Nov 2024 03:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732102925; x=1732707725; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=J85HbDSvNnxr9Fvax8uh24ZXRAm6smu4V5FrFzPRi0A=;
 b=NXAkrsFElrWtXemySIYE1JWjjVod1zhMUGgU68vOroLLBo9uXmE50DSERN6Ar2JVgf
 Uvt0vcVMBBfgkKKm0xXwI1hLesWumUQ8kZCvbrXjFG4DtssmcyTLVXh8r108Yk5OnQ8S
 rjMYGVcec4lGFPoRMxROgElGtmvbjU7i5pcTjlqPALlOlNs3pUB5zm+EfsB5WZmTFCOD
 MpYp0mbZhIcLCJ32LbQVFUh0wcFpxyAeT0l8tmRpHCjwU0SKkR9Ty7FtOsHyVxV4ekDQ
 m/kjYChdK+iMyUmN98gLJ0YRzkOzL3FrOQBfpo2f40TGI7fYYcrLIjyyPXvXUy6Pqiqe
 eIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732102925; x=1732707725;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=J85HbDSvNnxr9Fvax8uh24ZXRAm6smu4V5FrFzPRi0A=;
 b=xBpybpskbF0Qgzgkm+oNReaaY4/sL86f7AgWctMPcZr3Hm08BPZtPM9/7D1zoLFXbC
 56oKcI6VS2MfloctPuc4IKCkdnVqp0YNdux2v87PjCXj28jkx8eGfvsZHM/TdFryv2EG
 y2s5Q7Lb5E4zoEsJLUM+090xBU5Tw1Zm0ayjbVchvZUfMZ0BBbe+KrmbA4KzZbeAPSfS
 DhI2ehGFjhtrPRFdQcGPdjrvm3y0VghG4XTKNU1KYUeCRh2UQ8i3lcByaxbdfrHBnJA+
 SOdZ7Wn3vphwCUfnpMXMdWkFzSzinabGYJNRkYPN2FqYa4E79OIK7hp+NT+IcDiebTEz
 cyEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZH8lPEHkDulJVeISiGCHFjQP/yj6js0Iw7O6NBy7ACN3cR/5Tc8gTuOVVfRFoqTLZcJCR6DIJIXs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC2C9yvG9QPehPh4GIOilIxcMFyf2EQ9GOAGgj5L2QxNApSurx
 +T5pTIvQkuWOmRMTIJMuWoeuVPHawbWBgcIwHKmqUOlWuJcmWvQc7N10sVj8ldI=
X-Gm-Gg: ASbGncuLxs6sq0p1sbYgbXifgM08en4GjdEn0dAJaEOxXSnqM1CYHkrLhXa3nbQA/tK
 7Gl4pMfXUb8iIL7DPrdrMP9hqMnyA48ovuNxkLxAtJxlC49Wx/3KoWQ65/QihMEVaQcovjRUW2p
 ac9n/8QjjN0CwUnIwFL3+dXheyyATOCGWydNiit+9c5YeZiwSV5oCsUdPwdVcdPPEFv7gxfrY51
 HODxKMOy9e1dM6kDA0Duks7v3aCP1ZHu7/T4lrkBTZqe/M8Wv3GRGuE6rBjyqAr0Uis/rjJum6/
 RlZfxAMa3eYURVHTMhLEulru+0Y+Cg==
X-Google-Smtp-Source: AGHT+IFkFODBIkQm7rhS+vBVQwoV7NHSlKbbb/SOrg2jNIR8W7E3SUhD1vgmyHOq/ELKF2MNxNfxpw==
X-Received: by 2002:a05:6512:3d22:b0:53d:a68f:d901 with SMTP id
 2adb3069b0e04-53dc1333415mr1130478e87.15.1732102924653; 
 Wed, 20 Nov 2024 03:42:04 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dbd477f8dsm606183e87.241.2024.11.20.03.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Nov 2024 03:42:04 -0800 (PST)
Date: Wed, 20 Nov 2024 13:42:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/11] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
Message-ID: <stifp2gtqxmegysrewfuwdsxpqin6zznvqndw7rj5nysi6rq4g@543stomenpvf>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-5-4deb87be2498@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241119-topic-sm8x50-gpu-bw-vote-v2-5-4deb87be2498@linaro.org>
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

On Tue, Nov 19, 2024 at 06:56:40PM +0100, Neil Armstrong wrote:
> The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> In order to calculate vote values used by the GPU Management
> Unit (GMU), we need to parse all the possible OPP Bandwidths and
> create a vote value to be sent to the appropriate Bus Control
> Modules (BCMs) declared in the GPU info struct.
> 
> The vote array will then be used to dynamically generate the GMU
> bw_table sent during the GMU power-up.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

LGTM, two minor nits below.

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 153 ++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 ++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>  3 files changed, 168 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 14db7376c712d19446b38152e480bd5a1e0a5198..f6814d92a4edb29ba8a34a34aabb8b2324e9c6a4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_domain.h>
>  #include <linux/pm_opp.h>
>  #include <soc/qcom/cmd-db.h>
> +#include <soc/qcom/tcs.h>
>  #include <drm/drm_gem.h>
>  
>  #include "a6xx_gpu.h"
> @@ -1287,6 +1288,109 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +/**
> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
> + * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
> + * @vcd: virtual clock domain that this bcm belongs to
> + * @reserved: reserved field
> + */
> +struct bcm_db {
> +	__le32 unit;
> +	__le16 width;
> +	u8 vcd;
> +	u8 reserved;
> +};
> +
> +static u64 bcm_div(u64 num, u32 base)
> +{
> +	/* Ensure that small votes aren't lost. */
> +	if (num && num < base)
> +		return 1;
> +
> +	do_div(num, base);
> +
> +	return num;
> +}
> +
> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
> +				       struct a6xx_gmu *gmu)
> +{
> +	const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
> +	unsigned int bcm_index, bw_index;
> +
> +	/* Retrieve BCM data from cmd-db */
> +	for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
> +		size_t count;
> +
> +		/* Skip unconfigured BCM */
> +		if (!info->bcm[bcm_index].name)
> +			continue;
> +
> +		bcm_data[bcm_index] = cmd_db_read_aux_data(
> +						info->bcm[bcm_index].name,
> +						&count);
> +		if (IS_ERR(bcm_data[bcm_index]))
> +			return PTR_ERR(bcm_data[bcm_index]);
> +
> +		if (!count)
> +			return -EINVAL;
> +	}
> +
> +	/* Generate BCM votes values for each bandwidth & BCM */
> +	for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
> +		u32 *data = gmu->gpu_bw_votes[bw_index];
> +		u32 bw = gmu->gpu_bw_table[bw_index];
> +
> +		/* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
> +		for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
> +			bool commit = false;
> +			u64 peak, vote;
> +			u16 width;
> +			u32 unit;
> +
> +			/* Skip unconfigured BCM */
> +			if (!info->bcm[bcm_index].name || !bcm_data[bcm_index])
> +				continue;

Nit: you don't care about the .name anymore, the first check can be
dropped.

> +
> +			if (bcm_index == GMU_MAX_BCMS - 1 ||
> +			    (bcm_data[bcm_index + 1] &&
> +			     bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
> +				commit = true;
> +
> +			if (!bw) {
> +				data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
> +				continue;
> +			}
> +
> +			if (info->bcm[bcm_index].fixed) {
> +				u32 perfmode = 0;
> +
> +				if (bw >= info->bcm[bcm_index].perfmode_bw)
> +					perfmode = info->bcm[bcm_index].perfmode;
> +
> +				data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
> +				continue;
> +			}
> +
> +			/* Multiply the bandwidth by the width of the connection */
> +			width = le16_to_cpu(bcm_data[bcm_index]->width);
> +			peak = bcm_div((u64)bw * width, info->bcm[bcm_index].buswidth);
> +
> +			/* Input bandwidth value is in KBps, scale the value to BCM unit */
> +			unit = le32_to_cpu(bcm_data[bcm_index]->unit);
> +			vote = bcm_div(peak * 1000ULL, unit);
> +
> +			if (vote > BCM_TCS_CMD_VOTE_MASK)
> +				vote = BCM_TCS_CMD_VOTE_MASK;
> +
> +			data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  /* Return the 'arc-level' for the given frequency */
>  static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>  					   unsigned long freq)
> @@ -1390,12 +1494,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>   * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
>   * to construct the list of votes on the CPU and send it over. Query the RPMh
>   * voltage levels and build the votes
> + * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
> + * and BCM parameters to build the votes.
>   */
>  
>  static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  	struct msm_gpu *gpu = &adreno_gpu->base;
>  	int ret;
>  
> @@ -1407,6 +1514,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>  	ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
>  		gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>  
> +	/* Build the interconnect votes */
> +	if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
> +		ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
> +
>  	return ret;
>  }
>  
> @@ -1442,6 +1553,38 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
>  	return index;
>  }
>  
> +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
> +		u32 size)
> +{
> +	int count = dev_pm_opp_get_opp_count(dev);
> +	struct dev_pm_opp *opp;
> +	int i, index = 0;
> +	unsigned int bandwidth = 1;
> +
> +	/*
> +	 * The OPP table doesn't contain the "off" bandwidth level so we need to
> +	 * add 1 to the table size to account for it
> +	 */
> +
> +	if (WARN(count + 1 > size,
> +		"The GMU bandwidth table is being truncated\n"))
> +		count = size - 1;
> +
> +	/* Set the "off" bandwidth */
> +	bandwidths[index++] = 0;
> +
> +	for (i = 0; i < count; i++) {
> +		opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
> +		if (IS_ERR(opp))
> +			break;
> +
> +		dev_pm_opp_put(opp);
> +		bandwidths[index++] = bandwidth++;
> +	}
> +
> +	return index;
> +}
> +
>  static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>  {
>  	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> @@ -1472,6 +1615,16 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>  
>  	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>  
> +	/*
> +	 * The GMU also handles GPU Interconnect Votes so build a list
> +	 * of DDR bandwidths from the GPU OPP table
> +	 */
> +	if (adreno_gpu->info->features & ADRENO_FEAT_GMU_BW_VOTE)
> +		gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
> +			gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
> +
> +	gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
> +
>  	/* Build the list of RPMh votes that we'll send to the GMU */
>  	return a6xx_gmu_rpmh_votes_init(gmu);
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index b4a79f88ccf45cfe651c86d2a9da39541c5772b3..03603eadc0f9ed866899c95e99f333a511ebc3c1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -19,6 +19,16 @@ struct a6xx_gmu_bo {
>  	u64 iova;
>  };
>  
> +#define GMU_MAX_BCMS	3
> +
> +struct a6xx_bcm {
> +	char *name;
> +	unsigned int buswidth;
> +	bool fixed;
> +	unsigned int perfmode;
> +	unsigned int perfmode_bw;
> +};
> +
>  /*
>   * These define the different GMU wake up options - these define how both the
>   * CPU and the GMU bring up the hardware
> @@ -82,6 +92,10 @@ struct a6xx_gmu {
>  	unsigned long gpu_freqs[16];
>  	u32 gx_arc_votes[16];
>  
> +	int nr_gpu_bws;
> +	unsigned long gpu_bw_table[16];
> +	u32 gpu_bw_votes[16][GMU_MAX_BCMS];

We still have magic 16 here. GPU_MAX_FREQUENCIES? GPU_FREQ_TABLE_SIZE?

> +
>  	int nr_gmu_freqs;
>  	unsigned long gmu_freqs[4];
>  	u32 cx_arc_votes[4];
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..5b80919e595fa1ba0a3afcca55feb89e60870cb1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -44,6 +44,7 @@ struct a6xx_info {
>  	u32 gmu_chipid;
>  	u32 gmu_cgc_mode;
>  	u32 prim_fifo_threshold;
> +	const struct a6xx_bcm bcm[GMU_MAX_BCMS];
>  };
>  
>  struct a6xx_gpu {
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
