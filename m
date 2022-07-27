Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21564582842
	for <lists+freedreno@lfdr.de>; Wed, 27 Jul 2022 16:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E855B2B2E0;
	Wed, 27 Jul 2022 14:09:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 022642B4EB
 for <freedreno@lists.freedesktop.org>; Wed, 27 Jul 2022 14:09:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id s9so2316735edd.8
 for <freedreno@lists.freedesktop.org>; Wed, 27 Jul 2022 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=QtFRrHm4vMqcg+bk4tWbQr1CbqO5/aviSsSa28f21tc=;
 b=d8fxrLFnDtTqO02Phnf6U+WdtMr5FTtXzSl7ipt4oli55Pv7HQQy7jwtjzdkR3NHoO
 r+l2EvhuSBjmLFvosAEUE2S1RhWSgdDF1k6pJNRlyCSdImbttMNcbEvjSl0fqEX/1gqC
 AnxfJKP9S1I++lCPHC4C3f6kYQHE8oekZmucA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=QtFRrHm4vMqcg+bk4tWbQr1CbqO5/aviSsSa28f21tc=;
 b=1dFGPa+cFaPJbF3XapVBlBCwnGNeTxeAi/y+bLWSH6+MyMWIeCmkruIaoih7YntINL
 +PiCwccNDUX3PPzZpCnSrAJ9GlRN0j1CBgcp790+98tEfPRu1HsM13a4JgF/Ye1iI72J
 Rv9mfGkmSQ+RnIj8OuroXq9JBzbEuoTbeZ82Was2TVwxaQPHJSYGaPNtQpN9Hj/L4PoC
 5yuuktVEqmHDVnTOQ/E8rhpCTLFVe9fxfbp6pHBXRS3CXPlybDuwGoNtWv3Gum5V5SCd
 YYbvNmbbA3pLRUfTBRaYZyQSwZe4G2teSUEyBSpK17i/P4S0/0oqKrB2p5f4rzVAnVfH
 CoeQ==
X-Gm-Message-State: AJIora/94w8qvBoqcn7ki5N029505y3J0zgWOXWxT5P6rxu3OATtIy1T
 hcF3JQnU2kwbZn6CEuPwdSNRJZ9l/k+dIvCS
X-Google-Smtp-Source: AGRyM1tJEakXamo/jfCs3TlTBm3cX17ckBEi9aC4fbcXVDHq5dCrlI3ZeB13NsRz6aV6f+C5AGOZ6g==
X-Received: by 2002:a05:6402:ce:b0:43c:874f:e08f with SMTP id
 i14-20020a05640200ce00b0043c874fe08fmr6710167edu.225.1658930965010; 
 Wed, 27 Jul 2022 07:09:25 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46]) by smtp.gmail.com with ESMTPSA id
 9-20020a170906300900b0072fa1571c99sm7029955ejz.137.2022.07.27.07.09.21
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 07:09:22 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id k11so23965233wrx.5
 for <freedreno@lists.freedesktop.org>; Wed, 27 Jul 2022 07:09:21 -0700 (PDT)
X-Received: by 2002:a05:6000:178f:b0:21e:98ee:f1e6 with SMTP id
 e15-20020a056000178f00b0021e98eef1e6mr6847820wrg.405.1658930960744; Wed, 27
 Jul 2022 07:09:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220725174810.1.If1f94fbbdb7c1d0fb3961de61483a851ad1971a7@changeid>
 <661fa514-cd37-e062-3294-c844b7f0b894@quicinc.com>
 <CAD=FV=UHhfLn+S8F60EPoC0ip6YzmrihfTz=KmmauXHCxof2QQ@mail.gmail.com>
 <CAA8EJppHr7GjcvqRqXAgjw9mf+ObzCi58-VYSdO_JMfk1-4ifA@mail.gmail.com>
In-Reply-To: <CAA8EJppHr7GjcvqRqXAgjw9mf+ObzCi58-VYSdO_JMfk1-4ifA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 27 Jul 2022 07:09:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WEK-CrFjSrs7ADfkQmoz=xOmppzyZtsEQGv0ga83i3CQ@mail.gmail.com>
Message-ID: <CAD=FV=WEK-CrFjSrs7ADfkQmoz=xOmppzyZtsEQGv0ga83i3CQ@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dsi: Don't set a load before
 disabling a regulator
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
Cc: Sean Paul <sean@poorly.run>, Vinod Koul <vkoul@kernel.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Mark Brown <broonie@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Jul 27, 2022 at 6:59 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Wed, 27 Jul 2022 at 16:57, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Jul 26, 2022 at 4:53 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >
> > > On 7/25/2022 5:49 PM, Douglas Anderson wrote:
> > > > As of commit 5451781dadf8 ("regulator: core: Only count load for
> > > > enabled consumers"), a load isn't counted for a disabled
> > > > regulator. That means all the code in the DSI driver to specify and
> > > > set loads before disabling a regulator is not actually doing anything
> > > > useful. Let's remove it.
> > > >
> > > > It should be noted that all of the loads set that were being specified
> > > > were pointless noise anyway. The only use for this number is to pick
> > > > between low power and high power modes of regulators. Regulators
> > > > appear to do this changeover at loads on the order of 10000 uA. You
> > > > would a lot of clients of the same rail for that 100 uA number to
> > >
> > > I guess you meant "you would need a lot of clients"
> >
> > Yeah, sorry. :( I'll fix it up if I need a v3.
> >
> >
> > > > @@ -259,15 +259,7 @@ static inline struct msm_dsi_host *to_msm_dsi_host(struct mipi_dsi_host *host)
> > > >   static void dsi_host_regulator_disable(struct msm_dsi_host *msm_host)
> > > >   {
> > > It seems like now we can drop this function dsi_host_regulator_disable()
> > > entirely and just call regulator_bulk_disable() ?
> >
> > Sure, if you want. One could still argue that it provides a tiny bit
> > of abstraction and avoids the caller from having to know where to find
> > the number of regulators and all that, but I can go either way. Is
> > this worth a v3, do you think? If so, I might tack it on at the end of
> > the series.
>
> I'd say, drop it. Having extra single-call wrappers doesn't seem to add a lot.

Sounds good. I'll wait a little bit of time for feedback on the larger
series and then send a v3, probably next week.

-Doug
