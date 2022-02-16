Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB54B7D6F
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:22:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED5E10E609;
	Wed, 16 Feb 2022 02:22:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D91E10E60B
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:22:28 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so890292oob.8
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fK8Mmhno7fLan6TDKNBId+rzPxNl521LefBZ7ENEERM=;
 b=Tu1Au4lnq1UJyXBeqnsLeFbw8EaG4GbmxIUlt7svJCU5uTPzGtBJlwFoJJrtt7yrtO
 9VA4f5mOw1mNlqn4q2kDkG/yRstq7Zfiru3dRcBqygJD6BeE6kioElcckVEu6+F8rtBL
 1toixeet31wCEU5P9kJzO5SIS7RtAEADHB+s8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fK8Mmhno7fLan6TDKNBId+rzPxNl521LefBZ7ENEERM=;
 b=x1NX/3kE8LIBQzhSC8VMC/qQyBvpqXgVMai6sLdudFPpyGTvAJz8HDNWahLSSRplfv
 DwdhyCRXGhWg/xDEdycYA515jmkfv4CXU6G6gnn3+qj7K7puNohFt23OM0YoseIO2jcH
 rn1AM8s8k8TQ0BfepFW24NpuZHltuUMYVjk6oImlN8IsvRb42f7CqUypeuXAMjwzhwG5
 SjluqnU8DUCO7HL+zPcPmhYn6mqmI7WpKtQVj6RMaI7vGZg3Hh+bXDwPfh+zdDpRKr8g
 nevUPHd0IMS/gOmsnAxCawLLsdH5eCIgNRT04JHId2nLhX4/i8mWASpwhG9PaKygb6cm
 vEUQ==
X-Gm-Message-State: AOAM531hy/0AxF1hCGHMmpduupAR8qpy4pa+3n6QSFKsBn3WFoaKInc4
 VGOFRPz931MObH2Kwh/r8nb2cUH2qnKcz1DZdi02yQ==
X-Google-Smtp-Source: ABdhPJyjTYdIHsZuJ13hWO4CixvXg+H94za0iiOclD6oXF5Mh6GJpUPdUk1fk5or2G1mP8ewQeY5KV6BrvCV3C/kh+o=
X-Received: by 2002:a05:6870:631a:b0:d1:7d97:806 with SMTP id
 s26-20020a056870631a00b000d17d970806mr289535oao.8.1644978147558; Tue, 15 Feb
 2022 18:22:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:22:27 -0800
MIME-Version: 1.0
In-Reply-To: <20220201151056.2480055-6-dmitry.baryshkov@linaro.org>
References: <20220201151056.2480055-1-dmitry.baryshkov@linaro.org>
 <20220201151056.2480055-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:22:27 -0800
Message-ID: <CAE-0n50p7nxqger_9i22TnWACNM4SM5OP+f9mS7wUZwi1dP1Ag@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 5/6] drm/msm/dpu: remove struct
 dpu_encoder_irq
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-01 07:10:55)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index ff2218155b44..803fd6f25da1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -231,7 +216,7 @@ struct dpu_encoder_phys {
>         atomic_t pending_ctlstart_cnt;
>         atomic_t pending_kickoff_cnt;
>         wait_queue_head_t pending_kickoff_wq;
> -       struct dpu_encoder_irq irq[INTR_IDX_MAX];
> +       int irq[INTR_IDX_MAX];
>  };
>
>  static inline int dpu_encoder_phys_inc_pending(struct dpu_encoder_phys *phys)
> @@ -729,20 +727,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>         phys_enc->split_role = p->split_role;
>         phys_enc->intf_mode = INTF_MODE_VIDEO;
>         phys_enc->enc_spinlock = p->enc_spinlock;
> -       for (i = 0; i < INTR_IDX_MAX; i++) {
> -               irq = &phys_enc->irq[i];
> -               irq->irq_idx = -EINVAL;
> -       }
> -
> -       irq = &phys_enc->irq[INTR_IDX_VSYNC];
> -       irq->name = "vsync_irq";
> -       irq->intr_idx = INTR_IDX_VSYNC;
> -       irq->func = dpu_encoder_phys_vid_vblank_irq;
> -
> -       irq = &phys_enc->irq[INTR_IDX_UNDERRUN];
> -       irq->name = "underrun";
> -       irq->intr_idx = INTR_IDX_UNDERRUN;
> -       irq->func = dpu_encoder_phys_vid_underrun_irq;
> +       for (i = 0; i < INTR_IDX_MAX; i++)

Can this use ARRAY_SIZE(phys_enc->irq)? Safer that way.

> +               phys_enc->irq[i] = -EINVAL;
>
>         atomic_set(&phys_enc->vblank_refcount, 0);
>         atomic_set(&phys_enc->pending_kickoff_cnt, 0);
