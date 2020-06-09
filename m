Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129821F3D84
	for <lists+freedreno@lfdr.de>; Tue,  9 Jun 2020 16:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B225B89CAF;
	Tue,  9 Jun 2020 14:04:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86B489CB9
 for <freedreno@lists.freedesktop.org>; Tue,  9 Jun 2020 14:04:22 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id w18so13992169iom.5
 for <freedreno@lists.freedesktop.org>; Tue, 09 Jun 2020 07:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M11TlZ8BCkkiyM14zjB6SRMJjOFPdi0sycPDLMDZtzg=;
 b=WcKt86PI06koGDiMZklr+HDKxwBnBrf72EEYGJhlLB2eLfI7DuOgfRzmxlQpnDf3P+
 xcqPS5N2kWZzPQLjpuC6LQTeBJYkCixcYSwseGmp3ZHoktGwLwjZDAryXzofcxVTm7tI
 +ZeDAoYJLmTSokrxd3haNf0dUpgnAdHtIhxPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M11TlZ8BCkkiyM14zjB6SRMJjOFPdi0sycPDLMDZtzg=;
 b=YTKz88fBRz2PmMwWYTYHdtyY2ZsQeIkQ32LIgXP1HzRpgiPEpsvFNXp+py5CACFdWj
 +w/MYoOJayiGQ/SbNy/H2TVl6Qtgg1vmfK5j1YH4HWW0tNkHWpt8ZxWIfv/MZtYN3XY1
 yTwiq8wSBZZ+eu+IoFj4vrdDiMy1gm7otFH6XaAsOzxMgNRFe7B3zds6lrJ9xH1ixLr+
 /tYn0TwFXSLld+RrlD6wkQAw53Rs1W6zMkWrL4THZ5IFVOxSiLt/TBoObWsLzM+IMn8N
 KaYrjse4OyZubFpmG2BAyrBpK4Yls2Isza11Y1S+kkseEfW501TMXZ+45dW5ka5tfgSz
 7hTw==
X-Gm-Message-State: AOAM530FC57R3YGzQm0xu/toZYqBnM3Q/7iECAbTnhEjMs6hsS13ccsn
 fnXh9HwlG4CBeZgoz5f7GRssZUEFIKgwYNsAlAFZ2A==
X-Google-Smtp-Source: ABdhPJyG91jHkheJimS86A26g34xw4jYgUCjF+/j9VS/jduQO60MV/ip1Uo+HQrXE9vAcZ0eYj2cAUokFLTwKjv6VUk=
X-Received: by 2002:a5d:858a:: with SMTP id f10mr27458957ioj.184.1591711462114; 
 Tue, 09 Jun 2020 07:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de>
 <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
 <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
In-Reply-To: <CACRpkdYUTujUX7FdwFjehFVAOLz_w6epXRzYc8e8yB=zDsRCyw@mail.gmail.com>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 9 Jun 2020 07:04:49 -0700
Message-ID: <CAJs_Fx4V9JkwATGeY8eV=Z1khr6z=OVd+B=YRJ1RY7xxxM47_Q@mail.gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
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

On Tue, Jun 9, 2020 at 5:48 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Tue, May 5, 2020 at 10:27 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > > I ran into a randconfig link error with debugfs disabled:
> > >
> > > arm-linux-gnueabi-ld:
> > > drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
> > >
> > > Change the helper to only look at this variable if debugfs is present.
> > >
> > > Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > This fixes a compilation error for me on the APQ8060.
> > Tested-by: Linus Walleij <linus.walleij@linaro.org>
>
> Could someone be so kind and apply this fix to the MSM DRM tree?
>

This should be fixed by 20aebe83698feb107d5a66b6cfd1d54459ccdfcf in
msm-next/drm-next, are you still seeing this issue?

BR,
-R
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
