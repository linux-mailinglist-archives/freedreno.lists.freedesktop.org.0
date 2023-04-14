Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD716E2C95
	for <lists+freedreno@lfdr.de>; Sat, 15 Apr 2023 00:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5CF810EEBB;
	Fri, 14 Apr 2023 22:54:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCA1210E221
 for <freedreno@lists.freedesktop.org>; Fri, 14 Apr 2023 22:54:10 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-54fb615ac3dso156050927b3.2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Apr 2023 15:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681512849; x=1684104849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RsEpHWGUAT6/yQHsUqy7RYLlhjJJBPs4/FPHEMvEdok=;
 b=l7SvFeI8wAyE3IVHu4sdBXgh5y48P8qp65dCOH1gwQsVN1v8gjeerld6Deapj1+2we
 Djuo8gK7k1yxyXQdjJVN4b67SZAqPhaNkf9mQGbbo/2ZEVRYcRsKlvS5jmhpwQtjD8tn
 NU0gaJS0gbsPuGaQ0Ka8pIvVToBlt11htGL+biYLNouQYULXSvmkdFsqDKPdjJhRmftz
 D4evnJTyuygL94k1iIcWhIwD33WNeTavTXl/VkgUEy+dP9g3uxq3E67Fn/wS9uM//jFt
 nqkLp8JHHbGszXP2hdICNdgNND5H94ywb3O/04KgWN1oQZxxCcDrSygz1BAHvkoOpxaU
 3cjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681512849; x=1684104849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RsEpHWGUAT6/yQHsUqy7RYLlhjJJBPs4/FPHEMvEdok=;
 b=SQnPz3FT4h1p2QpXMGZcuvnCV2LPdJ5HqHJiBYDFcne+ecHJrmrpBhWEpXSrAJHrk9
 8mlyc7OfI7HJdpDmK9sigxC979wiT285U9PGbvMIAdR310TzijVJqw4bHTkWRvYepDkf
 G5K6YUz/l9+kRtd8cCwbThzzLGeqF9MG4pw2RX/TY1y0M5/aAkG0UEX7ZbN4SpaTsmbB
 mn5jtH3V2VgNMtynjP18iuTExQYueo5edWd3KrnTkS4aw3SUuGSHe7MvGjyVxAYXrb4z
 5ZCI+S3bRsua/CfudM/wrUt7Pwg/zEyJ/ftYamvXPfbNBuJEbLDAqwBovKA6jY3oC1ae
 oHxQ==
X-Gm-Message-State: AAQBX9dbHGmH0H51OH57Bc0oJBSNAhdw+1NJXh3R9UkxuvM3xAXhi0An
 +QhALXDyJi5ZPG8pBkfg8Ij8ikloDzSmYVK96jJQNQ==
X-Google-Smtp-Source: AKy350alnLGNiqXynMnQ2A1/nkIijoMJpeU74l1AYCOWrgnODdEBiuXNrkulMYhHR3pZUgKChfS9TBSwcF4FFQWXuSs=
X-Received: by 2002:a81:ac22:0:b0:54f:85a6:c80c with SMTP id
 k34-20020a81ac22000000b0054f85a6c80cmr4728207ywh.5.1681512849564; Fri, 14 Apr
 2023 15:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <1681401401-15099-1-git-send-email-quic_khsieh@quicinc.com>
 <tgfbdk6q3uool365jqddibnbgq66clsmsm6tldxpm5toqghxpq@m2ic3oonv2s5>
 <aac210da-dec1-aab8-3f48-c33d9e7687d6@quicinc.com>
 <3oaangxh7gmie3cdd6rmujm7dd3hagsrnwiq3bascdtamvfn3a@bn6ou5hbsgxv>
 <c09725ff-771c-35d1-adc9-4bb1b7c1c334@quicinc.com>
 <CAA8EJppKXSGcOcYEc6UKz9Eh8JizSpdDNe+cdvfmFbuBJ9zPKw@mail.gmail.com>
 <eb8ea024-1152-418c-a048-f86253867c9e@quicinc.com>
In-Reply-To: <eb8ea024-1152-418c-a048-f86253867c9e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 15 Apr 2023 01:53:58 +0300
Message-ID: <CAA8EJpoOZOwLfa4tx1zhp8w5cY+3OR4J4o0xjTaNO5SMM=F6Bg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: always program dsc active
 bits
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, airlied@gmail.com,
 andersson@kernel.org, freedreno@lists.freedesktop.org, dianders@chromium.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 agross@kernel.org, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sat, 15 Apr 2023 at 00:03, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 4/14/2023 1:58 PM, Dmitry Baryshkov wrote:
> > On Fri, 14 Apr 2023 at 21:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 4/14/2023 10:28 AM, Marijn Suijten wrote:
> >>> On 2023-04-14 08:41:37, Abhinav Kumar wrote:
> >>>>
> >>>> On 4/14/2023 12:48 AM, Marijn Suijten wrote:
> >>>>> Capitalize DSC in the title, as discussed in v1.
> >>>>>
> >>>>> On 2023-04-13 08:56:41, Kuogee Hsieh wrote:
> >>>>>> In current code, the DSC active bits are written only if cfg->dsc is set.
> >>>>>> However, for displays which are hot-pluggable, there can be a use-case
> >>>>>> of disconnecting a DSC supported sink and connecting a non-DSC sink.
> >>>>>>
> >>>>>> For those cases we need to clear DSC active bits during tear down.
> >>>>>>
> >>>>>> Changes in V2:
> >>>>>> 1) correct commit text as suggested
> >>>>>> 2) correct Fixes commit id
> >>>>>> 3) add FIXME comment
> >>>>>>
> >>>>>> Fixes: 77f6da90487c ("drm/msm/disp/dpu1: Add DSC support in hw_ctl")
> >>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>>>> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> >>>>>
> >>>>> By default git send-email should pick this up in the CC line...  but I
> >>>>> had to download this patch from lore once again.
> >>>>>
> >>>>
> >>>> Yes, I think what happened here is, he didnt git am the prev rev and
> >>>> make changes on top of that so git send-email didnt pick up. We should
> >>>> fix that process.
> >>>
> >>> The mail was sent so it must have gone through git send-email, unless a
> >>> different mail client was used to send the .patch file.  I think you are
> >>> confusing this with git am (which doesn't need to be used if editing a
> >>> commit on a local branch) and subsequently git format-patch, which takes
> >>> a commit from a git repository and turns it into a .patch file: neither
> >>> of these "converts" r-b's (and other tags) to cc, that's happening in
> >>> git send-email (see `--suppress-cc` documentation in `man
> >>> git-send-email`).
> >>>
> >>
> >> Yes, ofcourse git send-email was used to send the patch, not any other
> >> mail client.
> >>
> >> Yes i am also aware that send-email converts rb to CC.
> >>
> >> But if you keep working on the local branch, then you would have to
> >> manually add the r-bs. If you use am of the prev version and develop on
> >> that, it will automatically add the r-bs.
> >
> > It looks like there is some misunderstanding here. I think Marijn
> > doesn't question his R-B (which was present), but tries to point out
> > that Kuogee might want to adjust his git-send-email invocation. By
> > default (and that's a good practice, which we should follow),
> > git-send-email will CC people mentioned in such tags. Marijn didn't
> > get this email. So, it seems, for some reason this Cc: _mail_ header
> > was suppressed. Probably git-send-email invocation should be changed
> > to prevent suppression of adding mentioned people to CC lists.
> >
>
> Yeah I understood that part. There were two issues here:
>
> 1) My r-b got dropped and that was because am wasn't used to
> automatically retain tags from prev version.
>
> If you dont add the r-bs either manually or by am, then folks wont be
> part of CC either

Just as a note: there is nothing wrong with adding tags manually. I do
that for some of my patchsets (and sometimes I miss them too).

>
> 2) I synced with kuogee. his git version seems to be quite old which is
> not adding the folks from r-b to cc. So there was nothing wrong with
> invocation, just versioning.

Ack. Thanks for updating it.

>
>
> >>
> >>
> >>> I can recommend b4: it has lots of useful features including
> >>> automatically picking up reviews and processing revisions.  It even
> >>> requires a changelog to be edited ;).  However, finding the right flags
> >>> and trusting it'll "do as ordered" is a bit daunting at first.
> >>>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 8 ++++----
> >>>>>>     1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >>>>>> index bbdc95c..1651cd7 100644
> >>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> >>>>>> @@ -541,10 +541,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
> >>>>>>             if (cfg->merge_3d)
> >>>>>>                     DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
> >>>>>>                                   BIT(cfg->merge_3d - MERGE_3D_0));
> >>>>>> -  if (cfg->dsc) {
> >>>>>> -          DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, DSC_IDX);
> >>>>>> -          DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> >>>>>> -  }
> >>>>>> +
> >>>>>> +  /* FIXME: fix reset_intf_cfg to handle teardown of dsc */
> >>>>>
> >>>>> There's more wrong than just moving (not "fix"ing) this bit of code into
> >>>>> reset_intf_cfg.  And this will have to be re-wrapped in `if (cfg->dsc)`
> >>>>> again by reverting this patch.  Perhaps that can be explained, or link
> >>>>> to Abhinav's explanation to make it clear to readers what this FIXME
> >>>>> actually means?  Let's wait for Abhinav and Dmitry to confirm the
> >>>>> desired communication here.
> >>>>>
> >>>>> https://lore.kernel.org/linux-arm-msm/ec045d6b-4ffd-0f8c-4011-8db45edc6978@quicinc.com/
> >>>>>
> >>>>
> >>>> Yes, I am fine with linking this explanation in the commit text and
> >>>> mentioning that till thats fixed, we need to go with this solution. The
> >>>> FIXME itself is fine, I will work on it and I remember this context well.
> >>>
> >>> Looks like it was removed entirely in v3, in favour of only describing
> >>> it in the patch body.  The wording seems a bit off but that's fine by me
> >>> if you're picking this up soon anyway.
> >>>
> >>> - Marijn
> >
> >
> >



-- 
With best wishes
Dmitry
