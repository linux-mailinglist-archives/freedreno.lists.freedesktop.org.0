Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A09517862
	for <lists+freedreno@lfdr.de>; Mon,  2 May 2022 22:42:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C874510EAD2;
	Mon,  2 May 2022 20:42:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF11310E962
 for <freedreno@lists.freedesktop.org>; Mon,  2 May 2022 20:42:28 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-ed9ac77cbbso4831139fac.1
 for <freedreno@lists.freedesktop.org>; Mon, 02 May 2022 13:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ESpzyDqu8mnBm9LDtK8B5iICXfFMCWHMbvYXNK4D6ws=;
 b=CHoiCdCU1i8vWiRKm0fwWD99JiWNrErUMwha0a5VBppTDfBnUn2/opeuaRT1wE2RaS
 rSm/E1G6cgHlFacYHPjeuMbR5jcDr6+0jG1f2Dct3f1cS5/6TuefgaMl5w8Nt2XOSyye
 u+AsxKM/XZ9HWjJWyBEFDuWz8i/KQC2Pf44XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ESpzyDqu8mnBm9LDtK8B5iICXfFMCWHMbvYXNK4D6ws=;
 b=obtzlim1A1uh4/ce0xDZAuoSgH4xP1ITso+vxnG9hm/BdX3vLKfxHQ78ZmBiwPI2cz
 jfPG1qKqMGd/UqeJ+SeRCNmVkydgctss6EvK8BYiv3EHd22V2vrCM9ttpV2ahXQzxeMK
 qvylY23kYBnaXDJ/H4ZR4iKJrYg4GfYZRNzuisW27l38NJdqRwibGoGWKdZLCJx8SyI3
 tXzkiWqi9+CRIX8DVzCsEFp05gLPlNSxSvCPuubdOiQ+bUNQkwbCZ3TVafx1+EDsOejY
 CcqRr1ncNc7vb1JbVCJDKgmwU4b/XupM5tb16SdGGaBmm3lsQcEaEFug0bclIgP/ENT3
 TGcw==
X-Gm-Message-State: AOAM531ENaNijBmparA217DAM8t97m17n1G0lBM4TG09SAKp2QBbDjze
 P2UTbdafHRMzXX6pIfUvEo4RgyQLHAW+ZUDSiKeg/Q==
X-Google-Smtp-Source: ABdhPJyfSz0qIavKIY7/72y/6OLLmP5StcipFMQ6UuHm8uHovKIYZYl28pB2+rrNQkm8Rj+XIbcgGj4UB8blHvbLc3w=
X-Received: by 2002:a05:6870:558e:b0:e1:db7c:26aa with SMTP id
 n14-20020a056870558e00b000e1db7c26aamr441978oao.63.1651524148228; Mon, 02 May
 2022 13:42:28 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 May 2022 13:42:27 -0700
MIME-Version: 1.0
In-Reply-To: <1651509846-4842-1-git-send-email-quic_vpolimer@quicinc.com>
References: <1651509846-4842-1-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 2 May 2022 13:42:27 -0700
Message-ID: <CAE-0n517_5ZxGXMYrW7xGTOdKBhEnhEc9U1SN=cZP7CKCrdVhA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/disp/dpu1: avoid clearing hw
 interrupts if hw_intr is null during drm uninit
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org,
 linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com, robdclark@gmail.com,
 dmitry.baryshkov@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-05-02 09:44:06)
> If edp modeset init is failed due to panel being not ready and
> probe defers during drm bind, avoid clearing irqs and derefernce

s/derefernce/dereference/

> hw_intr when hw_intr is null.
>
> BUG: Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
>
> Call trace:
>  dpu_core_irq_uninstall+0x50/0xb0
>  dpu_irq_uninstall+0x18/0x24
>  msm_drm_uninit+0xd8/0x16c
>  msm_drm_bind+0x580/0x5fc
>  try_to_bring_up_master+0x168/0x1c0
>  __component_add+0xb4/0x178
>  component_add+0x1c/0x28
>  dp_display_probe+0x38c/0x400
>  platform_probe+0xb0/0xd0
>  really_probe+0xcc/0x2c8
>  __driver_probe_device+0xbc/0xe8
>  driver_probe_device+0x48/0xf0
>  __device_attach_driver+0xa0/0xc8
>  bus_for_each_drv+0x8c/0xd8
>  __device_attach+0xc4/0x150
>  device_initial_probe+0x1c/0x28
>
> Changes in V2:
> - Update commit message and coreect fixes tag.
>
> Fixes: f25f656608e3 ("drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
