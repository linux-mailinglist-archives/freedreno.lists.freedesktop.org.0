Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C147C1F3B1A
	for <lists+freedreno@lfdr.de>; Tue,  9 Jun 2020 14:48:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70816899FF;
	Tue,  9 Jun 2020 12:48:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6080D899FF
 for <freedreno@lists.freedesktop.org>; Tue,  9 Jun 2020 12:48:40 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so24873725ljc.8
 for <freedreno@lists.freedesktop.org>; Tue, 09 Jun 2020 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCNDWi4W86xASW8FtuEfEJaeXXXa1muCZ0DikS2IxmI=;
 b=mPvH/CmSSgHpsp6C/uqGy+AZnrwq9ay/aD+xL69u0ckBRA03GUU6MFGxmh+3CM1tav
 AfWDP7Q9/kw8uNorr4dLbJuH/FugHOrbW0L1kLqWhDSSadhfoReraccYGm4jgU7kawd8
 RGjIDKBu5LhPtGQKJgD/ULY4bXazpgO9iA14JBJv66Y3rQpom722EcFJrvzFlju4+PPd
 63XOl+NUFcOXugFmtxpKQxHGSYD0dz7w2Cx82vNQ64DciwKJ7UBf4oAtnd9ez4db6tPv
 EbJNPf78cg6H1YxzFFexQgQPzILS0+t7j4K95pw+fRVIfPDJAVT7HG2C9pHJDGj5daVO
 vuyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCNDWi4W86xASW8FtuEfEJaeXXXa1muCZ0DikS2IxmI=;
 b=ibmhFBl4G/DyD1/h0r6rp4u2wH/BhQqbHDm91vXSE4QghXggQ22lkeCEJ1IM8JsDuA
 pzc9nJxu4zNymWhHQE4bQP+z88gQ3b/EGqHizbE9qCh4Uk3C/pB8ZoXr6BDnYXLOJEx7
 38fagXU8ai7PPPknNbytyN0kXnDe3R+tfV4QHVmFtBbKyvtfox2pPeYP2kLsogWLPuv4
 Yfl9ReteGWMb62X5U9KfJrReGvQXmpfV6zMM8ar/nent3rkVjT7S5qBoIP0u6HNm3es8
 kMKwpm49IgZ2q8kCPEklhLw5sgvsCxVjyMYU9sxZd8ikdrhENud6UZgaQX01o6ZOx5O7
 SD7g==
X-Gm-Message-State: AOAM531i8zVrKC0JFxBsjhkt+ExJeC6NBK4rk8efENgxYDU9n8Xr9XYe
 JILutA8IMOYDHAfjl+moHFOpB+QODpq1mM3jM9+W+Q==
X-Google-Smtp-Source: ABdhPJy/jDW/k8Iu7wTAdiTg2q3uE99N0IA6oABBl2JcyK9DT3ERhQ6uhNzdJoff9mYZXt3GW+4EBXl7qqFZLpBxRpQ=
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr14419265ljn.286.1591706918718; 
 Tue, 09 Jun 2020 05:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de>
 <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
In-Reply-To: <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jun 2020 14:48:27 +0200
Message-ID: <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [Freedreno] [PATCH] drm/msm: fix link error without
 CONFIG_DEBUG_FS
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
Cc: Rob Clark <robdclark@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "Kristian H. Kristensen" <hoegsberg@gmail.com>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> > I ran into a randconfig link error with debugfs disabled:
> >
> > arm-linux-gnueabi-ld:
> > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> >
> > Change the helper to only look at this variable if debugfs is present.
> >
> > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> This fixes a compilation error for me on the APQ8060.
> Tested-by: Linus Walleij <linus.walleij@linaro.org>

Could someone be so kind and apply this fix to the MSM DRM tree?

Yours,
Linus Walleij
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
