Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 943CD765CFE
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 22:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A320A10E5F6;
	Thu, 27 Jul 2023 20:12:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::166])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3E10E5F3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 20:12:42 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 4C9B93F1F1;
 Thu, 27 Jul 2023 22:12:40 +0200 (CEST)
Date: Thu, 27 Jul 2023 22:12:38 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <lck7thivac7ztu6e7b4hakjtpoobydcanjdffn6vvppmc4yzcc@46gcp2pwxedq>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727162104.1497483-5-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 4/7] drm/msm/dpu: enable INTF TE operations
 only when supported by HW
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

On 2023-07-27 19:21:01, Dmitry Baryshkov wrote:
> The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
> only INTF_1 and INTF_2 actually support tearing control. Rather than
> trying to fix the DPU_INTF_TE, check for the presense of the

I would more exactly expand "fix" to "Rather than specifying that
feature bit on DSI INTF_1 and INTF_2 exclusively..."

> corresponding interrupt line.

... which the catalog will only provide on DPU >= 5.0.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 7ca772791a73..8abdf9553f3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -557,7 +557,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>  	c->ops.setup_misr = dpu_hw_intf_setup_misr;
>  	c->ops.collect_misr = dpu_hw_intf_collect_misr;
>  
> -	if (cfg->features & BIT(DPU_INTF_TE)) {
> +	if (cfg->intr_tear_rd_ptr) {
>  		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
>  		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
>  		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
> -- 
> 2.39.2
> 
