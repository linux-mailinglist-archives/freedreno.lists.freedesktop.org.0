Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 230841C5042
	for <lists+freedreno@lfdr.de>; Tue,  5 May 2020 10:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6B76E142;
	Tue,  5 May 2020 08:28:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA71B6E142
 for <freedreno@lists.freedesktop.org>; Tue,  5 May 2020 08:28:05 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id l19so690163lje.10
 for <freedreno@lists.freedesktop.org>; Tue, 05 May 2020 01:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bgM1z0W3jC692xWkgi3/Y+e2n/nzkwaSzFa78vdYF0E=;
 b=DIWu5shlATY4PZunGAKyb/Z+n2zkJihLqazePZ4n/k6j5RCVLrLJOPjtisCmJ8+trj
 /jCI1TplrSRfpZ5kH53qorDrheIpgsvZmn6FcroYQoDm5fn+1FLbBBDr72W4k8wY3OVB
 oP681xMKnTOAASBA2YOqIwqrGCoLIboWhJoH6lGdTMUzvdFTmx0PSELZsW/M50f3dgAy
 Dvxb+NmVgrs1GIGHpvW12W0Rsfa3soOn9dYUbzFobQPhbBJKn3mRg7aivW4Pww+9Jtxh
 0hsIpSJz1JdCxorD1s+WITyExRl8HmHDaaFS3WDusH4MYrxLQ+cH9kSN4LWThyf4wjd2
 GJvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bgM1z0W3jC692xWkgi3/Y+e2n/nzkwaSzFa78vdYF0E=;
 b=SwsGrmyTrQon+LNQRx9I13IK7DtXPOAkjiPLX4V1LdaHOmnsCaNyboBidTyBrYbChO
 M/G8UVXOyXSlreds9DTsaBpfS6VM7XFVvlzo1he0L5yEX8RoPdSMsN08RVUIxoxDlAqF
 oDYWLh9mtATSp+Yg5YKXVxCicH/8DTk8dGHdW4pl7t2iOxoO1/vle0oBb1LgVjyR5t/n
 neVM6u0Mu2Tu+kZbsBZgSDDbjyX53ZZ8JfglN07TrfPvx5hdrhrb6LPjJzFGe0pKpOlh
 I+NVns4wqf/LDNXmQTrLKSGy+90NSv2vfjEIEZbRAJzxvrnojN0FFj8COMCD4A4fugJ7
 4Nsw==
X-Gm-Message-State: AGi0PuZPhANxnNkZTQkoCsnB1IDemQCoRUL85p76/TxTw3vV0PRuN7zO
 1oghladsLqtBEU42CMjUMK4wpbL/UxHBWHVqFR81/w==
X-Google-Smtp-Source: APiQypIIQGGErF0RDv5sRtJ2GxzvtG0I7XM5imQkPX+aeO8aBHMbbijsr0Vbdq7RLakWK+shJtSNW2tUidRKojT/TqI=
X-Received: by 2002:a2e:8087:: with SMTP id i7mr993585ljg.99.1588667284186;
 Tue, 05 May 2020 01:28:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200408191458.1260397-1-arnd@arndb.de>
In-Reply-To: <20200408191458.1260397-1-arnd@arndb.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 May 2020 10:27:52 +0200
Message-ID: <CACRpkdYQJocN_-i07J0fFC16pDUfb9o0mzRF0YRO8UMrE=Suxw@mail.gmail.com>
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

On Wed, Apr 8, 2020 at 9:15 PM Arnd Bergmann <arnd@arndb.de> wrote:

> I ran into a randconfig link error with debugfs disabled:
>
> arm-linux-gnueabi-ld:
> drivers/gpu/drm/msm/msm_gpu.o: in function `should_dump': msm_gpu.c:(.text+0x1cc): undefined reference to `rd_full'
>
> Change the helper to only look at this variable if debugfs is present.
>
> Fixes: e515af8d4a6f ("drm/msm: devcoredump should dump MSM_SUBMIT_BO_DUMP buffers")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This fixes a compilation error for me on the APQ8060.
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
