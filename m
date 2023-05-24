Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865ED70FC66
	for <lists+freedreno@lfdr.de>; Wed, 24 May 2023 19:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CD8B10E35C;
	Wed, 24 May 2023 17:13:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553D610E35C
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 17:13:48 +0000 (UTC)
Received: by mail-il1-x12c.google.com with SMTP id
 e9e14a558f8ab-3352b8b9b70so176865ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 10:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1684948426; x=1687540426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EdS+q/K7TdrybGLIQtx2Ez7oq5UvktWCfD/foZoBFes=;
 b=GZW1WoDpbBzymHiXcgcIkswikpZYUT//Y+1NXYlt4UrLdqg1uc+qeXZd04Bs+b1Dvk
 fWwFOIVr9auR+EUpEUbU5E8qIItZueEYDrzKE3PLezPh6TX3dCiP75MGcF5p1M48IFL0
 NyHhlZK+RT1SCcb1RcwWaUyjp9yVJJudm2x14=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684948426; x=1687540426;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EdS+q/K7TdrybGLIQtx2Ez7oq5UvktWCfD/foZoBFes=;
 b=feO/4Yw5JmxopPchk1lIX/V4rTPgnITonaJzke+AVZ/Y/id/Zzqok4EqozHssKTk0d
 qWvj25mllTdj6SeQ7Kfh/Lgf/KTMsQH6f/kIPC3VxPLvecmOr+g1Usih6A4A45ksSfXl
 IcZNgivCDlhhhq2EHnriIEnPXerHIfwOTrUGW5MPdqj+T6cPVCrvR3zDE5hphUmIOGUs
 IygCX22O2saL+jYiVPLohwNITBfqcMjySBxD4OOELCVvMEvbxzYFJo8wf9NmHcE+PS9I
 4c01WbrgJoDZVTcA9HxmBIaIz4wdku1HbiQUAwBmOHTTOKMHmpNU1tkIFWQjQzNN8RBg
 Pg3w==
X-Gm-Message-State: AC+VfDwrOkQbJCGaJhYywnLBrqWnidNbyVP5nmIak/yqbWTF0BP9TKMB
 gFEie9tvAzHNjqtIGgbgsXUeJuZCuvwl+zV59Ro=
X-Google-Smtp-Source: ACHHUZ7wn12gX6NMirbFxGXwSsSjr5Z293svHNdMIw/D1DC3cvpriEspImwA6vCwCHE2a8vsoFHfBg==
X-Received: by 2002:a92:d0cb:0:b0:32f:752d:4a4e with SMTP id
 y11-20020a92d0cb000000b0032f752d4a4emr85354ila.1.1684948426521; 
 Wed, 24 May 2023 10:13:46 -0700 (PDT)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com.
 [209.85.166.172]) by smtp.gmail.com with ESMTPSA id
 o4-20020a92c684000000b0033842c3f6b4sm3181151ilg.83.2023.05.24.10.13.45
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 May 2023 10:13:45 -0700 (PDT)
Received: by mail-il1-f172.google.com with SMTP id
 e9e14a558f8ab-33828a86ee2so9015ab.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 May 2023 10:13:45 -0700 (PDT)
X-Received: by 2002:a05:6e02:20c7:b0:32a:f2a9:d1b7 with SMTP id
 7-20020a056e0220c700b0032af2a9d1b7mr411499ilq.10.1684948425265; Wed, 24 May
 2023 10:13:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230427232848.5200-1-quic_abhinavk@quicinc.com>
 <053819bd-b3c4-a72c-9316-85d974082ad6@linaro.org>
 <ZGzalLjTvUfzEADU@hovoldconsulting.com>
 <f530691b-989d-b059-6b06-e66abb740bdb@quicinc.com>
 <ZG216qoxK9hQ-kQs@hovoldconsulting.com>
 <4f2556e2-52ab-eb1d-b388-52546044f460@linaro.org>
In-Reply-To: <4f2556e2-52ab-eb1d-b388-52546044f460@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 24 May 2023 10:13:33 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VYczHFHv_h1tt-O+AagE1-KzgYd2B=Cx6fK_s4jR8iTw@mail.gmail.com>
Message-ID: <CAD=FV=VYczHFHv_h1tt-O+AagE1-KzgYd2B=Cx6fK_s4jR8iTw@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: add module parameter for PSR
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 quic_jesszhan@quicinc.com, David Airlie <airlied@gmail.com>,
 swboyd@chromium.org, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, May 24, 2023 at 1:06=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 24/05/2023 09:59, Johan Hovold wrote:
> > On Tue, May 23, 2023 at 12:23:04PM -0700, Abhinav Kumar wrote:
> >> On 5/23/2023 8:24 AM, Johan Hovold wrote:
> >>> On Fri, May 12, 2023 at 09:13:04PM +0300, Dmitry Baryshkov wrote:
> >>>> On 28/04/2023 02:28, Abhinav Kumar wrote:
> >>>>> On sc7280 where eDP is the primary display, PSR is causing
> >>>>> IGT breakage even for basic test cases like kms_atomic and
> >>>>> kms_atomic_transition. Most often the issue starts with below
> >>>>> stack so providing that as reference
> >>>>>
> >>>>> Call trace:
> >
> >>>>> ---[ end trace 0000000000000000 ]---
> >>>>> [drm-dp] dp_ctrl_push_idle: PUSH_IDLE pattern timedout
> >>>>>
> >>>>> Other basic use-cases still seem to work fine hence add a
> >>>>> a module parameter to allow toggling psr enable/disable till
> >>>>> PSR related issues are hashed out with IGT.
> >>>>
> >>>> For the reference: Bjorn reported that he has issues with VT on a
> >>>> PSR-enabled laptops. This patch fixes the issue for him
> >>>
> >>> Module parameters are almost never warranted, and it is definitely no=
t
> >>> the right way to handle a broken implementation.
> >>>
> >>> I've just sent a revert that unconditionally disables PSR support unt=
il
> >>> the implementation has been fixed:
> >>>
> >>>     https://lore.kernel.org/lkml/20230523151646.28366-1-johan+linaro@=
kernel.org/
> >>
> >> I dont completely agree with this. Even the virtual terminal case was
> >> reported to be fixed by one user but not the other. So it was probably
> >> something missed out either in validation or reproduction steps of the
> >> user who reported it to be fixed OR the user who reported it not fixed=
.
> >> That needs to be investigated now.
> >
> > Yes, there may still be some time left to fix it, but it's pretty damn
> > annoying to find that an issue reported two months ago still is not
> > fixed at 6.4-rc3. (I even waited to make the switch to 6.4 so that I
> > would not have to spend time on this.)
> >
> > I didn't see any mail from Bjorn saying that the series that claimed to
> > fix the VT issue actually did fix the VT issue. There's only the commen=
t
> > above from Dmitry suggesting that disabling this feature is the only wa=
y
> > to get a working terminal back.
>
> Originally this issue was reported by Doug, and at [1] he reported that
> an issue is fixed for him. So, for me it looks like we have hardware
> where VT works and hardware where it doesn't.

As I understand it, the problem was originally reported by Bjorn over
IRC. When he reported the problem on VT2, Stephen Boyd confirmed that
he could see the same problem on our hardware when using VT2. I
confirmed I could reproduce and also tested the fix. I don't remember
if Bjorn ever tested the fix. I think many of us assumed that it was
the same issue so a fix for one person would also fix the other.


> Doug, can you please confirm whether you can reproduce the PSR+VT issue
> on 6.4-rc (without extra patches) or if the issue is fixed for you?
>
> [1]
> https://lore.kernel.org/dri-devel/CAD=3DFV=3DVSHmQPtsQfWjviEZeErms-VEOTmf=
ozejASUC9zsMjAbA@mail.gmail.com/

Ugh. Unfortunately, it's not easy for me to test this particular
feature directly on upstream Linux. :( I typically run with a ChromeOS
root filesystem, which works pretty well with mainline. One place
where it doesn't work with mainline is VT2. The VT2 feature for
Chromebooks is implemented with "frecon" and takes advantage of a
downstream patch that we've carried in the ChromeOS kernel trees for
years allowing handoff of who the DRM "master" is.

For testing the fix previously, I confirmed that I could reproduce the
problem on our downstream kernel (which had the PSR patches picked)
and that the fixes worked for me in that context.

Ah, but it shouldn't be too hard to pick that one patch. Let's see if
that works. I'll pick ("CHROMIUM: drm: Add drm_master_relax debugfs
file (non-root set/drop master ioctls)"). Indeed, it works!

OK, so with the top of Linus's tree (v6.4-rc3-17-g9d646009f65d) plus
the CHROMIUM patch to enable my VT2, I can confirm that I don't see
the issue. I can switch to VT2 and typing works fine. I will say that
on herobrine the backlight is all messed up, but I assume that's an
unrelated issue.

-Doug



> > Regressions happen and sometimes there are corner cases that are harder
> > to find, but this is a breakage of a fundamental feature that was
> > reported before the code was even merged into mainline.
> >
> >> We should have ideally gone with the modparam with the feature patches
> >> itself knowing that it gets enabled for all sinks if PSR is supported.
> >
> > Modparams are things of the past should not be used to enable broken
> > features so that some vendor can tick of their internal lists of
> > features that have been "mainlined".
>
> We have had a history of using modparam with i915 and IIRC amdgpu /
> radeon drivers to allow users to easily check whether new feature works
> for their hardware. My current understanding is that PSR+VT works for on
> some laptops and doesn't on some other laptops, which makes it a valid ca=
se.
>
> >
> > You can carry that single patch out-of-tree to enable this if you need
> > it for some particular use case where you don't care about VTs.
> >
> > But hopefully you can just get this sorted quickly. If not, the revert =
I
> > posted is the way to go rather than adding random module parameters.
> >
> > Johan
>
> --
> With best wishes
> Dmitry
>
