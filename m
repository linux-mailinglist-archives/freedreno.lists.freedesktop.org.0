Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA2E499C44
	for <lists+freedreno@lfdr.de>; Mon, 24 Jan 2022 23:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C491010E191;
	Mon, 24 Jan 2022 22:07:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E584F10E192
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 22:07:24 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 r2-20020a4ae5c2000000b002e94fa48b69so1023992oov.9
 for <freedreno@lists.freedesktop.org>; Mon, 24 Jan 2022 14:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/aLnHFuStZ5orf+mOt/+JIQklpQVMq3vUHjZ6F6RUME=;
 b=oVOpoQrs7lAhfFdYwpI0Rbzn4piuzf9e5etUCLba1zcBTLVJXNv0oO+H7iWuBfLpPF
 ASNNSRyIUHiyAlE1wrc8sjhJTg7yluaGRdSE38M+06TBKdyjDXmPU4bzAnn+0kwjb55o
 Xh651eHtRdmJG65PfUKKbclnQeEXW8CKWcSjs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/aLnHFuStZ5orf+mOt/+JIQklpQVMq3vUHjZ6F6RUME=;
 b=wI4RqIS4Ph5uQEnmj7qxnONwao+yv3RMkKIUPOcLaLUsD4n18QWmNNGULkWBTsK4g1
 QVBSKMe3kkkIbk1AQ4YGtN5dYZxnzkw8pykSsHF9XBIt3egi36nKVlySNlGQWze26mtq
 G93jKRwaw9b4j/QK60C7Ux/5kJHnylMiVtu9wkSYPixmutebBjm1Qa3cepMO68rDkbZx
 J1iMF2TKmqVU9L/oKSRRvDzPIushfKmWLeLumx73vDPN6wdcmmWra561Tc1uTw6goI7c
 2ToqSpQdq/UjmXxj0R5f8H8o1s0wIdU88qxrlos2HAPgR0VdBdiobwLt/6uG3+FWqwEe
 KlIQ==
X-Gm-Message-State: AOAM532okRaye4GSJyQNekdVFOlGEzbk8ANAJ1KzYZ1N1qlifGJ0O5k1
 QB5ohq0HYUkMdyjgyZPNMMBr35UWrkf6hLbbmyrEEQ==
X-Google-Smtp-Source: ABdhPJyc/dz2yM6w+iD9kilsMJPwY0RIbV00zr4BPr32NKAK/72Bw+/QQmFbTMkH7urzwVaB7eMehwTkn+zmuRw96G8=
X-Received: by 2002:a4a:d51a:: with SMTP id m26mr4897764oos.1.1643062044068;
 Mon, 24 Jan 2022 14:07:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 24 Jan 2022 14:07:23 -0800
MIME-Version: 1.0
In-Reply-To: <28734c1c-a30c-d47f-3fc1-95035adcd33d@quicinc.com>
References: <1643057170-10413-1-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n53nFcMzuKfqVRac6PRTkoPrftXL+uVK56ZQsHVWHmivkQ@mail.gmail.com>
 <28734c1c-a30c-d47f-3fc1-95035adcd33d@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 24 Jan 2022 14:07:23 -0800
Message-ID: <CAE-0n51wjxd+6azct0ENNBZuE7oVSH6tXfSfEUhT4LRX6kesdw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: always add fail-safe mode into
 connector mode list
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
Cc: linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-01-24 13:24:25)
>
> On 1/24/2022 1:04 PM, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2022-01-24 12:46:10)
> >> Some of DP link compliant test expects to return fail-safe mode
> >> if prefer detailed timing mode can not be supported by mainlink's
> >> lane and rate after link training. Therefore add fail-safe mode
> >> into connector mode list as backup mode. This patch fixes test
> >> case 4.2.2.1.
> >>
> >> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Any Fixes tag? I also wonder why this isn't pushed into the DP core code
> > somehow. Wouldn't every device need to add a 640x480 mode by default?
>
> Original test case 4.2.2.1 always passed until we did firmware upgrade
> of our compliance test tester (Unigraph) recently.

Ok. So the Fixes tag should be the introduction of the driver or at
least whenever compliance testing support was added.

>
> The new firmware of tester use newer edid contains 1080p with 145.7 mhz
> which can not be supported by 2 lanes with 1.6G rate. Hence we failed
> this test case.

Interesting. So the test case wouldn't fail unless the number of lanes
were limited by the hardware? Seems that the test isn't thorough.

>
> After discuss with Vendor, they claims we have to return fail-safe mode
> if prefer detailed timing mode can not be supported.
>
> I think would be good to add fail-safe mode into connector mode list.
>
>
>
>
> > we just run into this problem recently.


Sure I'm not saying it's incorrect, just wondering why a connector
that's DP wouldn't have the 640x480 resolution by default somewhere in
the drm core.
