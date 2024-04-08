Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB6E89BB24
	for <lists+freedreno@lfdr.de>; Mon,  8 Apr 2024 11:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE7F112310;
	Mon,  8 Apr 2024 09:03:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F8cv0kAE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7F71120C8
 for <freedreno@lists.freedesktop.org>; Mon,  8 Apr 2024 09:03:16 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id
 3f1490d57ef6-dbed179f0faso3743802276.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Apr 2024 02:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712566995; x=1713171795; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=aCQgRHW7r77MxQqZTezP2GVYmRv+i8mKc4OgUigdufA=;
 b=F8cv0kAEf96gSGdbdUdXsW6Tx59e99IoaL6zJLPt11QS7wSQMI+fBteDLbz3blvMPX
 bfVU4BXDD9zMKy9eahRH6zbtuhrCW4Fli+THujAxm3SJVawrVjjaGQkBY69tlc+Ztzc+
 qj+Pstw0oMa12yrclcimgqB7BUwfvdcCng7DPa2ZCzWvqSHTsbJZh0+l3RYhrXK08g4S
 gOyRDdR5h3NtnlPwyLgB+cBjH2JjklmsYX0cIFAakWEn1xNx0s0BYez45HFj3OqsrSJB
 Ywl08l27vSeM6gLb0sEu0sRf0pGZeTSlUfcxNZRQAl1SdW3vTP3WLJP3oUXcM7ft49Lc
 CdEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712566995; x=1713171795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aCQgRHW7r77MxQqZTezP2GVYmRv+i8mKc4OgUigdufA=;
 b=pQa+c5/AC0rWn5TMAinWvx84pTswfX+XMHBTKpvGSlMNWU0hByxyg3gu5WP/YakVY4
 XCEXQ6IyCH5WlWpQNNFeeAXiDn8AOm4wSBGvrKvLT+6c8PNR67LFKYpKiXoTXOv8JEBF
 6ISZASCtqZYcVmhTlvM2/pCxYlX8phpl6xunMulkNaZuFw1Z8ATg5UyXstLlviQI2V9B
 25WgGtqSe0iiqt0G8ipUpAqDwngej7BScXOf//15naKQ2DgwRffd/2iUj4Fe8ZkzyNvb
 iCA2SAKwyvDunSw5xbcGR4in41VyMKP52vsOKsuFElr//JctKTneiV3gNms1x+jQXeaR
 cYOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNFvNggY4p77mY1gY2rgupbicn7Wmposy6VOJS5XvirzRNkuwjO6VGKD0macwWuMvoOy2K7c4I5ZO5pewvX6tSuhX9ya18PEbz6RPoaXPm
X-Gm-Message-State: AOJu0Yyncebe2WecuaSjGs/0KhhejkhtHlAnHQg9kVyWCnpk6fcCtFWp
 qNBJfLBiYjMJlW+REO7lZ6nw0qQkxmsg0tWYuugYjoDasPoMXthfDl9eQT5fZ0LfnNGTfBSDDRh
 gfasmvuCpueWyF+rVCCICeOxdqIms+uYUfD0Vzw==
X-Google-Smtp-Source: AGHT+IFZJ9m4KwrMQclgS3pdMGserVsWA/uepMAkYkmTnJlObRmstHDdU51+G69xsZ5HR/xHo/fjR/LGWzIt8jOomIE=
X-Received: by 2002:a25:6ec3:0:b0:dc6:d258:c694 with SMTP id
 j186-20020a256ec3000000b00dc6d258c694mr5932139ybc.19.1712566995186; Mon, 08
 Apr 2024 02:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240408085523.12231-1-amishin@t-argos.ru>
In-Reply-To: <20240408085523.12231-1-amishin@t-argos.ru>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 8 Apr 2024 12:03:04 +0300
Message-ID: <CAA8EJppTM4tpsFaZKupPe=0Oc9qDp7dBqHyHGP4E5bTHKT=hSw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add callback function pointer check before
 its call
To: Aleksandr Mishin <amishin@t-argos.ru>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 8 Apr 2024 at 11:57, Aleksandr Mishin <amishin@t-argos.ru> wrote:
>
> In dpu_core_irq_callback_handler() callback function pointer is compared to NULL,
> but then callback function is unconditionally called by this pointer.
> Fix this bug by adding conditional return.
>
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

This should be converted to a proper Reported-by: trailer.

>
> Fixes: c929ac60b3ed ("drm/msm/dpu: allow just single IRQ callback")
> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 946dd0135dff..03a16fbd4c99 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -223,9 +223,11 @@ static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, unsigned int
>
>         VERB("IRQ=[%d, %d]\n", DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
>
> -       if (!irq_entry->cb)
> +       if (!irq_entry->cb) {
>                 DRM_ERROR("no registered cb, IRQ=[%d, %d]\n",
>                           DPU_IRQ_REG(irq_idx), DPU_IRQ_BIT(irq_idx));
> +               return;
> +       }
>
>         atomic_inc(&irq_entry->count);
>
> --
> 2.30.2
>
>


-- 
With best wishes
Dmitry
