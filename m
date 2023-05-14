Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2486701FEF
	for <lists+freedreno@lfdr.de>; Sun, 14 May 2023 23:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C6910E0F6;
	Sun, 14 May 2023 21:43:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [5.144.164.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162E710E0DD
 for <freedreno@lists.freedesktop.org>; Sun, 14 May 2023 21:43:09 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 2D2883F1EC;
 Sun, 14 May 2023 23:43:07 +0200 (CEST)
Date: Sun, 14 May 2023 23:43:05 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <jmkjqiitdi2e5b4sbadlznuyczzykolulj5ey7zzsmmycrvrhr@qblz2f3zmyj2>
References: <1683914423-17612-1-git-send-email-quic_khsieh@quicinc.com>
 <1683914423-17612-4-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1683914423-17612-4-git-send-email-quic_khsieh@quicinc.com>
Subject: Re: [Freedreno] [PATCH v8 3/8] drm/msm/dpu: test DPU_PINGPONG_DSC
 bit before assign DSC ops to PINGPONG
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
Cc: freedreno@lists.freedesktop.org, quic_sbillaka@quicinc.com,
 quic_abhinavk@quicinc.com, airlied@gmail.com, andersson@kernel.org,
 robdclark@gmail.com, dri-devel@lists.freedesktop.org, dianders@chromium.org,
 vkoul@kernel.org, agross@kernel.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fix the title: "Require DPU_PINGPONG_DSC bit for DSC ops on PINGPONG block"
Or: "Only enable PINGPONG DSC ops with DPU_PINGPONG_DSC bit"
Or (my preference): "Guard PINGPONG DSC ops behind DPU_PINGPONG_DSC bit"

On 2023-05-12 11:00:18, Kuogee Hsieh wrote:
> 
> DPU < 7.0.0 has DPU_PINGPONG_DSC feature bit set to indicate it requires
> both dpu_hw_pp_setup_dsc() and dpu_hw_pp_dsc_{enable,disable}() to be
> executed to complete DSC configuration if DSC hardware block is present.
> Hence test DPU_PINGPONG_DSC feature bit and assign DSC related functions
> to the ops of PINGPONG block accordingly if DPU_PINGPONG_DSC bit is set.
> 
> changes in v6:
> -- split patches, this patch has function handles DPU_PINGPONG_DSC bit
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 79e4576..e7f47a4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -295,6 +295,12 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
>  	c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>  	c->ops.disable_dsc = dpu_hw_pp_dsc_disable;

Nak: the functions are unconditionally assigned right above, while this
bit of code should have been wrapped/replaced by the addition below.
Bad rebase?

- Marijn

> +	if (test_bit(DPU_PINGPONG_DSC, &features)) {
> +		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
> +		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
> +		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> +	}
> +
>  	if (test_bit(DPU_PINGPONG_DITHER, &features))
>  		c->ops.setup_dither = dpu_hw_pp_setup_dither;
>  };
> -- 
> 2.7.4
> 
