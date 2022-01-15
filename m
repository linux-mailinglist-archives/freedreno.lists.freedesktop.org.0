Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D6748F5C6
	for <lists+freedreno@lfdr.de>; Sat, 15 Jan 2022 08:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D05110F057;
	Sat, 15 Jan 2022 07:50:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13AE10EBD7
 for <freedreno@lists.freedesktop.org>; Sat, 15 Jan 2022 07:50:32 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id i9so15594512oih.4
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jan 2022 23:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
 b=EmUyNC5+fyl6EfcWg7V5NP/+/kTDIH/EdOvuowOUADAQekSeyTVMo2Pw+R7MGnNyr3
 5F8QHuI+3uuwmjE0hhIplcSf2WL7/QNRQcOV1244KFMSs7KyWUA1l2Wf6ku/ze8CULMO
 JrK0FD1KD6O13Y02WDkLJ8qPwwJwBY8Rk79Pk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=h3PgS0CNglNFEriFcIB5fPEGJsKvjMbV56HeR6dLGrE=;
 b=d6ywloO3h23nb5t1+9i2zzJPfs/yodJ5+43CCtxSS7FefcwmXtW1DPQiAdCRAbvSCr
 /WcHqYuZ7rFxCh+yPJ5Qw+CP3EgPDKedb33jg029j4CqhscdlRovDlNjjGz94B4nhpiG
 cGUMjcW6Py9aDnMW8hOdNJYXBc+dm43VxllgjHzYki6J47n8whGJ/lSN+xgOBDim3qRO
 Xr5dv3hTVzcMNcPvLFqlQqiW7qe3XyBqi5l8y2FIH3YMWxrrY6BrwOSRifOEdNZVL9qs
 hrj538QThO4UhZW9xThfYxwvXJEr1KFJzzut1q1yKX5IDnVVeMxkX8mScHsME/cvAnK9
 t2FA==
X-Gm-Message-State: AOAM531uH34zjjAzRdEn1ZVKVGd/9ggJRWeduhE6ppKvwb235MY6Q2o1
 AzZvgtO/yyhLb7RgQDP0/xNs6ZW/Hn0CwNBIC98bxw==
X-Google-Smtp-Source: ABdhPJx02kIfoT6/5m/ATyYIlU8INhZ26iHsr9xTblSQKWo5tlo36oAirP0TSNUr8dUl4s8qhL52VFzPwIS7Yj/lE4c=
X-Received: by 2002:aca:a953:: with SMTP id s80mr15972957oie.164.1642233032027; 
 Fri, 14 Jan 2022 23:50:32 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 15 Jan 2022 01:50:31 -0600
MIME-Version: 1.0
In-Reply-To: <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
References: <20220106214556.2461363-1-swboyd@chromium.org>
 <20220106214556.2461363-26-swboyd@chromium.org>
 <1a3b368eb891ca55c33265397cffab0b9f128737.camel@mediatek.com>
 <CAE-0n53Y3WRy4_QvUm9k9wjjWV7adMDQcK_+1ji4+W25SSeGwg@mail.gmail.com>
 <ff81bc1fe1f1c2060fcf03ba14f1bef584c47599.camel@mediatek.com>
 <CAE-0n53FAHDmCznJ35Xh2aTwXBVwukAM3ioKx8SU9VowSaQSqA@mail.gmail.com>
 <69a10908622512c60790f97942731a8ab989b727.camel@mediatek.com>
 <CAE-0n53ao52UX3sJ67UQ3dgj0-DZ0xTeo-NrmW5YVAuXfAnxZw@mail.gmail.com>
 <fc7207eb9958c487fec5679da73d8f3595cc7bb1.camel@mediatek.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Sat, 15 Jan 2022 01:50:31 -0600
Message-ID: <CAE-0n52kPPXuZH8srbQXC6iPpaM_+2Qewn6-HQ0RNKMxi5Jdsg@mail.gmail.com>
To: Yong Wu <yong.wu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 25/32] iommu/mtk: Migrate to aggregate
 driver
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
Cc: youlin.pei@mediatek.com, Saravana Kannan <saravanak@google.com>,
 Will Deacon <will@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Joerg Roedel <joro@8bytes.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 Russell King <rmk+kernel@arm.linux.org.uk>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Yong Wu (2022-01-14 23:39:52)
> On Fri, 2022-01-14 at 15:30 -0600, Stephen Boyd wrote:
> >
> > This sounds more correct to me. I'm not an expert on runtime PM
> > though
> > as I always have to read the code to remember how it works. if the
> > device isn't ready for runtime PM until the component bind function
> > is
> > called then runtime PM shouldn't be enabled on the component device.
>
> Anyway, We should update the SMI driver for this case. I prepare a
> patch into this patchset or I send it independently? which way is
> better?

I can roll it into this patch. It needs to be combined otherwise it
breaks the bisectability of the series.
