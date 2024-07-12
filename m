Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9281393024E
	for <lists+freedreno@lfdr.de>; Sat, 13 Jul 2024 01:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BD910EC45;
	Fri, 12 Jul 2024 23:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xcsZWVea";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E2E810EC45
 for <freedreno@lists.freedesktop.org>; Fri, 12 Jul 2024 23:11:37 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-643efaf0786so24298827b3.1
 for <freedreno@lists.freedesktop.org>; Fri, 12 Jul 2024 16:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720825896; x=1721430696; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=6nIWauyc2Pyvv09dQTByut0YHfXkae1P+Bg8WYz5fXo=;
 b=xcsZWVeaK6WX7xZ4CGPmPMLLiJ/uB2SscuvFENQEG3wLv29lh2iJIKs7nHWcrneoAC
 IPIjmQJ1h1SqWnML6PlWlG82E6c+UeExEA7IaXnUmnXjObF1mvr7PGwTRKdpSGpeakzt
 8mOVYa5ZnWfSnVuL2RpIqP4BmH3DiluVoLsNzfDL1w8XeAmikSe4D+F66lh7/Bk3Mqs1
 Gq9FqIwDnJ0GFliQP/vfDNWCxh8SHuP/yladpI8LoxAwj+I2s9rYe0YQUrB1QXhERXGi
 Fn52pobQnz85tOqYUrF3sME7TfuIVc1wXFPtPuEBwWC+1v+wWv0AcwuXAr8ghSbzFfnD
 SDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720825896; x=1721430696;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6nIWauyc2Pyvv09dQTByut0YHfXkae1P+Bg8WYz5fXo=;
 b=Xi63yYZTiGEcpuK77ps+yNNUEPX8MbGScT/vsNlQ8sSmPkOzDJ5yLnLgQUzTSJfpe+
 LO8jUILlKFz1qJZ3zfwDmvxw3hWzYIjgE8d40b1L0XzFA9+4p8JImwjTzX1iRBX2Gz9X
 IH2dNymYXL2w4izQgEXy3D7yHO8AgDH9o/98UJfoZ/XkPs7vHQlWYaQF5goipsY4Qxf6
 YpYQGXDXokcf2tjSAKQQMIgUih8h+zvGfGha1s8eb0gGcIzcSJ6zc+GWedS+vYqFYpXc
 V4+/d87Lvv2EJml0uVsNYaBN40LJzEWi4MWnVbGemAfu8ULCfWSwFUrFTOeO84p8F2nC
 C+3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqBH9yu7AEZ61BNJemu9UhjyZxMjbSpkKijW+FG/NEOq7TRXrEAov6D0MOWUkHGaX16yUJvnke2rEP7eKbTwcPRw7k9J+M+U8qEVOFkVNs
X-Gm-Message-State: AOJu0Yy+G6/gocHjMEeK6wpI9dslUWVBG8Ai6cn+Imj3MSqU5YV3r3ZP
 t1T44LWeOhAu5zBUUj45mNTHbsq/tM3RSEfqZFuV0gGFep53F3oVyqbtdulb7heulYUVV4fAoIx
 rdkx7HxKpwu4iHxPthjSqak7KCrJLtY9GRr9vyw==
X-Google-Smtp-Source: AGHT+IE9KewbbtZ33pRFXKbNTTrznOJsyNetwGPb0x8rJ7HSyLluQ2O/SNwbXNQutrGuY8h078Oh1Z1VgqhfFvsdfh0=
X-Received: by 2002:a0d:f981:0:b0:64a:f40d:5fd2 with SMTP id
 00721157ae682-658eed5debcmr137636897b3.12.1720825896057; Fri, 12 Jul 2024
 16:11:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
 <20240625-dpu-mode-config-width-v5-2-501d984d634f@linaro.org>
 <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com>
In-Reply-To: <637fbd36-d6cd-4bb7-af83-8849c0fee8f2@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 13 Jul 2024 02:11:24 +0300
Message-ID: <CAA8EJppxyUrEWYQvMGtw14UVobkQdaPZuwHPeMcONRYrgPp2jw@mail.gmail.com>
Subject: Re: [PATCH v5 02/16] drm/msm/dpu: fix error condition in
 dpu_encoder_virt_atomic_mode_set
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 12 Jul 2024 at 22:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> On 6/24/2024 2:13 PM, Dmitry Baryshkov wrote:
> > The commit b954fa6baaca ("drm/msm/dpu: Refactor rm iterator") removed
> > zero-init of the hw_ctl array, but didn't change the error condition,
> > that checked for hw_ctl[i] being NULL. Use indices check instead.
> >
> > Fixes: b954fa6baaca ("drm/msm/dpu: Refactor rm iterator")
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 5d205e09cf45..7613005fbfea 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1186,7 +1186,7 @@ static void :tag(struct drm_encoder *drm_enc,
> >                       return;
> >               }
> >
> > -             if (!hw_ctl[i]) {
> > +             if (i >= num_ctl) {
>
> This is not very clear to me.
>
> How will we hit this condition? I dont see i going beyond 1 in this loop
> and neither should num_ctl

Why? the driver doesn't support flushing through a single CTL, so
num_ctl = num_intf.

>
> Will it be just easier to bring back the NULL assignment at the top?
>
> struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC] = { NULL };
>
> I also see the same issue for other blocks such as hw_dsc, hw_lm

Other blocks loop properly up to the num_resource. I'd prefer to drop
the NULL init from the DSPP init and use num_dspp instead.

>
> >                       DPU_ERROR_ENC(dpu_enc,
> >                               "no ctl block assigned at idx: %d\n", i);
> >                       return;
> >



-- 
With best wishes
Dmitry
