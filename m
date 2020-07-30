Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15A232B32
	for <lists+freedreno@lfdr.de>; Thu, 30 Jul 2020 07:10:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047F26E851;
	Thu, 30 Jul 2020 05:10:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73CCF6E851
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jul 2020 05:10:49 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id ha11so3551916pjb.1
 for <freedreno@lists.freedesktop.org>; Wed, 29 Jul 2020 22:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=mA4BZd4kK85fl/B02dB2FxAX7zWjXLAMtkaKMXRlAl8=;
 b=QeC5Z4o9gUSaBccsjgXcHVRkllpZndKpz8SQFNaDHEdHlyoajM6S2rNTljlpc+BiJI
 2w8OfDJUIEXOCuHqrkxDWsVhZ/eoKbd4rbVFTbaxqaK3yaXeMKbO/PmumOF+niR8ZAVN
 ecVd7mu0QqOi75ElRfD3aSjjbnrDoATXhJ/yypmCBqgAlGcdYpnC/v8VTSISK4ZAU49s
 hxXK0kmzbG37NsT5PKEdGRMnWARtYMD0WI85tppgoe6x6zkWImbL5A8948ZXJ+s0oIAE
 Em+uNLDw4H7ULrU3hgS4xndgpLkVbM21ntKMONJmJBRjnExddwEPXMLvxRIsyOYz3BPJ
 LqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=mA4BZd4kK85fl/B02dB2FxAX7zWjXLAMtkaKMXRlAl8=;
 b=IY5V5QtRHtcjHekaEgTaYhq1HqS615vyyDdh8JA2cRHDdJo+PXeMWQoRSm7hUWGemU
 +iVUTVqACHbHJ4XmIYU5eGK9UjujalmWGWyYvoQXfmrAwd7V7ja58mm/e9DaM80luTDA
 ospL8j7cYlH58PA7Fx6HBWg27o8mDj4+TA47+ydnraHbC7Uhxy3LPOnsbMlRN6dQO16L
 n5AGU0BRxqnGfr6Zb/cXH0d2VZ1mh+CiULb5jLmkAGoHlYDlLxBZMBgpWVb0+fFsgZRC
 qgfkc9LF49tKTdJl6OlEBI9itWpbDVlose9OJrvOiXFajp2Dl21p/Zcdf289yz9k5b6h
 Uruw==
X-Gm-Message-State: AOAM531Fz15FuyqnCjzhxaNInBeM0CMrySFK5nLARaOZ99kmd0w0ocMt
 OJfV4OKgaBzBurLrdGyWhBG88g==
X-Google-Smtp-Source: ABdhPJwj9HWHtqAFAKHBCLQOJIrgpN7lsfFwNhMzvnaPW201rcxJCVo3jVRneNq0kLb0y1yqbbw/yw==
X-Received: by 2002:a17:90b:94f:: with SMTP id
 dw15mr1393733pjb.209.1596085848986; 
 Wed, 29 Jul 2020 22:10:48 -0700 (PDT)
Received: from localhost ([106.201.14.19])
 by smtp.gmail.com with ESMTPSA id g18sm4341705pfi.141.2020.07.29.22.10.47
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Jul 2020 22:10:48 -0700 (PDT)
Date: Thu, 30 Jul 2020 10:40:45 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
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

On 22-07-20, 11:00, Viresh Kumar wrote:
> On 21-07-20, 07:28, Rob Clark wrote:
> > With your ack, I can add the patch the dev_pm_opp_set_bw patch to my
> > tree and merge it via msm-next -> drm-next -> linus
> 
> I wanted to send it via my tree, but its okay. Pick this patch from
> linux-next and add my Ack, I will drop it after that.
> 
> a8351c12c6c7 OPP: Add and export helper to set bandwidth

Oops, sorry for the trouble but this needs to go via my tree only :(

I maintain two different branches, one for OPP and another one for
cpufreq. There was no dependency within the OPP branch and so I
dropped it that day and asked you to take it.

But when I tried to send a pull request today I realised that one of
the qcom patches in the cpufreq branch is dependent on it and I need
to keep this patch in my tree.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
