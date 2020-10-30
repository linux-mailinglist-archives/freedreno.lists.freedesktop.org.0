Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4585C2A0421
	for <lists+freedreno@lfdr.de>; Fri, 30 Oct 2020 12:29:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDD966EDA2;
	Fri, 30 Oct 2020 11:29:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1274F6EDA2
 for <freedreno@lists.freedesktop.org>; Fri, 30 Oct 2020 11:29:42 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c20so4997964pfr.8
 for <freedreno@lists.freedesktop.org>; Fri, 30 Oct 2020 04:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4HxPaBB/T+MWPxFKC66xXUgQz4AK1HDV8G0JyKuoUvg=;
 b=t7vRuGsiD6S8SDyDNJjlcW3D8hieb4F/x0gVxEUf+xkByh3UB9sW2pw96lzzu3r+Sc
 V+SrFY6wvz08PUUrq6THVAwF+cugG5vc8oomA26kUp17NY6M2ckqjULm3B3ZkGJnktkO
 SIMxL5zOIB5J87De1aG/WYEx0UOwzgz/lZ+JL09V4ibwDp+FKjA4hn/ylfabNvovQlWC
 eJuwEMYWUjgJtSKqSYdH2kNNfOPHbBtkMmOBTEkdqAAvKGu7FfzI/ujLEq9tQG2cMMBW
 BzHzVflFIBIa+S2SEGutzMb6ivLVH372Vwk41qbEWa56/vLDj0vJfm4tH/NsJnGO/xeM
 2wvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4HxPaBB/T+MWPxFKC66xXUgQz4AK1HDV8G0JyKuoUvg=;
 b=NT1jb8FS1Dld1IG8YLGgBkfsKZ7D+KsVoEnoKhT4rEF0qxQiwoAz4AciNKZN7eK0dc
 w8hRHAH7P7qNGVQQic0g5EjRFOZ1VwdUY/ALGT8CWwMvAa6C3iDHLcu5EX7v/7EQIvhe
 XGfSnFCyVySirYqIIcIpp1GfvTBflvJx4rpT/gvxfeAtQ4vl0VSJkCLKMjUNgNnHUuvN
 HNDbCOX4lpibItQfvCyABC3VlVC6oy3TKV+lwIACXN2gh3qkmXoWSjMooqZwYq3H8R5q
 j196OGjmtwl8s2zi3imt0GhXSFwh/VlqkY7f5k8VrcmPIAoQhZJkV/jkFbyw+7vSDJXc
 iSww==
X-Gm-Message-State: AOAM531bvEc5q241KDIAl+pFvm3MZEltMWX1RR2Q2J3kUXjRlUViSXdv
 SGa1RRomCKyiwklV8L3CiqzX2Q==
X-Google-Smtp-Source: ABdhPJxY5sNazMK40l9kvzCEB3G/fXCnzLJIOMT7lDEBOFXgft5gwM3ZPlv3KogMw+kWQKDSe2XldQ==
X-Received: by 2002:a17:90b:3587:: with SMTP id
 mm7mr2453563pjb.234.1604057381701; 
 Fri, 30 Oct 2020 04:29:41 -0700 (PDT)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id 189sm5632707pfw.215.2020.10.30.04.29.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 30 Oct 2020 04:29:40 -0700 (PDT)
Date: Fri, 30 Oct 2020 16:59:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Frank Lee <frank@allwinnertech.com>
Message-ID: <20201030112938.uyqjvyfuklwjnmvc@vireshk-i7>
References: <20201012135517.19468-1-frank@allwinnertech.com>
 <20201028060613.qva32sirae4dtj6x@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201028060613.qva32sirae4dtj6x@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Subject: Re: [Freedreno] [PATCH 0/3] Introduce devm_pm_opp_set_* API
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
Cc: nm@ti.com, freedreno@lists.freedesktop.org, eric@anholt.net,
 airlied@linux.ie, vireshk@kernel.org, tiny.windzz@gmail.com,
 linux-pm@vger.kernel.org, rjw@rjwysocki.net, jcrouse@codeaurora.org,
 dri-devel@lists.freedesktop.org, gustavoars@kernel.org, sboyd@kernel.org,
 robdclark@gmail.com, daniel@ffwll.ch, linux-arm-msm@vger.kernel.org,
 kholk11@gmail.com, sean@poorly.run, linux-kernel@vger.kernel.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 28-10-20, 11:36, Viresh Kumar wrote:
> On 12-10-20, 21:55, Frank Lee wrote:
> > Hi, this patchset introduce devm_pm_opp_set_prop_name() and
> > devm_pm_opp_set_supported_hw().
> > 
> > Yangtao Li (3):
> >   opp: Add devres wrapper for dev_pm_opp_set_supported_hw
> >   opp: Add devres wrapper for dev_pm_opp_set_prop_name
> >   drm/msm: Convert to devm_pm_opp_set_supported_hw
> > 
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 +-
> >  drivers/opp/core.c                    | 80 +++++++++++++++++++++++++++
> >  include/linux/pm_opp.h                | 14 +++++
> >  3 files changed, 95 insertions(+), 1 deletion(-)
> 
> Applied. Thanks.

And I have dropped all of them based on the discussion we are having.
Thanks.

-- 
viresh
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
