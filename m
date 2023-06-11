Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D2572B48A
	for <lists+freedreno@lfdr.de>; Mon, 12 Jun 2023 00:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCFB10E13C;
	Sun, 11 Jun 2023 22:03:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay02.th.seeweb.it (relay02.th.seeweb.it [5.144.164.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF6510E13C
 for <freedreno@lists.freedesktop.org>; Sun, 11 Jun 2023 22:03:23 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id BA2A01F9B4;
 Mon, 12 Jun 2023 00:03:20 +0200 (CEST)
Date: Mon, 12 Jun 2023 00:03:19 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Message-ID: <6uiyqgggt2a3gkcihtyzr4rvq5igbe3ojpeiqnji22663bhh2l@3jifgk7bw4u5>
References: <20230405-add-dsc-support-v6-0-95eab864d1b6@quicinc.com>
 <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405-add-dsc-support-v6-6-95eab864d1b6@quicinc.com>
Subject: Re: [Freedreno] [PATCH v6 6/6] drm/msm/dsi: Document DSC related
 pclk_rate and hdisplay calculations
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-09 15:57:18, Jessica Zhang wrote:
> Add documentation comments explaining the pclk_rate and hdisplay math
> related to DSC.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index fb1d3a25765f..aeaadc18bc7b 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -564,6 +564,13 @@ void dsi_link_clk_disable_v2(struct msm_dsi_host *msm_host)
>  static unsigned long dsi_adjust_pclk_for_compression(const struct drm_display_mode *mode,
>  		const struct drm_dsc_config *dsc)
>  {
> +	/*
> +	 * Adjust the pclk rate by calculating a new hdisplay proportional to
> +	 * the compression ratio such that:
> +	 *     new_hdisplay = old_hdisplay * target_bpp / source_bpp
> +	 *
> +	 * Porches need not be adjusted during compression.
> +	 */
>  	int new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>  			dsc->bits_per_component * 3);

I won't reiterate my original troubles with this logic and the comment
as that has well been described in v5 replies.

Just want to ask why this comment couldn't be added in patch 5/6
immediately when the logic is introduced?  Now readers won't have a clue
what is going on until they skip one patch ahead.

Furthermore it is lacking any explanation that this is a workaround for
cmd-mode, and that porches are currently used to represent "transfer
time" until those calculations are implemented.  At that point there is
no concept of "not adjusting porches for compressed signals" anymore.

>  
> @@ -961,6 +968,9 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  
>  		/* Divide the display by 3 but keep back/font porch and
>  		 * pulse width same
> +		 *
> +		 * hdisplay will be divided by 3 here to account for the fact
> +		 * that DPU sends 3 bytes per pclk cycle to DSI.
>  		 */
>  		h_total -= hdisplay;
>  		hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), 3);

Still very glad to have this, thank you for adding it.  Note that it
only further undermines the pclk adjustments, as I just explained in v5
review.

- Marijn

> 
> -- 
> 2.40.1
> 
