Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BBF93349F
	for <lists+freedreno@lfdr.de>; Wed, 17 Jul 2024 01:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F3610E061;
	Tue, 16 Jul 2024 23:43:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="frpqafR+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC59410E064
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 23:42:59 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-65f8b0df1f0so35670297b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 16 Jul 2024 16:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721173378; x=1721778178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bdx0WrTJA3HLe4B/c0rt0W2OYcQp3lvzc1IIRVfiSI0=;
 b=frpqafR+bQkv31KaBH+cZcXhptT8FTffMqY1rxqhKpmmzKnSgG2D8jCi5fT+LB53CA
 LpOwq1K3H7QBqU1OIw0RMvYwrTxO5xn7IFgMPVTVwm2/225tRbjW2EqoSpn9a7oDtptc
 wjvi2jeXhtxwVjFfJ5Gpi8yqxjtTZAhG4Vc4FwkCowowHLaee3ivMwzW2s4SLXUms/3u
 eX4dKDMKztz5+5Y6n+D+QJN995/SA3eRUIlG6MIoNOZMg5uosjAVBL1b5i8skH0cOdRC
 kfZwIEwoYt48Ydvhs3WdRwueNZe9SNAuzhMmTFO/p4gsBbH6G1QMDbeMQ6waFwgVTYOU
 ryJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721173378; x=1721778178;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bdx0WrTJA3HLe4B/c0rt0W2OYcQp3lvzc1IIRVfiSI0=;
 b=TLVoLKn+USMl4afR3KG0EJKDFaqJJ/ym+wEQibqEq8RdmsYg3n48DZzd560FHPPRs4
 DT/6meq/aOJiet4XWp66wEyhNJTnmLWlSz++vcE6ffkV7pw1vfW6dYzUTCVJILY2jZDO
 2eBixtMDrI0Psn+qElILuhr0sDVqS2/HZE0G9Sff4hvIKqS/viI5G1JG2hzoHH/pk9yz
 Z4XhBOnDF4hJ/TD0vbkRbMcvXnqAbi3sUM1j7ydK6rJS/s1e/zOslt1syZRmDm1ai8F6
 x5mFIiJ8l8bq1w4+1e6GnhVInd/24ZMGE0kwcYmMeNKdt8jq0Ihwz3l0DAyfmuJZvy/A
 9bmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2JK0rTUOEVJcC28IFBqsxkDEAUwr9zBYBKHPfwxW4s01NxEexzbBWVvHFwTHQtnsZF4502RR4BTDbUXnpMWxtEuQM8hsayXrkf+57rvYt
X-Gm-Message-State: AOJu0YxnTjDZPZjhy3nGtyASRCMnEuV9xw0F0ksh1QG0KUGIVxxyIIRI
 EV4h1oVkvTDqdrcPp86keL6pHtqHYzTq8SwePsjfAHMJ/9kokQKzjN81mF4j+77zTfVtqekwGey
 9ore8j2y7obS0nc3oDtoGq5eN8FVWHBfj9xghFQ==
X-Google-Smtp-Source: AGHT+IEbqyDEFCrlR4xZQuknxtqbab+UfGCCmomcF2ZpZpJc3MJzA97KvniYAqlPDbzdPnbRG9F/Ih49/ciL+gHMBnE=
X-Received: by 2002:a0d:d387:0:b0:65c:2536:bea2 with SMTP id
 00721157ae682-664fe357ac1mr1641717b3.19.1721173378606; Tue, 16 Jul 2024
 16:42:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240628214848.4075651-1-quic_abhinavk@quicinc.com>
 <20240628214848.4075651-6-quic_abhinavk@quicinc.com>
 <5isw7c5kkef4kql4qcous3gmwhvgwc53ntgjm4staymqr67ktm@iw3cr2gr2iko>
 <CAF6AEGtVBarvEUqgt7SHzYwXUsjY_rVQS6aMsN00G91Dr1aWAQ@mail.gmail.com>
 <cf8d00cd-6dc6-42b9-be61-93ef48d42b0c@quicinc.com>
 <CAF6AEGv2H2FQ4wCWEzgboK0Lz3em-0XkG5pe_HwN1rW2iaGVrw@mail.gmail.com>
 <6460042b-a2cb-41fa-9f6f-fb11e20f69aa@quicinc.com>
 <CAA8EJprmi9zxEipq=0LyBi4nJ59BrLgN1sL+3u7-n9kJ3yQcRg@mail.gmail.com>
 <d7905aa1-67fa-4468-b3ce-69c7aa4ec5e5@quicinc.com>
In-Reply-To: <d7905aa1-67fa-4468-b3ce-69c7aa4ec5e5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Jul 2024 02:42:47 +0300
Message-ID: <CAA8EJprFNXpO568hwNwJvHY_NmcHJxJECe4v3O+ONp17v1Q_iw@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/msm/dpu: rate limit snapshot capture for mmu
 faults
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 17 Jul 2024 at 02:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wro=
te:
>
>
>
> On 7/16/2024 4:10 PM, Dmitry Baryshkov wrote:
> > On Wed, 17 Jul 2024 at 01:43, Abhinav Kumar <quic_abhinavk@quicinc.com>=
 wrote:
> >>
> >>
> >>
> >> On 7/16/2024 2:50 PM, Rob Clark wrote:
> >>> On Tue, Jul 16, 2024 at 2:45=E2=80=AFPM Abhinav Kumar <quic_abhinavk@=
quicinc.com> wrote:
> >>>>
> >>>>
> >>>>
> >>>> On 7/15/2024 12:51 PM, Rob Clark wrote:
> >>>>> On Mon, Jul 1, 2024 at 12:43=E2=80=AFPM Dmitry Baryshkov
> >>>>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>>>
> >>>>>> On Fri, Jun 28, 2024 at 02:48:47PM GMT, Abhinav Kumar wrote:
> >>>>>>> There is no recovery mechanism in place yet to recover from mmu
> >>>>>>> faults for DPU. We can only prevent the faults by making sure the=
re
> >>>>>>> is no misconfiguration.
> >>>>>>>
> >>>>>>> Rate-limit the snapshot capture for mmu faults to once per
> >>>>>>> msm_kms_init_aspace() as that should be sufficient to capture
> >>>>>>> the snapshot for debugging otherwise there will be a lot of
> >>>>>>> dpu snapshots getting captured for the same fault which is
> >>>>>>> redundant and also might affect capturing even one snapshot
> >>>>>>> accurately.
> >>>>>>
> >>>>>> Please squash this into the first patch. There is no need to add c=
ode
> >>>>>> with a known defficiency.
> >>>>>>
> >>>>>> Also, is there a reason why you haven't used <linux/ratelimit.h> ?
> >>>>>
> >>>>> So, in some ways devcoredump is ratelimited by userspace needing to
> >>>>> clear an existing devcore..
> >>>>>
> >>>>
> >>>> Yes, a new devcoredump device will not be created until the previous=
 one
> >>>> is consumed or times out but here I am trying to limit even the DPU
> >>>> snapshot capture because DPU register space is really huge and the r=
ate
> >>>> at which smmu faults occur is quite fast that its causing instabilit=
y
> >>>> while snapshots are being captured.
> >>>>
> >>>>> What I'd suggest would be more useful is to limit the devcores to o=
nce
> >>>>> per atomic update, ie. if display state hasn't changed, maybe an
> >>>>> additional devcore isn't useful
> >>>>>
> >>>>> BR,
> >>>>> -R
> >>>>>
> >>>>
> >>>> By display state change, do you mean like the checks we have in
> >>>> drm_atomic_crtc_needs_modeset()?
> >>>>
> >>>> OR do you mean we need to cache the previous (currently picked up by=
 hw)
> >>>> state and trigger a new devcores if the new state is different by
> >>>> comparing more things?
> >>>>
> >>>> This will help to reduce the snapshots to unique frame updates but I=
 do
> >>>> not think it will reduce the rate enough for the case where DPU did =
not
> >>>> recover from the previous fault.
> >>>
> >>> I was thinking the easy thing, of just resetting the counter in
> >>> msm_atomic_commit_tail().. I suppose we could be clever filter out
> >>> updates that only change scanout address.  Or hash the atomic state
> >>> and only generate devcoredumps for unique states.  But I'm not sure
> >>> how over-complicated we should make this.
> >>>
> >>> BR,
> >>> -R
> >>
> >> Its a good idea actually and I would also like to keep it simple :)
> >>
> >> One question, is it okay to assume that all compositors will only issu=
e
> >> unique commits? Because we are assuming thats the case with resetting
> >> the counter in msm_atomic_commit_tail().
> >
> > The compositors use drm_mode_atomic_ioctl() which allocates a new
> > state each time. It is impossible to re-submit the same
> > drm_atomic_state from userspace.
> >
>
> No, what I meant was, is it okay to assume that a commit is issued only
> when display configuration has changed?

No.

> Like if we get multiple commits for the same frame for some reason,
> thats also spam and this approach will not avoid that.

I'd say, new commit means that userspace thinks that something
changed. So if the driver got another hang / issue / etc, it should
try capturing a new state.

--=20
With best wishes
Dmitry
