Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF07229BBB
	for <lists+freedreno@lfdr.de>; Wed, 22 Jul 2020 17:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B75F76E373;
	Wed, 22 Jul 2020 15:47:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C5C6E22F
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jul 2020 15:47:14 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id g20so2026994edm.4
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jul 2020 08:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HoVUwkD/CbiG5/MELncVn64RYUZvFJVClzUVyeNxr7M=;
 b=jE/wvq2Q7DTuw3xPwzOgwmtTwSpZfjrNYA9x3yVk3+2T2eZUI/GEgnLpFbxI7Oys1M
 UV9a7dxVhM8s44FwUkVvBzxdfz0k++qzn1KZCGRDyHgV/bi8uUfwkUl7n/njVt5USEzp
 koIaslLr1+G4INekfMHW9X9OEMNNUC/96hRiys7d64trF8Y2VlxoGrz5kp1cQDtwkkDC
 IACBthdVY/UuorfPqXW3COp/2ZOi0p7OXVZjqDycs6bxKPoUb880KG37PEk20CBA38gM
 WiTrUjRruZEca5HkHPTOF4H0F3lCG4LWfW48bf6wjMQO4FFNj9m55HAwnHQcHUUPQ2tT
 dhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HoVUwkD/CbiG5/MELncVn64RYUZvFJVClzUVyeNxr7M=;
 b=g9c3zKEBwjyGas12qGjoamgAvrppf9cTRkwIs/V+95cJHUpVb51t6GFA9YQKqT3Che
 zU8MyHBB4pLuuaC8UHCyl8KIFlqBLXuiDe7b4s9ou6knylGN2n+dTUypxdGt18xVHkVa
 W7MBn28+wXIUPaonx309wR+jz12FY687XzWDi84txrB6qfq4Eask3ZxyytBrZm2+uMAR
 mcXPn1wT9oY29kta0zcoYriY1tDU2gDx7MoeLVxZUSiEpENDw048OfvEvjk07FT26F+1
 Z+JhYWHEWkHaCZLertVnsPrgcZfisfdV7+Bn2u9USWorw36bb7XWzJkDgh2TKkw6mAtg
 yt0Q==
X-Gm-Message-State: AOAM533Sh2JkiAUvVsBCDEuzTwf9Sy+ngxSpne0zHplp7BlKmIyCaeZw
 ksl6JGnj3V554wmN/b6r6mPgj4EWi0HS8yeQy5Y=
X-Google-Smtp-Source: ABdhPJxosJN11zDQSjXmhENnAY8a/xTlojpLCi063iaBnlxh58oOjashgy9Fq9WU5WMvUzog9st58umRz18yVM4p8bo=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr117686edi.120.1595432832953; 
 Wed, 22 Jul 2020 08:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
In-Reply-To: <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 22 Jul 2020 08:47:49 -0700
Message-ID: <CAF6AEGsOZshgBUnUKUF_hOLNHmvrvsDwPzX24-RKos6MZEeusg@mail.gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [Freedreno] [PATCH v5 0/6] Add support for GPU DDR BW scaling
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
 saravanak@google.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Matthias Kaehlcke <mka@chromium.org>,
 dri-devel@freedesktop.org, Dave Airlie <airlied@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jul 21, 2020 at 10:30 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 21-07-20, 07:28, Rob Clark wrote:
> > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > tree and merge it via msm-next -> drm-next -> linus
>
> I wanted to send it via my tree, but its okay. Pick this patch from
> linux-next and add my Ack, I will drop it after that.
>
> a8351c12c6c7 OPP: Add and export helper to set bandwidth

Thanks, I'll do that

>
> > Otherwise I can send a second later pull req that adds the final patch
> > after has rebased to 5.9-rc1 (by which point the opp next tree will
> > have presumably been merged
>
> The PM stuff gets pushed fairly early and so I was asking you to
> rebase just on my tree, so you could have sent the pull request right
> after the PM tree landed there instead of waiting for rc1.

I guess I should have explained that my tree gets pulled first into
drm-next, which then gets pulled by Linus.

BR,
-R

> But its fine now.
>
> --
> viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
