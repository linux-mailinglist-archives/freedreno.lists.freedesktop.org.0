Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EFE83B1E1
	for <lists+freedreno@lfdr.de>; Wed, 24 Jan 2024 20:09:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC3610EA2E;
	Wed, 24 Jan 2024 19:08:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com
 [209.85.128.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC49F10EE2E
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jan 2024 19:08:44 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id
 00721157ae682-5ff7dd8d7ceso52130817b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 24 Jan 2024 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706123264; x=1706728064; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=83DOBD+z2opGGI/zvJafVqIF34IBUkWQmR4B890x+NI=;
 b=KuE8FMvfBvLHswEk9j8fIBl2/dtm0HCJhPPxy08LiHdwiX0GSaeiCIEFydHuy52NDY
 sfsEtprBk80b2UfluKzTlMgEOP7sxdqtjG2e/jjCfV2caDYIVjFAMbHlw9DNmeNO0SJR
 xaqkL6TGAbLcabyfyZ4XTC2psAbLVFTMxPN+PpZ921+0lx8T7+hakJ+ERENBiB2kKh3d
 r2LlBSXOTKcxM5FoBy3FC3ZN6uCxPi9lreKVNNum54n4Fly5jSMSEDpfldF1Wp1LxiEZ
 L8/g5LjasghaDDW4aEVonrphkgE2d/ME6Ruk7eHZHewMihZZbz8ChZoUtjkR9GHVV+Es
 d+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706123264; x=1706728064;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83DOBD+z2opGGI/zvJafVqIF34IBUkWQmR4B890x+NI=;
 b=XjJFxs/ShoWmDjsOWett2pa5bJ99xLUCfzHj2PuTCZDZ8+5gK8Xu9k37WoNvljtbFt
 3NmF97ZbsAmW5V1DL/wGxvMT1rTPZCKS/vNheSmSBg9UfGxFa9ZHRfw+7mHtsYTwFebF
 B4XX9qeLDwM9cydaWpJrDBylDcj/58rNYNeSBX4BrwELy8+MPnnG3KXhc3Ae/gfj62uY
 wqYdMz2rvAdGkgKQR5JdBH33o/x9nXamJozkjwSrGymwwUMwJEH5zDjLhVhPdcpAtN4b
 harEsezq2z7aidXlmbdpYzd9ecoMXlZ0Y5Md2BkFGBS9qQv/Hw+zTm+uj9+OKP5gL3K6
 tM5A==
X-Gm-Message-State: AOJu0Yzyxtl4XKnrB/OuRd9VMVUrEUyRfI5qaUKO/I4vzrYmJlUgSLlJ
 d52CwxRydYiHXywZ1mU/SBiQkzf7/3qN37V9mcMwQWLM/qPtdyt1KlWqdaOKZUjrdOr6GtGteLW
 sHkDyWQItoAKUqFQURV3CRZuiCfpxRZiZynGgIaxAXLLHEU6e
X-Google-Smtp-Source: AGHT+IGxHDJKtOpairQWBigKPlbOlILS6SAYqOkhXt8vlBs3y9B0BP1S6LV5olG3zs9mSvdRIEFMUqYCBjlYI8HP8xM=
X-Received: by 2002:a0d:e8c7:0:b0:5ff:9903:8347 with SMTP id
 r190-20020a0de8c7000000b005ff99038347mr1352856ywe.64.1706123263875; Wed, 24
 Jan 2024 11:07:43 -0800 (PST)
MIME-Version: 1.0
References: <20231229225650.912751-1-dmitry.baryshkov@linaro.org>
 <20231229225650.912751-14-dmitry.baryshkov@linaro.org>
 <b5f571c6-dcf6-c416-ca86-fdbd0514676b@quicinc.com>
 <CAA8EJpqvyOsPErUE08mcCAcG41zRJS+Q6qQi83-ZNCBcwv3kCw@mail.gmail.com>
 <18b7e28c-c969-c5f4-28a9-74ff79c94aca@quicinc.com>
 <bb4cac9c-4de7-8ad0-5cdc-f7c089eaa75c@quicinc.com>
 <CAA8EJprpbtwzQc5LBOV8KurfHQvQW7SY4LLQpyMzVeyfmQ=dBw@mail.gmail.com>
 <6525bfd7-4478-81c1-33cd-dd4dac76aff5@quicinc.com>
In-Reply-To: <6525bfd7-4478-81c1-33cd-dd4dac76aff5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Jan 2024 21:07:32 +0200
Message-ID: <CAA8EJpqdN2BmS+=Dh1-+8nzk6TqAbxHyuMuHjO8pa3eEkGP1PQ@mail.gmail.com>
Subject: Re: [PATCH 13/14] drm/msm/dp: move next_bridge handling to dp_display
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 23 Jan 2024 at 19:31, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
>
> On 1/22/2024 4:23 PM, Dmitry Baryshkov wrote:
> > On Tue, 23 Jan 2024 at 01:20, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
> >>
> >> On 1/22/2024 9:28 AM, Kuogee Hsieh wrote:
> >>> On 1/19/2024 6:31 PM, Dmitry Baryshkov wrote:
> >>>> On Fri, 19 Jan 2024 at 23:14, Kuogee Hsieh <quic_khsieh@quicinc.com>
> >>>> wrote:
> >>>>> Dmitry,
> >>>>>
> >>>>> I am testing this patch serial with msm-next branch.
> >>>>>
> >>>>> This patch cause system crash during booting up for me.
> >>>>>
> >>>>> Is this patch work for you?
> >>>> Yes, tested on top of linux-next. However I only tested it with
> >>>> DP-over-USBC. What is your testcase? Could you please share the crash
> >>>> log?
> >>> I tested it on chrome device (sc7280) which has eDP as primary and
> >>> without external USBC DP connected.
> >>>
> >>> It crashes during boot.
> >>>
> >>> I will debug it more and collect logs for you.
> >>>
> >> Below  patch work for chrome with both eDP and external DP.
> >>
> >> We have to return failed if it is the external DP and return value of
> >> devm_drm_of_get_bridge()  is !ENODEV since DP does not have next bridge.
> >>
> >> Otherwise should continues to component_add()
> > We also should not continue if it is eDP in case of any error.
> >
> > So it is if (is_edp || (!is_edp && ret != -ENODEV)) which is exactly
> > equivalent to (is_edp || ret != -ENODEV).
>
> yes, you are correct.
>
> I just found that the real fix of crash is "+ dp->next_bridge = NULL;"
> since dp->next_bridge will be used at dp_bridge_init() at dp_drm.c later.
>
> Therefore it need to be restored to NULL at failed case.

Ack, this sounds logical.

> > Could you please post the backtrace that you have observed?
>
> I do not have serial console port to collect logs.
>
> If you still need it, i will collect it tomorrow.

No, I think it is fine now, thank you!

>
> >
> >> @@ -1210,7 +1210,9 @@ static int dp_display_probe_tail(struct device *dev)
> >>           dp->next_bridge = devm_drm_of_get_bridge(&dp->pdev->dev,
> >> dp->pdev->dev.of_node, 1, 0);
> >>           if (IS_ERR(dp->next_bridge)) {
> >>                   ret = PTR_ERR(dp->next_bridge);
> >> -               if (dp->is_edp || ret != -ENODEV)
> >> +               dp->next_bridge = NULL;
> >> +
> >> +               if (!dp->is_edp && ret != -ENODEV)
> >>                           return ret;
> >>           }
> >>>>> On 12/29/2023 2:56 PM, Dmitry Baryshkov wrote:
> >>>>>> Remove two levels of indirection and fetch next bridge directly in
> >>>>>> dp_display_probe_tail().
> >>>>>>
> >>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/msm/dp/dp_display.c | 42
> >>>>>> +++++++++--------------------
> >>>>>>     drivers/gpu/drm/msm/dp/dp_parser.c  | 14 ----------
> >>>>>>     drivers/gpu/drm/msm/dp/dp_parser.h  | 14 ----------
> >>>>>>     3 files changed, 13 insertions(+), 57 deletions(-)



-- 
With best wishes
Dmitry
