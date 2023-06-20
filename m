Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 779BA7369FD
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 12:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4581F10E2B8;
	Tue, 20 Jun 2023 10:55:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C176E10E2BA
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 10:55:20 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b46bfa66d2so41177451fa.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 03:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687258518; x=1689850518;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CgY1pIu/2f4nnAMUfqgoFH0Yyfd9UY4bWJDqYclseU0=;
 b=GPptdl3OLHfYkJb0YNz7/gtLBR4aHH/hfp7UFcmU3Fepstp/DzGZh9nJjrZRjHmfxB
 CCLUwy0v2ID9MFLmCd4atBzp85yOuLtHZuy13G41xqSnBWF7IvOxnfFloTBfsOfVOLTc
 zFPnZjwzaS0CyezAVQb7YnFn4BfBHlgsf3wdJrbJhOhk390L3TjisXjK9vLlNaGPQEQj
 HBrrG+o+T4WmAiTBQ/Sn0FidyU0jCK0q/mU3E28/W9LShQ2108Zb42/qKi1ou/gFIBdj
 OoxHXPCpl+D9AJ5cRFOKw23c6a4GrVb/Rykx+fss8gmV+O3MbbJ+HjD80758ls9xXqBc
 G8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687258518; x=1689850518;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CgY1pIu/2f4nnAMUfqgoFH0Yyfd9UY4bWJDqYclseU0=;
 b=OmnV0fC58S40+ZbenuqafzKUyMnlJBUIxXC18MxxSFsqKAg7xr3wMgYjchY3kNlHnJ
 jUfSo9feO5ScSHAnC9lq+Jtr02doBXnkxnwevic71GJR8GTHhtx/MLngyxOOY/J0Dvmd
 lrEyMSdFMBoPjvvHwdnTW8nRojOwABFrw6O74m5DE0BO/TCUNVOB0JJ1gX74Wcsw2Ai9
 rBgcVaY75wioLoN6v2yP1bOLevNzb/GgpBizVufl17lqZEatTuS5FkVmf7NE79vgOdzX
 VM8a423V1cp1Z06tzAzhBgZHLkzKzXBV5SzlkgWjC3zyKG8Bvi2OSdXGGLNp+kN4Hv2o
 FFbA==
X-Gm-Message-State: AC+VfDwAtd8e/fn3tLuC2PvWnMdzI11ogs1sqA5MDNjkw/W/XpxcNqmW
 TjE9lBLiisd5QIlVdXebpdm6PA==
X-Google-Smtp-Source: ACHHUZ7+cRGZkLN9otc0BsmnLWN+HmFQbBS7gb+MWG5Gb7q89SkYmWFzZ6i5PNpq/33tgBgx/H3c3A==
X-Received: by 2002:a2e:9888:0:b0:2b4:78f9:3fed with SMTP id
 b8-20020a2e9888000000b002b478f93fedmr3399838ljj.53.1687258518250; 
 Tue, 20 Jun 2023 03:55:18 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 n20-20020a2eb794000000b002b47dabaaa5sm354487ljo.121.2023.06.20.03.55.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Jun 2023 03:55:17 -0700 (PDT)
Message-ID: <bc192a59-f8a1-2786-670c-cd56737dfdba@linaro.org>
Date: Tue, 20 Jun 2023 12:55:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-7-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230620000846.946925-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 6/8] drm/msm/dpu: use dpu_perf_cfg in DPU
 core_perf code
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 20.06.2023 02:08, Dmitry Baryshkov wrote:
> Simplify dpu_core_perf code by using only dpu_perf_cfg instead of using
> full-featured catalog data.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Check below.

>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 52 ++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  8 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  2 +-
>  3 files changed, 27 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 773e641eab28..78a7e3ea27a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -19,11 +19,11 @@
>  
>  /**
>   * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> - * @kms:  pointer to the dpu_kms
> + * @perf_cfg: performance configuration
>   * @crtc: pointer to a crtc
>   * Return: returns aggregated BW for all planes in crtc.
>   */
> -static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
> +static u64 _dpu_core_perf_calc_bw(const struct dpu_perf_cfg *perf_cfg,
>  		struct drm_crtc *crtc)
>  {
>  	struct drm_plane *plane;
> @@ -39,7 +39,7 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>  		crtc_plane_bw += pstate->plane_fetch_bw;
>  	}
>  
> -	bw_factor = kms->catalog->perf->bw_inefficiency_factor;
> +	bw_factor = perf_cfg->bw_inefficiency_factor;
It's set to 120 for all SoCs.. and it sounds very much like some kind of a
hack.

The 105 on the other inefficiency factor is easy to spot:

(1024/1000)^2 = 1.048576 =~= 1.05 = 105%

It comes from a MiB-MB-MHz conversion that Qcom splattered all over 
downstream as due to ancient tragical design decisions in msmbus
(which leak to the downstream interconnect a bit):

The logic needs to get some input that corresponds to a clock rate
of a bus clock (19.2, 200, 300 Mhz etc.) but the APIs expect a Kbps
value. So at one point they invented a MHZ_TO_MBPS macro which did this
conversion the other way around and probably had to account for it.

I think they tried to make it make more sense, but it ended up being
even more spaghetti :/

Not yet sure how it's done on RPMh icc, but with SMD RPM, passing e.g.

opp-peak-kBps = <(200 * 8 * 1000)>; # 200 MHz * 8-wide * KHz-to-MHz

results in a "correct" end rate.

Konrad
>  	if (bw_factor) {
>  		crtc_plane_bw *= bw_factor;
>  		do_div(crtc_plane_bw, 100);
> @@ -50,12 +50,12 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *kms,
>  
>  /**
>   * _dpu_core_perf_calc_clk() - to calculate clock per crtc
> - * @kms:  pointer to the dpu_kms
> + * @perf_cfg: performance configuration
>   * @crtc: pointer to a crtc
>   * @state: pointer to a crtc state
>   * Return: returns max clk for all planes in crtc.
>   */
> -static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
> +static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
>  		struct drm_crtc *crtc, struct drm_crtc_state *state)
>  {
>  	struct drm_plane *plane;
> @@ -76,7 +76,7 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms *kms,
>  		crtc_clk = max(pstate->plane_clk, crtc_clk);
>  	}
>  
> -	clk_factor = kms->catalog->perf->clk_inefficiency_factor;
> +	clk_factor = perf_cfg->clk_inefficiency_factor;
>  	if (clk_factor) {
>  		crtc_clk *= clk_factor;
>  		do_div(crtc_clk, 100);
> @@ -92,20 +92,20 @@ static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
>  	return to_dpu_kms(priv->kms);
>  }
>  
> -static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
> +static void _dpu_core_perf_calc_crtc(const struct dpu_perf_cfg *perf_cfg,
>  		struct drm_crtc *crtc,
>  		struct drm_crtc_state *state,
>  		struct dpu_core_perf_params *perf)
>  {
> -	if (!kms || !kms->catalog || !crtc || !state || !perf) {
> +	if (!perf_cfg || !crtc || !state || !perf) {
>  		DPU_ERROR("invalid parameters\n");
>  		return;
>  	}
>  
>  	memset(perf, 0, sizeof(struct dpu_core_perf_params));
>  
> -	perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> -	perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> +	perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> +	perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
>  
>  	DRM_DEBUG_ATOMIC(
>  		"crtc=%d clk_rate=%llu core_ab=%llu\n",
> @@ -122,6 +122,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  	struct dpu_crtc_state *dpu_cstate;
>  	struct drm_crtc *tmp_crtc;
>  	struct dpu_kms *kms;
> +	const struct dpu_perf_cfg *perf_cfg;
>  
>  	if (!crtc || !state) {
>  		DPU_ERROR("invalid crtc\n");
> @@ -129,10 +130,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  	}
>  
>  	kms = _dpu_crtc_get_kms(crtc);
> -	if (!kms->catalog) {
> -		DPU_ERROR("invalid parameters\n");
> -		return 0;
> -	}
> +	perf_cfg = kms->perf.perf_cfg;
>  
>  	/* we only need bandwidth check on real-time clients (interfaces) */
>  	if (dpu_crtc_get_client_type(crtc) == NRT_CLIENT)
> @@ -141,7 +139,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  	dpu_cstate = to_dpu_crtc_state(state);
>  
>  	/* obtain new values */
> -	_dpu_core_perf_calc_crtc(kms, crtc, state, &dpu_cstate->new_perf);
> +	_dpu_core_perf_calc_crtc(perf_cfg, crtc, state, &dpu_cstate->new_perf);
>  
>  	bw_sum_of_intfs = dpu_cstate->new_perf.bw_ctl;
>  	curr_client_type = dpu_crtc_get_client_type(crtc);
> @@ -164,7 +162,7 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
>  		bw = DIV_ROUND_UP_ULL(bw_sum_of_intfs, 1000);
>  		DRM_DEBUG_ATOMIC("calculated bandwidth=%uk\n", bw);
>  
> -		threshold = kms->catalog->perf->max_bw_high;
> +		threshold = perf_cfg->max_bw_high;
>  
>  		DRM_DEBUG_ATOMIC("final threshold bw limit = %d\n", threshold);
>  
> @@ -212,7 +210,7 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
>  	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
>  
>  	for (i = 0; i < kms->num_paths; i++)
> -		icc_set_bw(kms->path[i], avg_bw, kms->catalog->perf->min_dram_ib);
> +		icc_set_bw(kms->path[i], avg_bw, kms->perf.perf_cfg->min_dram_ib);
>  
>  	return ret;
>  }
> @@ -293,10 +291,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>  	}
>  
>  	kms = _dpu_crtc_get_kms(crtc);
> -	if (!kms->catalog) {
> -		DPU_ERROR("invalid kms\n");
> -		return -EINVAL;
> -	}
>  
>  	dpu_crtc = to_dpu_crtc(crtc);
>  	dpu_cstate = to_dpu_crtc_state(crtc->state);
> @@ -375,7 +369,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>  int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>  {
>  	struct dpu_core_perf *perf = &dpu_kms->perf;
> -	const struct dpu_mdss_cfg *catalog = perf->catalog;
>  	struct dentry *entry;
>  
>  	entry = debugfs_create_dir("core_perf", parent);
> @@ -387,15 +380,15 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>  	debugfs_create_u32("enable_bw_release", 0600, entry,
>  			(u32 *)&perf->enable_bw_release);
>  	debugfs_create_u32("threshold_low", 0600, entry,
> -			(u32 *)&catalog->perf->max_bw_low);
> +			(u32 *)&perf->perf_cfg->max_bw_low);
>  	debugfs_create_u32("threshold_high", 0600, entry,
> -			(u32 *)&catalog->perf->max_bw_high);
> +			(u32 *)&perf->perf_cfg->max_bw_high);
>  	debugfs_create_u32("min_core_ib", 0600, entry,
> -			(u32 *)&catalog->perf->min_core_ib);
> +			(u32 *)&perf->perf_cfg->min_core_ib);
>  	debugfs_create_u32("min_llcc_ib", 0600, entry,
> -			(u32 *)&catalog->perf->min_llcc_ib);
> +			(u32 *)&perf->perf_cfg->min_llcc_ib);
>  	debugfs_create_u32("min_dram_ib", 0600, entry,
> -			(u32 *)&catalog->perf->min_dram_ib);
> +			(u32 *)&perf->perf_cfg->min_dram_ib);
>  
>  	return 0;
>  }
> @@ -410,17 +403,16 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>  
>  	perf->max_core_clk_rate = 0;
>  	perf->core_clk = NULL;
> -	perf->catalog = NULL;
>  	perf->dev = NULL;
>  }
>  
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
>  		struct drm_device *dev,
> -		const struct dpu_mdss_cfg *catalog,
> +		const struct dpu_perf_cfg *perf_cfg,
>  		struct clk *core_clk)
>  {
>  	perf->dev = dev;
> -	perf->catalog = catalog;
> +	perf->perf_cfg = perf_cfg;
>  	perf->core_clk = core_clk;
>  
>  	perf->max_core_clk_rate = clk_get_rate(core_clk);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index c29ec72984b8..e8a7916b6f71 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -28,7 +28,7 @@ struct dpu_core_perf_params {
>   * struct dpu_core_perf - definition of core performance context
>   * @dev: Pointer to drm device
>   * @debugfs_root: top level debug folder
> - * @catalog: Pointer to catalog configuration
> + * @perf_cfg: Platform-specific performance configuration
>   * @core_clk: Pointer to the core clock
>   * @core_clk_rate: current core clock rate
>   * @max_core_clk_rate: maximum allowable core clock rate
> @@ -38,7 +38,7 @@ struct dpu_core_perf_params {
>  struct dpu_core_perf {
>  	struct drm_device *dev;
>  	struct dentry *debugfs_root;
> -	const struct dpu_mdss_cfg *catalog;
> +	const struct dpu_perf_cfg *perf_cfg;
>  	struct clk *core_clk;
>  	u64 core_clk_rate;
>  	u64 max_core_clk_rate;
> @@ -79,12 +79,12 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf);
>   * dpu_core_perf_init - initialize the given core performance context
>   * @perf: Pointer to core performance context
>   * @dev: Pointer to drm device
> - * @catalog: Pointer to catalog
> + * @perf_cfg: Pointer to platform performance configuration
>   * @core_clk: pointer to core clock
>   */
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
>  		struct drm_device *dev,
> -		const struct dpu_mdss_cfg *catalog,
> +		const struct dpu_perf_cfg *perf_cfg,
>  		struct clk *core_clk);
>  
>  struct dpu_kms;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..6e62606e32de 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1115,7 +1115,7 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  		dpu_kms->hw_vbif[vbif->id] = hw;
>  	}
>  
> -	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog,
> +	rc = dpu_core_perf_init(&dpu_kms->perf, dev, dpu_kms->catalog->perf,
>  			msm_clk_bulk_get_clock(dpu_kms->clocks, dpu_kms->num_clocks, "core"));
>  	if (rc) {
>  		DPU_ERROR("failed to init perf %d\n", rc);
