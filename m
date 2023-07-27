Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB185765D10
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 22:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86E8510E5FA;
	Thu, 27 Jul 2023 20:16:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA98710E5FB
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 20:16:30 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 10D4520471;
 Thu, 27 Jul 2023 22:16:29 +0200 (CEST)
Date: Thu, 27 Jul 2023 22:16:27 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <irbt5um3wmeqfxtazpaje7mir5vko5ysxx3zpg3vdxwhtdhpkg@y2nzsezlx27n>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
 <20230727162104.1497483-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727162104.1497483-7-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 6/7] drm/msm/dpu: drop useless check from
 dpu_encoder_phys_cmd_te_rd_ptr_irq()
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

On 2023-07-27 19:21:03, Dmitry Baryshkov wrote:
> The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
> nor hw_pp data, so we can drop the corresponding check.

Maybe because it would catch "bogus" interrupts, or these blocks are
accessed somewhere down the line in the vblank callback chain?  I have
no clue :)

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 60d4dd88725e..04a1106101a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -108,14 +108,6 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg)
>  	struct dpu_encoder_phys *phys_enc = arg;
>  	struct dpu_encoder_phys_cmd *cmd_enc;
>  
> -	if (phys_enc->has_intf_te) {
> -		if (!phys_enc->hw_intf)
> -			return;
> -	} else {
> -		if (!phys_enc->hw_pp)
> -			return;
> -	}
> -
>  	DPU_ATRACE_BEGIN("rd_ptr_irq");
>  	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
>  
> -- 
> 2.39.2
> 
