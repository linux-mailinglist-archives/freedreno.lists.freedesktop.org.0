Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 384A770E66C
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 22:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF55610E4C9;
	Tue, 23 May 2023 20:27:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D38F110E4C9
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 20:27:38 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-561c1768bacso1218667b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 13:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684873657; x=1687465657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=P4zhdFMMFweNQjmQzA41UGsWmlCSqKzpzycx7+iVS7A=;
 b=fDtpR5bYRVSCUwJDVAyWboPY+JdRGy0K4KFzM+mm4bi0GIkXlvypRgGdw/mbiKiAd9
 qU++VSmcOgWjna2PlbW606CGM5eAPgaiQrAic6cABd3eMYrSukjFLLG1u6XffjbmwaiM
 /VDfRzNctQWfN8olq6nOJ9eOfCKfAUen2RlfanwaV0T55oxkWMJVGk0mPMNuZB9tAXWh
 BwbjVkeQeA+lNMvG8ShcXRC1uCONL4syOdUrzcJryCWwryQIUJaw10e7dKrQYer3MVFF
 QX7tVj4bilwR2G52phZ6bMXMpXpO+Ur2umF3L7BZi3qngUSMaadzoBuQHWuKvrfpQ024
 65qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684873657; x=1687465657;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P4zhdFMMFweNQjmQzA41UGsWmlCSqKzpzycx7+iVS7A=;
 b=X6ANtSgP6i9Vr1C5cgx74h78ffJ9vun//9UOmeUiltV7aV+iHL5CLoL4QI+FE0c+YA
 lOovwFaZ/3bUOBFX1KCsffAFI6LJntQz6GRAEg7/YHZ884AO7usNWEki6hS5eRf/koSQ
 pHh7iuiJ7XMepSg6HvCGjTuebx/+w+0KGMiBsC3KkmcV7jBhq7PrfLC+KkypDdtC5aCc
 3mzXytG0rIn6uXPxOjPBE486xP41m+gpgBAyeNuBJHAYT4+4SHHoqiZld2Sh2ON4NzSv
 YD8FbSqspZtoRWOBFKAf0Ot2Y38ucoJW/AjUbuVWOszV76ItqgidS/0L5X4oCnVWOQFj
 7TrQ==
X-Gm-Message-State: AC+VfDwXE2qOgWqH8Qi+h1BwdV3Efqpq9U6ci6IcobCtt52VKqjh8ojf
 CNj4ZbD/9OvNRsLNmWjVjMNroKCEHWkkxAq9pRhj6A==
X-Google-Smtp-Source: ACHHUZ5dsaAmJeAPGWQj1PMa6KvCSz/ESzcoCqojES3xKY2lidhpDE6B1Numzio7gc+OYpyBK0255R1DeS0u0zoQyeU=
X-Received: by 2002:a0d:ca0b:0:b0:561:bb2a:5d88 with SMTP id
 m11-20020a0dca0b000000b00561bb2a5d88mr17220176ywd.7.1684873655780; Tue, 23
 May 2023 13:27:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230521172147.4163085-1-dmitry.baryshkov@linaro.org>
 <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
In-Reply-To: <300fc53c-2a58-714c-855a-08a0dbef3ed9@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 23 May 2023 23:27:24 +0300
Message-ID: <CAA8EJprPuwo4z=WoRJOzg2WMWdEkuXwgzoAe6X+Dv_Wgi1X9nQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dpu: drop SSPP register dumpers
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 23 May 2023 at 23:01, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/21/2023 10:21 AM, Dmitry Baryshkov wrote:
> > Drop SSPP-specifig debugfs register dumps in favour of using
> > debugfs/dri/0/kms or devcoredump.
> >
>
> I did see another series which removes src_blk from the catalog (I am
> yet to review that one) . Lets assume that one is fine and this change
> will be going on top of that one right?
>
> The concern I have with this change is that although I do agree that we
> should be in favor of using debugfs/dri/0/kms ( i have used it a few
> times and it works pretty well ), devcoredump does not have the support
> to dump sub-blocks . Something which we should add with priority because
> even with DSC blocks with the separation of enc/ctl blocks we need that
> like I wrote in one of the responses.
>
> So the "len" of the blocks having sub-blocks will be ignored in favor of
> the len of the sub-blocks.
>
> If we remove this without adding that support first, its a loss of debug
> functionality.
>
> Can we retain these blocks and remove dpu_debugfs_create_regset32 in a
> different way?

Let's add subblocks dumping. This sounds like a good idea. I'll take a
look closer to the weekend.

>
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 25 ---------------------
> >   1 file changed, 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > index bfd82c2921af..6c5ebee2f7cd 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> > @@ -727,31 +727,6 @@ int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms,
> >       debugfs_create_xul("features", 0600,
> >                       debugfs_root, (unsigned long *)&hw_pipe->cap->features);
> >
> > -     /* add register dump support */
> > -     dpu_debugfs_create_regset32("src_blk", 0400,
> > -                     debugfs_root,
> > -                     sblk->src_blk.base + cfg->base,
> > -                     sblk->src_blk.len,
> > -                     kms);
> > -
> > -     if (cfg->features & BIT(DPU_SSPP_SCALER_QSEED3) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED3LITE) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED2) ||
> > -                     cfg->features & BIT(DPU_SSPP_SCALER_QSEED4))
> > -             dpu_debugfs_create_regset32("scaler_blk", 0400,
> > -                             debugfs_root,
> > -                             sblk->scaler_blk.base + cfg->base,
> > -                             sblk->scaler_blk.len,
> > -                             kms);
> > -
> > -     if (cfg->features & BIT(DPU_SSPP_CSC) ||
> > -                     cfg->features & BIT(DPU_SSPP_CSC_10BIT))
> > -             dpu_debugfs_create_regset32("csc_blk", 0400,
> > -                             debugfs_root,
> > -                             sblk->csc_blk.base + cfg->base,
> > -                             sblk->csc_blk.len,
> > -                             kms);
> > -
> >       debugfs_create_u32("xin_id",
> >                       0400,
> >                       debugfs_root,



-- 
With best wishes
Dmitry
