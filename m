Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F541F8DB1
	for <lists+freedreno@lfdr.de>; Mon, 15 Jun 2020 08:23:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDC0B89DA7;
	Mon, 15 Jun 2020 06:23:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A4D89DAB
 for <freedreno@lists.freedesktop.org>; Mon, 15 Jun 2020 06:23:03 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id k2so6343313pjs.2
 for <freedreno@lists.freedesktop.org>; Sun, 14 Jun 2020 23:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WMjD/jZlOfc+fAUGkEXl65YinbY+zUt21mw95ubF/dE=;
 b=xAMaUePfDuF1ThufwZJVKKONMJOKTRJMWdqyRex3kVGyC4Ae+LSjrM5isO8bSYG4RC
 H90sidjDOXbdpTHi+bJcCFM/uOg+r7xBNvV3xd+ZbEbocn7F6U/35rN2V0mUCsXA47By
 Jdj4o82R9Lo6E1/8vlXj2hzNBto0oz6tcKcpPiX9iHpYNFGss4IfNLZVRLlr0/i93SSg
 fZHPRAzUXx8wBs1rQ5jNkFR2/8E8bEeicYGHurL5CvDP60rQncwkVmuSc6f9mtIs1mRA
 bIJIJ/VD3ViU3pSHJZuNRAkSH5ZmAS+Q9xVNNlpXSUMopHnHlq4yszjEgLRsImtd/5rQ
 2wsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WMjD/jZlOfc+fAUGkEXl65YinbY+zUt21mw95ubF/dE=;
 b=k3RaK7kAv3vk0ogHEC9xPwb6bnX92Dj1cTUwdZspz0y6hgWroPqe/D0jozrxbccxi9
 XQoZv3Lbwl2fivvWl5hqYNK4fEDjk1N63Pf8CDLsDzfDIhZUlgoA9hXHsvLznQz6ptHj
 dOnilUWYUSV2IQPItPw7PGp+Tawe3GxT7kMg8oIZIOCZODRRCmKHNQFWvil/QUWSDeXu
 AA80dSXz69USPMNP16fCjAi8Hs4GxgYBm39b5hlq+TZSF4IeTRew8ErOB6IltuiNwmDA
 jn6PNxKGkc/oCSpakZcEkO75zCbHMYT5dRsO6FrkY6w03b6p9/VMGZkGzU8KzxuCkuIF
 RVGg==
X-Gm-Message-State: AOAM5325pa8zcX7gYSx7BOwaySD2zKykwoXnbm00m8FeMmsV7CeHCsSC
 F2S/bQ2EaSuj9bysZ0UTL75z5Q==
X-Google-Smtp-Source: ABdhPJxwAMo1y8FPHgLT09IPRRljmFY+jBUdhioK1x+wI513O4XnacM1ENl2wrU/w3tubtWxTPXQWw==
X-Received: by 2002:a17:90a:c797:: with SMTP id
 gn23mr10283076pjb.165.1592202183152; 
 Sun, 14 Jun 2020 23:23:03 -0700 (PDT)
Received: from localhost ([122.172.62.209])
 by smtp.gmail.com with ESMTPSA id a29sm12389483pfg.201.2020.06.14.23.23.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 14 Jun 2020 23:23:02 -0700 (PDT)
Date: Mon, 15 Jun 2020 11:53:00 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Sharat Masetty <smasetty@codeaurora.org>
Message-ID: <20200615062300.3g6rhcovbe6kssag@vireshk-i7>
References: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH v3 0/6] Add support for GPU DDR BW scaling
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
Cc: devicetree@vger.kernel.org, saravanak@google.com,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 jcrouse@codeaurora.org, mka@chromium.org, robdclark@gmail.com,
 dri-devel@freedesktop.org, freedreno@lists.freedesktop.org,
 sibis@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 06-06-20, 09:55, Sharat Masetty wrote:
> This is a respin of [1]. Incorported review feedback and fixed issues observed
> during testing. Picked up the Georgi's series from opp/linux-next [2], and this
> series is also dependent on a helper function needed to set and clear ddr
> bandwidth vote [3]. Patch number 4 in the series adds support for SDM845 as well
> but its not tested yet(WIP), but the SC7180 patches are well tested now.
> 
> [1] https://patchwork.freedesktop.org/series/75291/
> [2] https://kernel.googlesource.com/pub/scm/linux/kernel/git/vireshk/pm/+log/opp/linux-next/
> [3] https://patchwork.kernel.org/patch/11590563/

Had a quick look of the series and looked mostly fine to me.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
