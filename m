Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC069EA22A
	for <lists+freedreno@lfdr.de>; Mon,  9 Dec 2024 23:56:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD6410E362;
	Mon,  9 Dec 2024 22:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="phccqaYu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAB110E358
 for <freedreno@lists.freedesktop.org>; Mon,  9 Dec 2024 22:56:02 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e3a0acba5feso2568037276.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Dec 2024 14:56:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733784961; x=1734389761; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zg360WQmWUIYP8x3ZHAPjL5tUINcGUKvmQ6oZ/CIGO4=;
 b=phccqaYui8NXJe+r6Fmzaa+/hWt4SfsZKf0jZCyJ9c5C2UOwfMlN2/T2s5YDMGA9OA
 wSCQBllD9W4krH9BVO7xQge7iium73K+9CgLSwup80m4tXjTJ7EkLH3Iogzd0JnqWtkJ
 SVoV5TCRHjf2JhHDti8S8bt3fNIP+eXYT/p1sgJP1wcNPZYXi7ID4vUszdY6D3JblTR9
 MeNL+2tpx9Ka0OSqfYbDvJnXiPhWih6D/G2L2XCbEo0rEa0iXVuCg20b1FN6mSiBLAN6
 IgK3LSteBdzp4gdGJsnGNsVoqYzDkXTFIBCxZ8KJ8YwllArTcAKKECEAqFr1qTiAksKs
 aAEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733784961; x=1734389761;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zg360WQmWUIYP8x3ZHAPjL5tUINcGUKvmQ6oZ/CIGO4=;
 b=LrrOi5mwxd9cUt+YEvgp7vSTAaPXGEru9ePEiKPLs2OloJVWdC2uY3+vY28WTAAG3k
 gE9NO825orMzTKHNn/G4JChSC7EUP3oipqy2bqwYcId0KsmiZdolCCqDFEhaZ1Q3cSCs
 NoddcsScbyVtGo7Th5xE1WT3bsifnKzbhfYXk5Y8+Ams4HP7MuCyrL88YSKAUTCa8+36
 0fLqundlLn4V5WySF0dWd605dBkGUthSErXrP91HfVC3ePDpyGLcXVjaxsXomp9Ft5qE
 24sg9eQVZdObNkBD/zBrQfmdz+T2RIVRviFuHVwefA+DZURo+bRXvnFW0ozNmYghEz1G
 bPjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtLt1LndcJO0mmQy1yOxXPaPkoGWGNOdXdvwnj6Im/qju9LJvRbTYnvUrPo9MH2fTPB0ri0r6NtGE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMHfejv72SmCZJfyi4TTHHEqEmKFnYy3dX/WNbSjSOG/u7n6Kc
 87+BthW2awceHX/HgaZwSEPA8t951nOZ/SjhawiQT2DZg2X5ylkReR6+D1+OKOyH/de1VsWumVM
 l4jzRLH7oiYAiH5PPQRcES3Smcj1kqDycreAG3A==
X-Gm-Gg: ASbGncsD7Zk3NW046CpWaMTyvOg338Mjz4d54lSoYYccuBZ8ZIYPFOwvhqEVUPfvqBh
 L6IvtpP1O4C8pwF1Lrv5Z/JXu+w6Dcj9JtBY=
X-Google-Smtp-Source: AGHT+IGBS529CP3nkBRL/hSBck7KZQ3bTAxMxZelGrotzUE4fm9stmMtccbFjnXYDNdhGC2bqHRBAtW7fsN53rpNuQ8=
X-Received: by 2002:a05:6902:288f:b0:e39:7b55:ff7d with SMTP id
 3f1490d57ef6-e3a59bde21fmr2097243276.49.1733784961163; Mon, 09 Dec 2024
 14:56:01 -0800 (PST)
MIME-Version: 1.0
References: <20241206-no_3dmux-v1-1-72ad2677a323@quicinc.com>
 <zae7rlojv5iiq2dx7bxhdsmmzj73o65cwk7kmryxsst36gy2of@k3vcm6omcias>
 <b784049f-a72c-47ff-a618-e7c85c132d28@quicinc.com>
 <CAA8EJpojwG+_Q_9GYBFzQ_ReDbnO=+GbTPZscWgS1f=fkU0Anw@mail.gmail.com>
 <ab8a9d0e-e786-47ea-833d-59d2f2988898@quicinc.com>
In-Reply-To: <ab8a9d0e-e786-47ea-833d-59d2f2988898@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 10 Dec 2024 00:55:50 +0200
Message-ID: <CAA8EJpoNSJ64+JWsmrdFVce-ADtjDhZzEjC2ZcJbqvfQ47F-_A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: filter out too wide modes if no 3dmux is
 present
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
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

Hi Abhinav,

On Tue, 10 Dec 2024 at 00:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> Hi Dmitry
>
> On 12/9/2024 2:16 PM, Dmitry Baryshkov wrote:
> > Hi Abhinav,
> >
> > On Mon, 9 Dec 2024 at 22:07, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 12/7/2024 9:29 PM, Dmitry Baryshkov wrote:
> >>> On Fri, Dec 06, 2024 at 12:00:53PM -0800, Abhinav Kumar wrote:
> >>>> On chipsets such as QCS615, there is no 3dmux present. In such
> >>>> a case, a layer exceeding the max_mixer_width cannot be split,
> >>>> hence cannot be supported.
> >>>>
> >>>> Filter out the modes which exceed the max_mixer_width when there
> >>>> is no 3dmux present. Also, add a check in the dpu_crtc_atomic_check()
> >>>> to return failure for such modes.
> >>>>
> >>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>> ---
> >>>> Note: this was only compile tested, so its pending validation on QCS615
> >>>> ---
> >>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 13 +++++++++++++
> >>>>    1 file changed, 13 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>> index 9f6ffd344693ecfb633095772a31ada5613345dc..e6e5540aae83be7c20d8ae29115b8fdd42056e55 100644
> >>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> >>>> @@ -732,6 +732,13 @@ static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
> >>>>       struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>>>       int i;
> >>>>
> >>>> +    /* if we cannot merge 2 LMs (no 3d mux) better to fail earlier
> >>>> +     * before even checking the width after the split
> >>>> +     */
> >>>> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >>>> +        && adj_mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >>>> +            return -E2BIG;
> >>>
> >>> Is it the same as checking that there are LMs which support
> >>> DPU_MIXER_SOURCESPLIT ?
> >>>
> >>
> >> DPU_MIXER_SOURCESPLIT tells whether we can have more than one SSPP in
> >> the same blend stage.
> >
> > Do we have a feature bit that corresponds to the ability to use 2 LMs?
> > I mean, there are other *split topologies, not necessarily the 3DMux
> > ones. E.g. PPSPLIT.
> >
>
> A layer can always be split across LMs. There is not really any feature
> bit for this as it can always be done in pretty much all DPU chipsets.
>
> Here the issue is we are not able to merge because there are no 3d mux
> blocks and hence we cannot split.
>
> We need to merge because, the same display is requiring multiple LMs.
>
> PP split will be a single LM going to two PPs and that going to two INTFs.
>
> Hence the way to look at this patch would be we are avoiding split
> because we cannot merge and not that we cannot split.

Ack, thanks a lot for the explanation!

>
> >>
> >> 494     if (test_bit(DPU_MIXER_SOURCESPLIT,
> >> 495             &ctx->mixer_hw_caps->features))
> >> 496             pipes_per_stage = PIPES_PER_STAGE;
> >> 497     else
> >> 498             pipes_per_stage = 1;
> >>
> >> That is different from this one. Here we are checking if we can actually
> >> blend two LM outputs using the 3dmux (so its post blend).
> >>
> >>>> +
> >>>>       for (i = 0; i < cstate->num_mixers; i++) {
> >>>>               struct drm_rect *r = &cstate->lm_bounds[i];
> >>>>               r->x1 = crtc_split_width * i;
> >>>> @@ -1251,6 +1258,12 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> >>>>    {
> >>>>       struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >>>>
> >>>> +    /* if there is no 3d_mux block we cannot merge LMs so we cannot
> >>>> +     * split the large layer into 2 LMs, filter out such modes
> >>>> +     */
> >>>> +    if (!dpu_kms->catalog->caps->has_3d_merge
> >>>> +        && mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> >>>> +            return MODE_BAD;
> >>>
> >>> This can be more specific, like MODE_BAD_HVALUE.
> >>>
> >>
> >> Yes for sure, will fix this up.
> >>
> >>>>       /*
> >>>>        * max crtc width is equal to the max mixer width * 2 and max height is 4K
> >>>>        */
> >>>>
> >>>> ---
> >>>> base-commit: af2ea8ab7a546b430726183458da0a173d331272
> >>>> change-id: 20241206-no_3dmux-521a55ea0669
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>
> >>>
> >
> >
> >



-- 
With best wishes
Dmitry
