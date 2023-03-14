Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F096B9CF0
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 18:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E24F10E1A7;
	Tue, 14 Mar 2023 17:24:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37A8610E1A8
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 17:23:59 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-5416698e889so197209967b3.2
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678814638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lt10PpjJqJ0ufR48VoDC3ODoiczICej7BJnkuMGHSgc=;
 b=ryQ7QPJ+wJlpme5yL66l69YKETUMSLRgwglWdhdg/VBuOpRMhjftw/GlzFm1o56Mdk
 p0CyUkiO0LVWTWgC41tyDENP1SZ9a5DQg7872SBj/PLwGOyO2K+G0QNZqCw7s9JLikrn
 Ol84oIBl9ODaE3vOWGOikJiCXTaJsecvSh7TkuCc6yF9VDR3LF7PyTMhAJQJ7GSM6r+U
 zfRxPqz21rdn6ev+qv2SA5DEPKNyjKkQfSOkhKytaK03ANfll5oigoa69gwGOuJb37xJ
 a85B4oe0rBAQCShTZLUqHmugZqMbD0TBwBIDKNEvOmaxauTCg8UKlUpr1yw79O28qjZ2
 DG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678814638;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lt10PpjJqJ0ufR48VoDC3ODoiczICej7BJnkuMGHSgc=;
 b=uM2+oCoRy4LYBLRdYqMoO+Lc4/y6x2/hkWxyg6h2jWcoR6ktjMw8CNdTaYZWpaBlNs
 XOn5oJlDFcdUwUAFcXFlyC0ksw/A9rSmASKutEpDAjk8eKDzDvsKsN7YQK/Evq4xB0H6
 21NXRRfcw3XF/Hox0mpjN/f8o+87rghQZvqovtiNlffV1JGQyKcVNnwVNGc8JsPOg8py
 2uGIBqa1Z9GAiE6r1wBXYKb1lm4ie8jhNEm3rIBshceqLGdf3N85O1cuhd57fgfNfwoA
 ETix5rjP/If91Jw27rpJrfp2W0esXz+HauGs511O5YuBVi3pKdW16lrBHTEIg8jdg6nd
 pHNQ==
X-Gm-Message-State: AO0yUKX9OeVnOmh5kZxofUgfjFdnrLZTgfVrJ6nwfC0bz4BR9wsnu+GC
 F447Ik0kyUn6LPbyXCqBkoXoSbZ7fYKJBf9xFkUcWA==
X-Google-Smtp-Source: AK7set/IVbS0h4lS3Qc/jrY6f7sA+AXwbSCVnwoBSQHoGQhRyWFxQHBZiyuSn6NtRJnVPnSx62nNhixXCyy5Pr5fluo=
X-Received: by 2002:a81:ae5d:0:b0:541:85d2:af21 with SMTP id
 g29-20020a81ae5d000000b0054185d2af21mr7173793ywk.5.1678814638243; Tue, 14 Mar
 2023 10:23:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230310005704.1332368-1-dmitry.baryshkov@linaro.org>
 <20230310005704.1332368-30-dmitry.baryshkov@linaro.org>
 <ec51367b-db01-9922-baeb-3233f56f056f@quicinc.com>
 <b5f6b856-4e15-3476-e5e7-4585641398ac@linaro.org>
 <6a570e7d-f67e-a95d-4e15-db78a8b4a29d@quicinc.com>
 <7e2cfd1b-d1a1-acd1-91fd-1abbd1a86a1b@linaro.org>
 <840a4f3f-09df-f0a1-6ee6-488775739a74@quicinc.com>
In-Reply-To: <840a4f3f-09df-f0a1-6ee6-488775739a74@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 Mar 2023 19:23:47 +0200
Message-ID: <CAA8EJpr7-u5ftmF-F-bMFUvVGOG9ip=PwTBnNPZzJRS=iu2ytg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 29/32] drm/msm/dpu: enable SmartDMA for
 the rest of the platforms
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 14 Mar 2023 at 18:48, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/14/2023 9:43 AM, Dmitry Baryshkov wrote:
> > On 14/03/2023 18:35, Abhinav Kumar wrote:
> >>
> >>
> >> On 3/14/2023 3:58 AM, Dmitry Baryshkov wrote:
> >>> On 14/03/2023 07:08, Abhinav Kumar wrote:
> >>>>
> >>>>
> >>>> On 3/9/2023 4:57 PM, Dmitry Baryshkov wrote:
> >>>>> Enable SmartDMA features for the rest of the platforms where it is
> >>>>> supposed to work.
> >>>>>
> >>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>
> >>>> I am so glad we split this. Without visual validation check we
> >>>> wouldnt have caught the issues and would have ended up with a blank
> >>>> half screen on our sc7280 CBs on DP.
> >>>
> >>> yes, the r_pipe was indeed mea culpa, when I didn't fully validate
> >>> the results of a rebase. However this doesn't seem to be an
> >>> sc7280-specific question. Are there any platform-specific issues with
> >>> SmartDMA/multirect/planes revealed during testing? In other words,
> >>> were there any issues which warrant this split?
> >>>
>
> Missed this question.
>
> Well the sc7280 issue was itself coming from a platform specific
> maxlinewidth. So like I wrote there, my monitor supported 2560x1600 and
> the maxlinewidth for sc7280 is 2400. Thats why I could catch this.
>
> With RB5 or other platforms in the previous patch, this would not have
> been caught without forcing some conditions.
>
> >>>>
> >>>> For sc7280, I validated the foll cases:
> >>>
> >>> Thanks a lot!
> >>>
> >>>>
> >>>> 1) Basic Chrome UI comes up
> >>>> 2) Validated some browser use-cases and played some youtube videos
> >>>> 3) Validated multiple plug-in/plug-out cases with DP connected
> >>>> 4) IGT test cases with DP connected:
> >>>>      - kms_atomic
> >>>>      - kms_atomic_transition
> >>>>      - kms_pipe_basic_crc
> >>>>
> >>>> Some notes:
> >>>>
> >>>> 1) I wanted to test 4k with this too but my monitor only supports
> >>>> 4k@60 which is not possible with 24bpp with 2 lanes and due to the
> >>>> HBR3 black screen issue I could not test that so far. But since I
> >>>> have that issue even with 1080P and without these changes, it should
> >>>> have no effect due to this series.
> >>>>
> >>>> 2) I wanted to test some YUV overlay cases but I still cannot find
> >>>> one on chrome. Its always using RGB. Will check with others.
> >>>
> >>> Testing YUV would definitely be a must, especially for the SSPP
> >>> allocation. Can you possibly check whether contemporaty Xv
> >>> implementation employs YUV planes? You can try that using `mpv -xo
> >>> xv` or `mplayer -vo xv`
> >>>
> >>
> >> Let me get some feedback from CrOS folks here instead of just trial
> >> and error to find out.
> >>
> >>>>
> >>>> With these two noted, this change and this series has my
> >>>>
> >>>> Tested-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> >>>>
> >>
> >> There is no guarantee we will end up finding the YUV case, you could
> >> have retained the Tested-by for the efforts which were already put in
> >> instead of just blatantly removing it.
> >
> > I can add it back for v6 (or move sc7280 to the previous patch if you'd
> > prefer that). Also I think the Tested-by should have included the
> > #sc7280 comment. If you don't mind I'll add it.
> >
>
> My tag had all the comments of what I tested and what I didnt.

Not inline. Thus once patchwork picked your tag, all context (testing
on sc7280) was lost.

> >>>> Only for sc7280 device.
> >>>>
> >>>> I still cannot give my R-b on this change till others validate
> >>>> visually and ensure things arent broken for them.
> >>>>
> >>>> If we don't get enough validation and if only sc7280 remains in this
> >>>> change, please re-post it with only that and I will give my R-b too.
> >>>
> >



-- 
With best wishes
Dmitry
