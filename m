Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 722831B6A15
	for <lists+freedreno@lfdr.de>; Fri, 24 Apr 2020 01:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AFD36EA4D;
	Thu, 23 Apr 2020 23:41:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A856EA5B
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 23:41:33 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id 18so2637943pfv.8
 for <freedreno@lists.freedesktop.org>; Thu, 23 Apr 2020 16:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
 b=jUVhZMwkNiCZgtMssvAQEOCuMI34GiHeO2OcbYFNA0MO2tPfgE3ecSGPvuR4DPi4rw
 nrDqAIP+/voLFN3dUnkLv0OMk3nDYNqW8jwkBtqhMo4F2DCygEWZMgmz9XH5/kNZc0bd
 GWIkMaBex51qJfiKuQsvPBcHbWzw3cikkvWe0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=UvY6yRSr9LoxwMbjAv+ye5C9hpbZ65HCNFVPFwYb5gE=;
 b=HlT9JELtLiQvq0NqCPrmR6EIn16Cd5IANg9PpgOXerySUQajdDLDD14UsmWV03U7Vy
 GAuL49d0RIXQWkvDsGHNy9Is113FQP8vpZ8qAkGywyEiC8b1gNmBft2AdAKFGwfLXG+9
 vVOQNi0jl7wSLMiJ6zQ+eiBBaWuxtEpKbz5/z1+NZuQZcOROyrSxAYRjbv8DaKtPpuNa
 CMOeLWh+UFyTliqS7i1dAAF1YK2AY1lCSZN79qXCNaxrVgRtrB+PyTid235et4Qta5Ss
 kqCsOJtBvzPZ1yqK69HDTmcTdaPCd3RrVPG+llZIG0IzymmkoWuOIuxuP0wUbtWuFzsb
 HdtA==
X-Gm-Message-State: AGi0PuZj/f8lMCd9RjplFQ3BgHqhmC3ayi6Zyr3HZ3Q4S10qy9YKD8qU
 NfNPqDCsgrbpcllwRCOXXvAtvg==
X-Google-Smtp-Source: APiQypL/1HUpGNgMyu557lD7TWDtpCq8eHWZGde9uRaxlMdNp6k6YJ/zYkJ2Q2VQfzwQSkKLN4Cvvg==
X-Received: by 2002:a65:4641:: with SMTP id k1mr6634067pgr.406.1587685292738; 
 Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id h193sm3755976pfe.30.2020.04.23.16.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2020 16:41:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
References: <1585701031-28871-1-git-send-email-tanmay@codeaurora.org>
 <1585701031-28871-3-git-send-email-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 seanpaul@chromium.org
Date: Thu, 23 Apr 2020 16:41:31 -0700
Message-ID: <158768529129.135303.14920680590198766597@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [DPU PATCH v5 2/5] drm: add constant N value in
 helper file
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
Cc: abhinavk@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 hoegsberg@google.com, dri-devel@lists.freedesktop.org,
 Vara Reddy <varar@codeaurora.org>, jsanka@codeaurora.org,
 aravindh@codeaurora.org, linux-clk@vger.kernel.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-03-31 17:30:28)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> The constant N value (0x8000) is used by multiple DP

There's one driver using it, not multiple.

> drivers. Define this value in header file and use this
> in the existing i915 display driver.
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
