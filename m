Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F24E1F4792
	for <lists+freedreno@lfdr.de>; Tue,  9 Jun 2020 21:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19AA891F8;
	Tue,  9 Jun 2020 19:53:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE146891F8
 for <freedreno@lists.freedesktop.org>; Tue,  9 Jun 2020 19:53:12 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id x27so37775lfg.9
 for <freedreno@lists.freedesktop.org>; Tue, 09 Jun 2020 12:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tUWfuhibOgc2qDuR8j6PZRsitIEa5AgrV8pmEG0P02Y=;
 b=sK+8RlDjikgHEuA3/kcxNekFgXz3Mu5DR09v16l8o+7xRQjax6TDincVJct+FsWt0/
 IncvasH0MP32OvvhlGAjndRmYWzo/PA5Vt7aikyqeE2WCYB9RbkWH09rczh6i8LwgOEF
 oR0AfEzkVg3A8q5iWCLYhVtz6dADYE/m8058DSVyr6w6Voc6edxVj1IPARx5HoawvfIz
 8BUoMJfqmOh/nHtady0/cPmbRrLwAqGbdozHp1gXUvKYiXoiPMh0ZMuj51TFU+bbkj/o
 Zfmkk9VrVGZ9k5fKv7JZnnLg33MBw5eaPWctnqDHeFnmUtNWwUaH1rIcIPYUsXcvXD9/
 el9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUWfuhibOgc2qDuR8j6PZRsitIEa5AgrV8pmEG0P02Y=;
 b=Ehr8n/KxKGFjvcXLdmbiPs4L8CaCElRVQI6CJEhRIVPUqfUs4r0O2Rf/wj/bC2jP6e
 hIFNVvO3BsQ4YfTtz1vhWO7L4sGdbRLjQyOho9s607mbiUw3jMb70ZGIehiXIL3c4TTu
 vG9gEVsepKWvazO6CInMcseXvlTnjDfY+IatJSxmFVE4HAhG6LbMvRNe2okM8Gm2bADH
 uTfSM1T+VL0bQr5DrK/gq3e4VR3OYknzDb3B/e/S46pyN1QaiygjH2qgTidWjak1QeW4
 70O8n4eAnESMnVszC2dLPNBa6dhKlhptzqnyP4Z17S5H6UX7D3skrfPVY42drq1agljg
 bdPw==
X-Gm-Message-State: AOAM533SZdswe6NWgfrSyXyakQlex/kO8e2DWTLK0E+LsiJVMbwYBqvL
 zVl1oEn9BtCwwq2FPRVe9I51a91ZsO4NUTVWv0v9bw==
X-Google-Smtp-Source: ABdhPJwe80eLeSB161s6pLsJ9M/dSqM3rMPgLB0OQVvgMZYcddUazRxjNwbPDc8UxolcwAuZqNy8k+4V9D3RHC/fBus=
X-Received: by 2002:ac2:4823:: with SMTP id 3mr16162946lft.194.1591732390917; 
 Tue, 09 Jun 2020 12:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de>
 <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
 <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
 <CAJs_Fx4V9JkwATGeY8eV=Z1khr6z=OVd+B=YRJ1RY7xxxM47_Q@mail.gmail.com>
In-Reply-To: <CAJs_Fx4V9JkwATGeY8eV=Z1khr6z=OVd+B=YRJ1RY7xxxM47_Q@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jun 2020 21:53:00 +0200
Message-ID: <CACRpkdadv9+Lu7f9uRibhdnd41rX2n_H7AUSzmXc_Dn_EYs1eA@mail.gmail.com>
To: Rob Clark <robdclark@chromium.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
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

On Tue, Jun 9, 2020 at 4:04 PM Rob Clark <robdclark@chromium.org> wrote:
> On Tue, Jun 9, 2020 at 5:48 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > > I ran into a randconfig link error with debugfs disabled:
> > > >
> > > > arm-linux-gnueabi-ld:
> > > > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> > > >
> > > > Change the helper to only look at this variable if debugfs is present.
> > > >
> > > > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > >
> > > This fixes a compilation error for me on the APQ8060.
> > > Tested-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Could someone be so kind and apply this fix to the MSM DRM tree?
> >
>
> This should be fixed by 20aebe83698feb107d5a66b6cfd1d54459ccdfcf in
> msm-next/drm-next, are you still seeing this issue?

Oh nice this works too, I was just rebasing my trees and the patch was still
there, of course I didn't see that anothe patch fixed the same issue already.

Thanks Rob!

Linus Walleij
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
