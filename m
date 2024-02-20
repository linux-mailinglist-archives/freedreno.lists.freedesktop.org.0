Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D685CBC7
	for <lists+freedreno@lfdr.de>; Wed, 21 Feb 2024 00:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A70510E5B2;
	Tue, 20 Feb 2024 23:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="p3SVZZYl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5037810E5B0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 23:08:09 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-607eefeea90so45440307b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 15:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708470488; x=1709075288; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JMa4Xpq2gA3A1LeF8lVok8xN9ReJjb3LesYcCiypUgg=;
 b=p3SVZZYlieQWKwEyixRHnOre81LdjlHP1ggVOnfvzeIbks2L9GYBtAjKGFFISK4bYA
 aqAAARgBkeFho8sf6tvRHcKV18IXFtwArtL33srPCjlk7dip+1zG8MYE+F6ET0DqXoZb
 2/FFjV72PV/aQXZbKLgS066csIbdcygoXVfw8oPnzEbYHG32mqEFAaA7ApCFeUYm6dMC
 vtvTsUjicAa8j1OEM8kBiwkyenCT/0TDEGzsqXatZB50O33uoFxXfId9kjnoNq1foagx
 8i68zSF0khE1hl98z0y5S9Fr1880PSr+sN4aDHy5gaXAeQ2K/3dqJ1QMmgTitZFl2zsT
 YlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708470488; x=1709075288;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JMa4Xpq2gA3A1LeF8lVok8xN9ReJjb3LesYcCiypUgg=;
 b=YyTcpbUG00gmZSlU5o6lo9NnELG/o45jQD9ge5F4SXcEqSotXEJQ7CpOKNEKypI43c
 gNXvM3yCadahJzmelC+PnFIOz6fnfE/rdoVxKcABiAHjd0aLNdyfaYe4HhkgjlSgTVs/
 arky3TYnscfA8WJjVRrsEXgMwvPgV/cNyb9bcUZRuPNO1F26tL8JaGS1oYDl8JOB109u
 co0o3WtodOSSR2T5PIqvaJYOOGFBwlz1PnD9sdCzao2TVHs/mdhhuH8mHL1cC+Do4RJZ
 tyYsTvpGSv0h3mOAr8+0afZateAsTDPooEhiDD3NrGkrIjmUkGr8qY7YtNfc2l4P4P4x
 h3Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzZzgsGRWXF6rZiPrN4Dljtdvyi/QSpRrHpsz2f3GZ2qJAjvkS4IJ1XfELMxDONrirjuzwb6c6OkCN/6LCUaESI5PsEDB4bQS+yxPYpiaF
X-Gm-Message-State: AOJu0YyP3dtwckropbf1Dxdr9HBFmckqx37n8NF6outfPqealTko97vN
 Ye2cwyOuIT6D+57WIdRuf7Ca7wInY64SGkjgYskTAMD8kRtulqiSrSm85DudsDELRNVKRkfpOxy
 ufh1YhWF6cX7J++wu2q9SeuuGmMDci4TzTJZaxw==
X-Google-Smtp-Source: AGHT+IG3a3isXkLnhLjbaA3WAfu3COn5KIElhpETaOROfN3a/zrBXCsfeHPjiW3NbxHm8CHzA7JRzyjBs0Q6pVYoj00=
X-Received: by 2002:a0d:d514:0:b0:607:cc6a:e1e5 with SMTP id
 x20-20020a0dd514000000b00607cc6ae1e5mr11574717ywd.2.1708470488239; Tue, 20
 Feb 2024 15:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20240208-fd-dpu-debug-timeout-v2-1-9f907f1bdd87@linaro.org>
 <1cb90bff-ce5b-c6d1-a3df-24f6306f833a@quicinc.com>
 <CAA8EJpotiHKT_NYphDs0-vhpvsybgTW281XDYbteUx8qOX=v4g@mail.gmail.com>
 <63bba15b-6d8d-5ba8-d99d-8cd2dd763262@quicinc.com>
 <CAA8EJpqHmVBry9FyJ6HRB+qdVcVNN3Q7rHZz1daZL1Sz6yeZ=A@mail.gmail.com>
 <69d152d2-6a25-9ff4-ce6b-c4790247a661@quicinc.com>
 <CAA8EJpo3XynBrm0S_BA_SxGOw963WQT9jh=YvLcT1N24FyEUsw@mail.gmail.com>
 <09928fb7-c5c3-7a36-1ce2-9f4012507d06@quicinc.com>
In-Reply-To: <09928fb7-c5c3-7a36-1ce2-9f4012507d06@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 21 Feb 2024 01:07:56 +0200
Message-ID: <CAA8EJpqEE2QjN5K=_FmUPRNGcXCnCcumJeJ6ShKbT3WHYaUp-g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: make "vblank timeout" more useful
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

On Wed, 21 Feb 2024 at 01:04, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/20/2024 2:42 PM, Dmitry Baryshkov wrote:
> > On Wed, 21 Feb 2024 at 00:40, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 2/19/2024 3:52 AM, Dmitry Baryshkov wrote:
> >>> On Wed, 14 Feb 2024 at 22:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 2/14/2024 11:20 AM, Dmitry Baryshkov wrote:
> >>>>> On Wed, 14 Feb 2024 at 20:02, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> On 2/8/2024 6:50 AM, Dmitry Baryshkov wrote:
> >>>>>>> We have several reports of vblank timeout messages. However after some
> >>>>>>> debugging it was found that there might be different causes to that.
> >>>>>>> To allow us to identify the DPU block that gets stuck, include the
> >>>>>>> actual CTL_FLUSH value into the timeout message and trigger the devcore
> >>>>>>> snapshot capture.
> >>>>>>>
> >>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>>> ---
> >>>>>>> Changes in v2:
> >>>>>>> - Added a call to msm_disp_snapshot_state() to trigger devcore dump
> >>>>>>>       (Abhinav)
> >>>>>>> - Link to v1: https://lore.kernel.org/r/20240106-fd-dpu-debug-timeout-v1-1-6d9762884641@linaro.org
> >>>>>>> ---
> >>>>>>>      drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 3 ++-
> >>>>>>>      1 file changed, 2 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>>>> index d0f56c5c4cce..a8d6165b3c0a 100644
> >>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> >>>>>>> @@ -489,7 +489,8 @@ static int dpu_encoder_phys_vid_wait_for_commit_done(
> >>>>>>>                  (hw_ctl->ops.get_flush_register(hw_ctl) == 0),
> >>>>>>>                  msecs_to_jiffies(50));
> >>>>>>>          if (ret <= 0) {
> >>>>>>> -             DPU_ERROR("vblank timeout\n");
> >>>>>>> +             DPU_ERROR("vblank timeout: %x\n", hw_ctl->ops.get_flush_register(hw_ctl));
> >>>>>>> +             msm_disp_snapshot_state(phys_enc->parent->dev);
> >>>>>>
> >>>>>>
> >>>>>> There is no rate limiting in this piece of code unfortunately. So this
> >>>>>> will flood the number of snapshots.
> >>>>>
> >>>>> Well... Yes and no. The devcoredump will destroy other snapshots if
> >>>>> there is a pending one. So only the console will be flooded and only
> >>>>> in case when MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE is enabled.
> >>>>>
> >>>>
> >>>> Yes, true but at the same time this makes it hard to capture a good dump
> >>>> as potentially every vblank you could timeout so this destroy/create
> >>>> cycle wont end.
> >>>
> >>> Excuse me, maybe I miss something. On the first timeout the snapshot
> >>> is created. It is held by the kernel until it is fully read out from
> >>> the userspace. Other snapshots will not interfere with this snapshot.
> >>>
> >>
> >> For every new snapshot a new devcoredump device will be created which
> >> should remain till it has been read. But now this will be created every
> >> blank. IMO, this is really too much data for no reason.
> >
> > No-no-no. If there is a devcoredump for a device, the next one will
> > not be created. See dev_coredumpm().
> > So all the snapshots will be created and then destroyed immediately.
> >
>
> hmm ... I have certainly seen devcd_count go higher than one (but not
> more than 2). I am wondering whether this was because of some race
> condition of the previous destroy / new create.
>
> But anyway, this part is clear now. thanks.
>
> >>
> >> Subsequent vblank timeouts are not going to give any new information
> >> compared to the existing snapshot of the first vblank timeout thats why
> >> we should just create the snapshot when the first error happens and stop.
> >>
> >> For other frame done timeouts, infact subsequent timeouts without any
> >> sort of recovery in between are quite misleading because hardware was
> >> already not able to fetch the previous frame so it will most likely not
> >> fetch the next one either till it has recovered. Typically thats why
> >> these vblank timeouts happen in a flurry as the hardware never really
> >> recovered from the first timeout.
> >>
> >>> Or are you worried that snapshotting takes time, so taking a snapshot
> >>> will also interfere with the vblank timings for the next vblank?
> >>>
> >>
> >> Yes this is another point.
> >
>
> snapshots will still be captured every vblank timeout and reading
> through the entire DPU reg space every vblank timeout is certainly
> something we can avoid.

Ack.

-- 
With best wishes
Dmitry
