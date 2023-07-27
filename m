Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E022C765CDF
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 22:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB0310E5F3;
	Thu, 27 Jul 2023 20:05:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C7610E5F3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 20:05:56 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A47213F311;
 Thu, 27 Jul 2023 22:05:54 +0200 (CEST)
Date: Thu, 27 Jul 2023 22:05:53 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <hfbtvuvsha4gwlkxz4slcj6zyshuzcrq2sa3j24ymoqwo6wmib@46idblfyif7m>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727162104.1497483-2-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/dpu: enable PINGPONG TE
 operations only when supported by HW
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

On 2023-07-27 19:20:58, Dmitry Baryshkov wrote:
> The DPU_PINGPONG_TE bit is set for all PINGPONG blocks on DPU < 5.0.
> Rather than checking for the flag, check for the presense of the
> corresponding interrupt line.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 9298c166b213..912a3bdf8ad4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -296,7 +296,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
>  	c->idx = cfg->id;
>  	c->caps = cfg;

In hindsight, maybe there's one patch missing from this series.  You
inlined _setup_intf_ops() later, but there's no patch inlining
_setup_pingpong_ops() which looks to be required for applying this
patch.

- Marijn

>  
> -	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
> +	if (cfg->intr_rdptr) {
>  		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
>  		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
>  		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
> -- 
> 2.39.2
> 
