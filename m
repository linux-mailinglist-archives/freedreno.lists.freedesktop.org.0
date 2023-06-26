Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 289C573DF2B
	for <lists+freedreno@lfdr.de>; Mon, 26 Jun 2023 14:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D605D10E1EA;
	Mon, 26 Jun 2023 12:29:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2CA310E1EA
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jun 2023 12:29:05 +0000 (UTC)
Received: from SoMainline.org (82-72-63-87.cable.dynamic.v4.ziggo.nl
 [82.72.63.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id CEA333F5A8;
 Mon, 26 Jun 2023 14:28:59 +0200 (CEST)
Date: Mon, 26 Jun 2023 14:28:58 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <wod5o5hktuos45i7reudz4jb2hc2cumghaa32bgb5gysd5yhyg@k2bo366v6rtq>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
 <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230619212519.875673-5-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v4 04/19] drm/msm/dpu: drop
 dpu_mdss_cfg::mdp_count field
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-20 00:25:04, Dmitry Baryshkov wrote:
> There is always a single MDP TOP block. Drop the mdp_count field and
> stop declaring dpu_mdp_cfg instances as arrays.
> 
> Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
<snip>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> index a1a9e44bed36..c89746c6f500 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> @@ -146,13 +146,11 @@ struct dpu_hw_mdp {
>  
>  /**
>   * dpu_hw_mdptop_init - initializes the top driver for the passed idx

No index is passed anymore, only a pointer directly to const catalog
data.  After fixing that:

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> - * @idx:  Interface index for which driver object is required
> + * @cfg:  MDP TOP configuration from catalog
>   * @addr: Mapped register io address of MDP
> - * @m:    Pointer to mdss catalog data
>   */
> -struct dpu_hw_mdp *dpu_hw_mdptop_init(enum dpu_mdp idx,
> -		void __iomem *addr,
> -		const struct dpu_mdss_cfg *m);
> +struct dpu_hw_mdp *dpu_hw_mdptop_init(const struct dpu_mdp_cfg *cfg,
> +				      void __iomem *addr);
>  
>  void dpu_hw_mdp_destroy(struct dpu_hw_mdp *mdp);
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index aa8499de1b9f..882f20fc51cc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1092,8 +1092,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>  
>  	dpu_kms->rm_init = true;
>  
> -	dpu_kms->hw_mdp = dpu_hw_mdptop_init(MDP_TOP, dpu_kms->mmio,
> -					     dpu_kms->catalog);
> +	dpu_kms->hw_mdp = dpu_hw_mdptop_init(dpu_kms->catalog->mdp,
> +					     dpu_kms->mmio);
>  	if (IS_ERR(dpu_kms->hw_mdp)) {
>  		rc = PTR_ERR(dpu_kms->hw_mdp);
>  		DPU_ERROR("failed to get hw_mdp: %d\n", rc);
> -- 
> 2.39.2
> 
