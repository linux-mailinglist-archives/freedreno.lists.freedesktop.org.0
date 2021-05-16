Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD7E381CAC
	for <lists+freedreno@lfdr.de>; Sun, 16 May 2021 06:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45DC46E48B;
	Sun, 16 May 2021 04:31:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BA166E48D
 for <freedreno@lists.freedesktop.org>; Sun, 16 May 2021 04:31:55 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 i23-20020a9d68d70000b02902dc19ed4c15so2864959oto.0
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 21:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9W67bBwxt4nuRfSy8L2pigsXcFiARRo/0xq8+QoSmEc=;
 b=H79GG5TYhmCrLXz/a39PjP7m7PiDCqHKTQ6TOSV9XyEy9B5XNrrxhYRjyS2JwyGEsV
 K8bps9BTmyF7q1vKAdrr8OApAj2PiEejiz8v9o69mhzdNDQXPfwSbjzOyZYopjUBzRPn
 HHwa5AtNPDJyL2RqWSkttR+37PyDDAMgA7edCr0aj9kfMenMWXkZgR51VG1eeeM5xZns
 HiHCw78GQBYJ1/LaZYUfUs/vi+gDziFQ+PVNVW464oTsqw9hLvE/d/5CIeCbjPjAEO1h
 ITT+YqZ+v7qhgHXs6anLC00TCwAADNCBqNMVsUgjVpDnc3m+naouH8le33xmZ/6vQEkv
 7HtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9W67bBwxt4nuRfSy8L2pigsXcFiARRo/0xq8+QoSmEc=;
 b=S/HGKrhN2RFX8PUDGdOT0FTG5sTaTkLI6SXPEmEwUuNp6hfEqJdcni1GVMlW5seeGe
 /dxLi2gsXvZfR6vqVj+ZBRE6+m+COq5+l6skKvM3mCWG6bm7IIh0Zn3IX0GawUbZQNoW
 2nsnoemMlr/32Jmrlr0sg7ntJ8uaiArW+S5nDzFz+O4Ig3eAY8pjyoO/B55GMBy3mWbs
 mpIngcnRnuEqpCBI+4eBBQTI17YuOhIPkezWmZK528HjXjjx9hYfIWCOvcFjrYc8bN4Z
 6G9T94CIc5Gpisd962ebYPb9UXSASfgjGJRsbDH+/d3tu+E5EROxdzlX3zDk+TNJZM9O
 bEkg==
X-Gm-Message-State: AOAM533gEs3r1BMHKVRXtUW5GLe0K6JiFDsUPePvRkVskoj3z4YJAIcQ
 p6LOCH8SN11rB4m6H2v7p5F26Q==
X-Google-Smtp-Source: ABdhPJzqteP0dTz9JQcbdCh1WiKWc74jOFZZ6oQ7qiVrLMAjIes2aLGL43w0VDGkmDAd4sUle/0vNQ==
X-Received: by 2002:a9d:6394:: with SMTP id w20mr44952345otk.174.1621139514803; 
 Sat, 15 May 2021 21:31:54 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id h59sm2323309otb.29.2021.05.15.21.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 21:31:54 -0700 (PDT)
Date: Sat, 15 May 2021 23:31:52 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <20210516043152.GP2484@yoga>
References: <20210412000954.2049141-1-dmitry.baryshkov@linaro.org>
 <20210412000954.2049141-3-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412000954.2049141-3-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v1 2/3] drm/msm/dpu: hw_intr: always call
 dpu_hw_intr_clear_intr_status_nolock
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun 11 Apr 19:09 CDT 2021, Dmitry Baryshkov wrote:

> Always call dpu_hw_intr_clear_intr_status_nolock() from the
> dpu_hw_intr_dispatch_irqs(). This simplifies the callback function
> (which call clears the interrupts anyway) and enforces clearing the hw
> interrupt status.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  |  9 -----
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 39 +++++++++----------
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  9 -----
>  3 files changed, 18 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> index 54b34746a587..fd11a2aeab6c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c
> @@ -41,15 +41,6 @@ static void dpu_core_irq_callback_handler(void *arg, int irq_idx)
>  		if (cb->func)
>  			cb->func(cb->arg, irq_idx);
>  	spin_unlock_irqrestore(&dpu_kms->irq_obj.cb_lock, irq_flags);
> -
> -	/*
> -	 * Clear pending interrupt status in HW.
> -	 * NOTE: dpu_core_irq_callback_handler is protected by top-level
> -	 *       spinlock, so it is safe to clear any interrupt status here.
> -	 */
> -	dpu_kms->hw_intr->ops.clear_intr_status_nolock(
> -			dpu_kms->hw_intr,
> -			irq_idx);
>  }
>  
>  int dpu_core_irq_idx_lookup(struct dpu_kms *dpu_kms,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index cf9bfd45aa59..8bd22e060437 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -1362,6 +1362,22 @@ static int dpu_hw_intr_irqidx_lookup(struct dpu_hw_intr *intr,
>  	return -EINVAL;
>  }
>  
> +static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
> +		int irq_idx)
> +{
> +	int reg_idx;
> +
> +	if (!intr)
> +		return;
> +
> +	reg_idx = dpu_irq_map[irq_idx].reg_idx;
> +	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> +			dpu_irq_map[irq_idx].irq_mask);
> +
> +	/* ensure register writes go through */
> +	wmb();
> +}
> +
>  static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  		void (*cbfunc)(void *, int),
>  		void *arg)
> @@ -1430,9 +1446,8 @@ static void dpu_hw_intr_dispatch_irq(struct dpu_hw_intr *intr,
>  				 */
>  				if (cbfunc)
>  					cbfunc(arg, irq_idx);
> -				else
> -					intr->ops.clear_intr_status_nolock(
> -							intr, irq_idx);
> +
> +				dpu_hw_intr_clear_intr_status_nolock(intr, irq_idx);
>  
>  				/*
>  				 * When callback finish, clear the irq_status
> @@ -1597,23 +1612,6 @@ static int dpu_hw_intr_disable_irqs(struct dpu_hw_intr *intr)
>  	return 0;
>  }
>  
> -
> -static void dpu_hw_intr_clear_intr_status_nolock(struct dpu_hw_intr *intr,
> -		int irq_idx)
> -{
> -	int reg_idx;
> -
> -	if (!intr)
> -		return;
> -
> -	reg_idx = dpu_irq_map[irq_idx].reg_idx;
> -	DPU_REG_WRITE(&intr->hw, dpu_intr_set[reg_idx].clr_off,
> -			dpu_irq_map[irq_idx].irq_mask);
> -
> -	/* ensure register writes go through */
> -	wmb();
> -}
> -
>  static u32 dpu_hw_intr_get_interrupt_status(struct dpu_hw_intr *intr,
>  		int irq_idx, bool clear)
>  {
> @@ -1655,7 +1653,6 @@ static void __setup_intr_ops(struct dpu_hw_intr_ops *ops)
>  	ops->dispatch_irqs = dpu_hw_intr_dispatch_irq;
>  	ops->clear_all_irqs = dpu_hw_intr_clear_irqs;
>  	ops->disable_all_irqs = dpu_hw_intr_disable_irqs;
> -	ops->clear_intr_status_nolock = dpu_hw_intr_clear_intr_status_nolock;
>  	ops->get_interrupt_status = dpu_hw_intr_get_interrupt_status;
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index 5a1c304ba93f..5bade5637ecc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -142,15 +142,6 @@ struct dpu_hw_intr_ops {
>  			void (*cbfunc)(void *arg, int irq_idx),
>  			void *arg);
>  
> -	/**
> -	 * clear_intr_status_nolock() - clears the HW interrupts without lock
> -	 * @intr:	HW interrupt handle
> -	 * @irq_idx:	Lookup irq index return from irq_idx_lookup
> -	 */
> -	void (*clear_intr_status_nolock)(
> -			struct dpu_hw_intr *intr,
> -			int irq_idx);
> -
>  	/**
>  	 * get_interrupt_status - Gets HW interrupt status, and clear if set,
>  	 *                        based on given lookup IRQ index.
> -- 
> 2.30.2
> 
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
