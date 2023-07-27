Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 381F0765C14
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 21:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAFE310E5EA;
	Thu, 27 Jul 2023 19:27:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2B810E5EA
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 19:27:38 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 0D8C720141;
 Thu, 27 Jul 2023 21:27:37 +0200 (CEST)
Date: Thu, 27 Jul 2023 21:27:35 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <rqiv3huyurkoqptjw5hn5kxt6ljoogbulwvi4unhiru2vnnprv@dcp4b5pmbkmc>
References: <20230727150455.1489575-1-dmitry.baryshkov@linaro.org>
 <20230727150455.1489575-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230727150455.1489575-3-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 2/4] drm/msm/dpu: move several
 IRQ-related defines
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

On 2023-07-27 18:04:53, Dmitry Baryshkov wrote:
> In preparation of slighly changing IRQ numbering, move DPU_IRQ_REG()
> macro to the dpu_hw_interrupts.h header. Also split the DPU_IRQ_MASK()
> macro into local DPU_IRQ_MASK() and the global DPU_IRQ_OFFSET() macros.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 3 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h | 2 ++
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 01a9ccfcd54b..eaae7f11f57f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -197,8 +197,7 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
>  	},
>  };
>  
> -#define DPU_IRQ_REG(irq_idx)	(irq_idx / 32)
> -#define DPU_IRQ_MASK(irq_idx)	(BIT(irq_idx % 32))
> +#define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_OFFSET(irq_idx)))
>  
>  /**
>   * dpu_core_irq_callback_handler - dispatch core interrupts
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index e2b00dd32619..3a988a4e4f33 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -37,6 +37,8 @@ enum dpu_hw_intr_reg {
>  #define MDP_INTFn_INTR(intf)	(MDP_INTF0_INTR + (intf - INTF_0))
>  
>  #define DPU_IRQ_IDX(reg_idx, offset)	(reg_idx * 32 + offset)
> +#define DPU_IRQ_REG(irq_idx)		((irq_idx) / 32)
> +#define DPU_IRQ_OFFSET(irq_idx)		((irq_idx) % 32)
>  
>  /**
>   * struct dpu_hw_intr: hw interrupts handling data structure
> -- 
> 2.39.2
> 
