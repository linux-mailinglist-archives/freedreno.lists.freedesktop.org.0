Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2372E862CF2
	for <lists+freedreno@lfdr.de>; Sun, 25 Feb 2024 21:58:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B45A10E3C7;
	Sun, 25 Feb 2024 20:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kJgYKmzy";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD5510E3C7
 for <freedreno@lists.freedesktop.org>; Sun, 25 Feb 2024 20:58:10 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3c1a1e1e539so321729b6e.1
 for <freedreno@lists.freedesktop.org>; Sun, 25 Feb 2024 12:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708894690; x=1709499490; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qysAaItgkYAq3SwTLN3VU8RMWCs5RzMALqFImfrNUHc=;
 b=kJgYKmzyKKUQe20ftpqUwxvb8h8U/A9mNefIv72aa7MYwGDSM3gb9oVsIMNxNICzUl
 Dx4W2pTYQg02B51NQOaQSB4RUNJ+CIDqAG1kvsyg8sg3GfR47raOYn1miPE36+sEU8zu
 z2t3zQQh1V+PNJZHZOgm4J5XZt9G0XRdkCjhdTCt7wk10FGJN1s8N8xzqJ3cGkLbHooS
 gioukAwByDniWADOh28nQDBAhjlj8GttSCtR/kGy7MfKZHBLvcCL4kySYEROQh156peN
 KKc5b0YyKg++S/WQV0y58rU3y7PUQ+AWsGqKovbtsU+nAZ9k89EWc+TKWlxNBohhFCKH
 d7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708894690; x=1709499490;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qysAaItgkYAq3SwTLN3VU8RMWCs5RzMALqFImfrNUHc=;
 b=jChlq06q7Smu8u5J+dxt+yxdmfbPOgjdCe16eK1pM8++GJ8a/1l2EVJHof1XZC6TBf
 TMbxPSfZIEp7J4SIkLLg6eh1S/AWj3pVsoBnAr/XXY2fDluDGf6Whe3LxNEyS00tJTEv
 oOQfzNO/tZTl5wdBgqSoPIlrsrM3eA/ma1BPYAyJo8ktKDcbofpfCnlq2PcvJAjlDcJk
 c5QRLsDTbC24fHIom6q/pmF343gwyHRC9crkLHsnrw30z6xXyvTc3ECKWVk97xsgi9Ys
 GcWM7BfSm49ocnzRmQuzM3GwaDkf697Qhcv/LiD7NhShZQuzpMX1IqY/R08oe8HElipm
 vIbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXirpq1bUScsublVGyQkjPuCh3b0I2sOrdOn+/FPy0oeVlET9JqK6WiUD4CwO/l9t2GSQdKntRkPs9q92dPWpCjIRxTcNuvAUWTxZ/DtaaI
X-Gm-Message-State: AOJu0Ywrf3d4tk+qco3a5ZOvM2rFaYFcEP5VOdl5kitH7UP5nP9ms6ej
 S7mF9Jm3ViAuD3/oTHoxEHPBQWYoAAKUsEZ+JT+iJfj0ZTMtwGiWzXSfarncij16nFOkL4LR4pR
 n7gCaeUfYr3vspVrq/afJf24nKLp0bp2ZbqBbjg==
X-Google-Smtp-Source: AGHT+IGLGLisc5bGf0HFG5iW6DFVysNuOika0kCxYs9Y52QBjZwPvU+tzTIDfoHJBRVgLI2wQUZxeL5lNMXPdzykdcM=
X-Received: by 2002:a05:6808:394a:b0:3c1:862d:7e2e with SMTP id
 en10-20020a056808394a00b003c1862d7e2emr6525742oib.50.1708894690053; Sun, 25
 Feb 2024 12:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
 <20240225-fd-dpu-debug-timeout-v3-1-252f2b21cdcc@linaro.org>
 <4e6b41f4-27a6-4c65-dc03-67437a9716ed@quicinc.com>
In-Reply-To: <4e6b41f4-27a6-4c65-dc03-67437a9716ed@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 25 Feb 2024 22:57:58 +0200
Message-ID: <CAA8EJppNfdDsrMQA3cUR18b2so2qaw1fcFNMz0fW9rMSzFrysg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Steev Klimaszewski <steev@kali.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Sun, 25 Feb 2024 at 21:44, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/25/2024 6:12 AM, Dmitry Baryshkov wrote:
> > We have several reports of vblank timeout messages. However after some
> > debugging it was found that there might be different causes to that.
> > To allow us to identify the DPU block that gets stuck, include the
> > actual CTL_FLUSH value into the timeout message.
> >
>
> the flush register shall also be part of the coredump in patch 3. so why
> is this needed?

I'd prefer to keep it. The devcoredump captures all registers, while
CTL_FLUSH points to the actual bit without the need to analyze the
coredump. At the very least, it allows us to analyze whether the issue
is the same or not (compare SSPP_DMA2 on c630 vs LM_1 on sdm660)
without looking into the dump.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > index 2aa72b578764..6058706f03e4 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> > @@ -480,7 +480,7 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >               (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >               msecs_to_jiffies(50));
> >       if (ret <= 0) {
> > -             DPU_ERROR("vblank timeout\n");
> > +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> >               return -ETIMEDOUT;
> >       }
> >
> >



-- 
With best wishes
Dmitry
