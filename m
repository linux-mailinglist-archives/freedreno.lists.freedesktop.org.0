Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F74228FB0
	for <lists+freedreno@lfdr.de>; Wed, 22 Jul 2020 07:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555316E31D;
	Wed, 22 Jul 2020 05:30:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B46036E320
 for <freedreno@lists.freedesktop.org>; Wed, 22 Jul 2020 05:30:27 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id p3so597616pgh.3
 for <freedreno@lists.freedesktop.org>; Tue, 21 Jul 2020 22:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dl6zwzhq+FsMerc9qwgjpE1ja24WRPYdLlSyn3M9Lhc=;
 b=wFYPLNpIceaExhbJzjXzj6tDwJR+E2dHZTr/ewhWaneEnAkKVT4tW3ngs4Ana5WOY4
 JfAbIvMdjf1VIJe9UXtwIm9fjoqxZ4usIYpwHCVaZavJIFFd+fnrU6vME5UiA3OflLMv
 PjFwR9gTJfbDkCNCnxFjdkM5ybfl439hSbbNWHF+AANDuDpkYtixQfBLNPZswGRM2DZc
 A+KAoq8xOpfUBwZcC55ebWCtTICdrxK1ie00kDe8G4+14vi1XxzOFtfhfeTXnUap7efU
 QN1XAOgUSvgdOOotJ2DjwrU3ZOPO07v9BSL1HUBLvu0PwWszIbIqxbQX6Ez2fani/u8w
 0nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dl6zwzhq+FsMerc9qwgjpE1ja24WRPYdLlSyn3M9Lhc=;
 b=SEEm16tqVcYJoWnL/KaKWKNXkNdgZzYoT8pnUXL5BKt0BYTQcpzU9zr5bu/1tPDlJB
 +JvAQKQrTSwRg/r8m235mfMHCnqSZNZ4HV3uDy/tuEycVBiW53b4QwXhhLCqlsOtZgcV
 /pEbU0ync5sKxat690PF7xnh3Qupca1YszjWP/9E1PBrtS37b+Y8mqkrOluEwX8kRp4A
 7S/BrSAnjIj1FcFXDIO5th+hqtQ9AOBHRMWDMwEu8Arcb14IfAhI7gaKZkR0QorEsCYi
 HdhpXtv5FMDboPnFJbjCehaKgvqyihSYf6DKWxGjvcJ1coypF7/kzfnBafvNs1zQWA8k
 uYBQ==
X-Gm-Message-State: AOAM533CG947OIpmGYmqK+fLpFFjGnXDEtgDEqHhS3Vgc6OE6qLK+5fR
 nICUoL5eb2DZdgKius6tPWtHPA==
X-Google-Smtp-Source: ABdhPJwOr+y0DG+QB+DOdgrlRofbLELHLiFlXrD3oG8oQpR/O3B/puROrAIHaF3LxSmr19O0mGHgVA==
X-Received: by 2002:a62:8fc6:: with SMTP id n189mr25703478pfd.10.1595395827137; 
 Tue, 21 Jul 2020 22:30:27 -0700 (PDT)
Received: from localhost ([182.77.116.224])
 by smtp.gmail.com with ESMTPSA id ml8sm4857037pjb.47.2020.07.21.22.30.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 21 Jul 2020 22:30:26 -0700 (PDT)
Date: Wed, 22 Jul 2020 11:00:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
User-Agent: NeoMutt/20170609 (1.8.3)
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

On 21-07-20, 07:28, Rob Clark wrote:
> With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> tree and merge it via msm-next -> drm-next -> linus

I wanted to send it via my tree, but its okay. Pick this patch from
linux-next and add my Ack, I will drop it after that.

a8351c12c6c7 OPP: Add and export helper to set bandwidth

> Otherwise I can send a second later pull req that adds the final patch
> after has rebased to 5.9-rc1 (by which point the opp next tree will
> have presumably been merged

The PM stuff gets pushed fairly early and so I was asking you to
rebase just on my tree, so you could have sent the pull request right
after the PM tree landed there instead of waiting for rc1.

But its fine now.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
