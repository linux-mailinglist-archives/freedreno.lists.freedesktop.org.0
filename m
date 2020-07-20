Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D83022272EE
	for <lists+freedreno@lfdr.de>; Tue, 21 Jul 2020 01:32:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFD189DA4;
	Mon, 20 Jul 2020 23:32:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FDA289DA4
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jul 2020 23:32:28 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id k71so650199pje.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 Jul 2020 16:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=+uXLuocAO8lxCToiXlu/ReZ2hnWMT9ytGR6dkaeKVcg=;
 b=L3CaE1u0T+Opv+kLiWcX3Ec5X59jjbA9ANZp1cgG9bOS3DXa2o1L9a9YEcj4cXlKC2
 YpsMhC0kPyoFSgBcTddfFOIKE7LiXt/QMGZWsarCu2NGjirgyXZxVIhiB74qP1gv62v9
 Q1bvn8ox2SETeiMeFmiw8sTgBuT2J4USRqn5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=+uXLuocAO8lxCToiXlu/ReZ2hnWMT9ytGR6dkaeKVcg=;
 b=dLeh/wXCT50HHOQ7Qy1iQuHVzLb2jalocObzFzO3S8YmGRY2xzE/IZaRnnvYTAiZlI
 KPAUsH7jR/f5aun7zXoOYZmrvB4XfpoHV2/zjlzsb/YZev+p24OlSgwrB5QuYxerEmLM
 ZVWtwzgeM3QBiMQ9wqxwzNDLcpXzfjjbgwjfrV77WXpqyuH5ZjJHrPlEMmyYv5XTg3AY
 AypvbPdakmtappAdKxOc9Di5Q1LVXPKh0LmI4hpMabH21+/zhmWaxpb6ROIEUgmOkRyA
 Z/UT8HLUCCo4GhtiCIl8BbKcvwKqBvd98XItCelYec5rQeUdvpmye41tJcC32wnK3fyn
 T/lw==
X-Gm-Message-State: AOAM533+7lR1yj8ketOaQTDrFicl9UDA97OKcr4MxbGemD3PMHeLFQJO
 4PS15U162RCPuFEajEfwfu/TuA==
X-Google-Smtp-Source: ABdhPJyzZqIFkJvQhLWQiuq3uOD8kLbvlBxMBgJb3gbD3D7nIYizU92Vunzu1FrFGUCCZSH/KMaTmw==
X-Received: by 2002:a17:90a:7487:: with SMTP id
 p7mr1715589pjk.233.1595287948100; 
 Mon, 20 Jul 2020 16:32:28 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id a9sm18301137pfr.103.2020.07.20.16.32.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 16:32:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <91a8eef836c1939cb57942c6fdcf2772@codeaurora.org>
References: <20200707184125.15114-1-khsieh@codeaurora.org>
 <159527632812.1987609.6364896740387949838@swboyd.mtv.corp.google.com>
 <91a8eef836c1939cb57942c6fdcf2772@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Mon, 20 Jul 2020 16:32:26 -0700
Message-ID: <159528794676.3847286.1584696687662833591@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Add DP compliance tests on
 Snapdragon Chipsets
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 tanmay@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2020-07-20 15:48:13)
> On 2020-07-20 13:18, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2020-07-07 11:41:25)
> >>  drivers/gpu/drm/msm/dp/dp_power.c           |  32 +-
> >>  drivers/gpu/drm/msm/dp/dp_power.h           |   1 +
> >>  drivers/gpu/drm/msm/dp/dp_reg.h             |   1 +
> >>  17 files changed, 861 insertions(+), 424 deletions(-)
> > 
> > It seems to spread various changes throughout the DP bits and only has 
> > a
> > short description about what's changing. Given that the series above
> > isn't merged it would be better to get rid of this change and make the
> > changes in the patches that introduce these files.
> > 
> 
> Yes, the base DP driver is not yet merged as its still in reviews and 
> has been for a while.
> While it is being reviewed, different developers are working on 
> different aspects of DP such as base DP driver, DP compliance, audio etc 
> to keep things going in parallel.
> To maintain the authorship of the different developers, we prefer having 
> them as separate changes and not merge them.
> We can make all these changes as part of the same series if that shall 
> help to keep things together but would prefer the changes themselves to 
> be separate.
> Please consider this and let us know if that works.
> 

I'm not the maintainer here so it's not really up to me, but this is why
we have the Co-developed-by tag, to show that multiple people worked on
some patch. The patch is supposed to logically stand on its own
regardless of how many people worked on it. Authorship is a single
person but the Co-developed-by tag helps express that more than one
person is the actual author of the patch. Can you use that tag instead
and then squash this into the other DP patches?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
