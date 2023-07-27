Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 176DA765CFA
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 22:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9531C10E5F6;
	Thu, 27 Jul 2023 20:10:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE0610E5F3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 20:10:50 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B02C23F311;
 Thu, 27 Jul 2023 22:10:43 +0200 (CEST)
Date: Thu, 27 Jul 2023 22:10:42 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <wv556zme7i33pczp7aqln5xcljz4xuygmqkmcrw2jayrmu4tsh@ohrbffyirknb>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727162104.1497483-4-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 3/7] drm/msm/dpu: inline _setup_intf_ops()
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

On 2023-07-27 19:21:00, Dmitry Baryshkov wrote:
> Inline the _setup_intf_ops() function, it makes it easier to handle
> different conditions involving INTF configuration.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 47 +++++++++------------
>  1 file changed, 21 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 8ec6505d9e78..7ca772791a73 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
>  	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
>  }
>  
> -static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
> -		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
> -{
> -	ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
> -	ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> -	ops->get_status = dpu_hw_intf_get_status;
> -	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
> -	ops->get_line_count = dpu_hw_intf_get_line_count;
> -	if (cap & BIT(DPU_INTF_INPUT_CTRL))
> -		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
> -	ops->setup_misr = dpu_hw_intf_setup_misr;
> -	ops->collect_misr = dpu_hw_intf_collect_misr;
> -
> -	if (cap & BIT(DPU_INTF_TE)) {
> -		ops->enable_tearcheck = dpu_hw_intf_enable_te;
> -		ops->disable_tearcheck = dpu_hw_intf_disable_te;
> -		ops->connect_external_te = dpu_hw_intf_connect_external_te;
> -		ops->vsync_sel = dpu_hw_intf_vsync_sel;
> -		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> -	}
> -
> -	if (mdss_rev->core_major_ver >= 7)
> -		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
> -}
> -
>  struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>  		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
>  {
> @@ -571,7 +546,27 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>  	 */
>  	c->idx = cfg->id;
>  	c->cap = cfg;
> -	_setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
> +
> +	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
> +	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
> +	c->ops.get_status = dpu_hw_intf_get_status;
> +	c->ops.enable_timing = dpu_hw_intf_enable_timing_engine;
> +	c->ops.get_line_count = dpu_hw_intf_get_line_count;
> +	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
> +		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;

While at it, could we sort these down with the other conditional
callbacks?

> +	c->ops.setup_misr = dpu_hw_intf_setup_misr;
> +	c->ops.collect_misr = dpu_hw_intf_collect_misr;
> +
> +	if (cfg->features & BIT(DPU_INTF_TE)) {

Any clue why we're not using test_bit()?  Feels a bit inconsistent.

> +		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
> +		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
> +		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
> +		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
> +		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
> +	}
> +
> +	if (mdss_rev->core_major_ver >= 7)
> +		c->ops.program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
>  
>  	return c;
>  }
> -- 
> 2.39.2
> 
