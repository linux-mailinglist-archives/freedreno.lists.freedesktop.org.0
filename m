Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED30F2335B0
	for <lists+freedreno@lfdr.de>; Thu, 30 Jul 2020 17:37:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DB56E252;
	Thu, 30 Jul 2020 15:37:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43EE6E252
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jul 2020 15:37:29 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id ha11so4861756pjb.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jul 2020 08:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9SEQ1OEv82nHNMdL9SqhRCzSBouc4sokzr4x8Hh1/DI=;
 b=MGZ/ahYtIdiF9ni3ETE3Khx9UnzPeaO4A/M7nSu0MJyY5+bCzMAsEhfkzzy2Gy2vHu
 N6joxF9xSH76v6buIa+i8zHYXDLBXuMJT6TDd7p3WcnMb9N2l3Szxxl333c9/wjLes+C
 KtGkEIWrsimjwMDomJX3xuQeVyWoSYJbL0I3PyBtDVqJClaQgg9l4+QISP2TJ2TKivAo
 prRKjq++Yg1p+fpQMs+eU75sFdgTQy1OezcxkoAtTcQky2LSiVUmrmEZ3bdWem0LD+gh
 BUuZmuoHDN7Lc3ZjsiqvPDeGFq3/uxgCTXRPlI9G52R9C+UxF/divsyP6+uS1leZZniY
 d9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9SEQ1OEv82nHNMdL9SqhRCzSBouc4sokzr4x8Hh1/DI=;
 b=iFi1csBY+duKE1etCpM2uvsQY/XaKfaaLNUY2C+lqnRA7CikTsPzRPiYMdn+TE7fWK
 HftHcn65nPxF4+XB8PNxnQchrQ3p6p/DwjYZAYJtHjg0fW/6CFFHO88pblqawvBURCeX
 uTSz3NoTdBDmPTofmN5WV7ux7z8AdklC3XqEysFT6fngTK71VCQT6F/0epkuvgs43vON
 9BPmMer36mM2skWxLzvcBhwDpAV9smYRj7KkqzPaisBKKsV4lz9Rho7141oUEY2MGVrg
 u2NHKESkjv3Tg0dp2xC+NqQmri2EXjBwE4TwVMUq9OsZ7ZZbRA99WW9cbxQcU6qfSVqo
 0S5A==
X-Gm-Message-State: AOAM531u/yS/UKrgv0w5vjYgP0FLA09m14pf1FwVbthgS1sYqqpCkaTs
 o6OqSl1Uh/Z5NGLI5tySwJ8yhw==
X-Google-Smtp-Source: ABdhPJwQyi8M14QMhOXfHbSaGH7VCYAkvRqASesnwEbOczg1tB8ocLA9RDU1wXDJ/FEr3D1Nv1dW2A==
X-Received: by 2002:a62:520b:: with SMTP id g11mr3981023pfb.168.1596123449285; 
 Thu, 30 Jul 2020 08:37:29 -0700 (PDT)
Received: from localhost ([106.201.14.19])
 by smtp.gmail.com with ESMTPSA id f29sm6943179pga.59.2020.07.30.08.37.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 30 Jul 2020 08:37:27 -0700 (PDT)
Date: Thu, 30 Jul 2020 21:07:22 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <20200730153722.cnpg6n6tnmvjtuso@vireshk-mac-ubuntu>
References: <1594644106-22449-1-git-send-email-akhilpo@codeaurora.org>
 <CAF6AEGtAEwZbWxLb4MxaWNswvtrFbLK+N0Fez2XYr7odKZffWA@mail.gmail.com>
 <20200720100131.6ux4zumbwqpa42ye@vireshk-mac-ubuntu>
 <CAF6AEGurrsd3nrbB=ktZjWfKTNbKwPHYwTFiZdD-NOW1T7gePQ@mail.gmail.com>
 <20200721032442.hv7l4q6633vnmnfe@vireshk-mac-ubuntu>
 <CAF6AEGuhQcRskGhrFvmCf5T3EcZ9S+3LRdZBiaDYqF34yZjd+A@mail.gmail.com>
 <20200722053023.vwaoj5oqh4cazzzz@vireshk-mac-ubuntu>
 <20200730051045.jejrtkor3b32l2qe@vireshk-mac-ubuntu>
 <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF6AEGuzff9+Wy4EHx0aDx1gBzSEGh--yqT5rnwLHp=U6amnyA@mail.gmail.com>
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

On 30-07-20, 08:27, Rob Clark wrote:
> Hmm, I've already sent my pull request to Dave, dropping the patch
> would require force-push and sending a new PR.  Which I can do if Dave
> prefers.  OTOH I guess it isn't the end of the world if the patch is
> merged via two different trees.

I don't think a patch can go via two trees, as that would have two sha
keys for the same code.

Though it is fine for a patch to go via two different trees if we make
sure the same sha key is used for both.

Will it be possible for you to provide a branch/tag of your branch
that I can base stuff of ?

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
