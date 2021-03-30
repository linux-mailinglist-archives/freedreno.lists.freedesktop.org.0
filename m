Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BDE34DD91
	for <lists+freedreno@lfdr.de>; Tue, 30 Mar 2021 03:31:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5D46E7EF;
	Tue, 30 Mar 2021 01:31:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 109206E7F1
 for <freedreno@lists.freedesktop.org>; Tue, 30 Mar 2021 01:31:50 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id y2so5297319plg.5
 for <freedreno@lists.freedesktop.org>; Mon, 29 Mar 2021 18:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=VqsB/KspzBLfleMt3X13JmN72hr7Ivn8/G3NW35scDU=;
 b=oRBLwNnRiMTNEnj51Rq5J4ROOQVEMOXQc65rWkdsGb61Eb9XiBO4U7R1oLHxuk76VD
 FyfJin7DBYDeLTSb9LU1SeGd6S74jUTts+u9bUreWZZ35CKoPhBAcb6P0SNGXH3k5YD/
 bOK85QLLJDWXsqtcSwXKaBRpouNUpmItdFAHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=VqsB/KspzBLfleMt3X13JmN72hr7Ivn8/G3NW35scDU=;
 b=rDOuoZQWCl8c8vyy8jAdUKyf6MnM1hiuVYQebln5DL3yvZ0RuvN0wFQtjsg5tWlfzR
 DY5bCWx9HKsVRaRBeftpYCFDLSgd0pVfErq2dP2+3zNI+0PCKRcWl/GKS757CbH5t4iE
 Y7ynSNbRkdqoB3/GRBQIkoJdYRfEshRZSI6fnxL374Bn7x8y319BNC78iELjVSfr1NjK
 O31/8Dj8JMNLmzWrYomvkCfhmVQU6l3jan5u0r5lEaWuZwfyM7xNjAUX/h6DWRxUfO6z
 RPzi0j79GK8uy92Bkr7DtfWFazWdT8rsCj8/nEj61LoCS8qn8R1JFIU5Ch8oHytLTcI7
 xZeg==
X-Gm-Message-State: AOAM532inVgMjFHJtXf5xmoC5UYiI5tntEaxAtWowX4pLYNwzIL8cZeA
 tOU4hJhkSSaU6ykJQh7WS6Ou0A==
X-Google-Smtp-Source: ABdhPJzTWrDchk39egDoT3Ebv23CG0wZ+YVzjMmD32zht97vToqfNhx8RT3pByjL1TOX4a53kpISlA==
X-Received: by 2002:a17:903:22c2:b029:e7:1f02:434c with SMTP id
 y2-20020a17090322c2b02900e71f02434cmr19483596plg.73.1617067909560; 
 Mon, 29 Mar 2021 18:31:49 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:4091:2b37:966b:1fca])
 by smtp.gmail.com with ESMTPSA id k5sm18792164pfg.215.2021.03.29.18.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 18:31:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
References: <20210327110305.3289784-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Mon, 29 Mar 2021 18:31:47 -0700
Message-ID: <161706790759.3012082.10513147344813330034@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v3 00/25] drm/msm/dsi: refactor MSM DSI
 PHY/PLL drivers
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2021-03-27 04:02:40)
> Restructure MSM DSI PHY drivers. What started as an attempt to grok the
> overcomplicated PHY drivers, has lead up to the idea of merging PHY and
> PLL code, reducing abstractions, code duplication, dropping dead code,
> etc.
> 
> The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
> 28nm-lp) and lightly tested on RB3 (sdm845, 10nm).
> 
> The patch 'clk: fixed: add devm helper for clk_hw_register_fixed_factor()'
> is already a part of mainline as of 5.12-rc1, but is included here for
> completeness to fix compilation issues (as msm-next is based on 5.11-rc5).
> 
> Changes since v2:
>  - Drop the 'stop setting clock parents manually' patch for now together
>    with the dtsi changes. Unlike the rest of patchset it provides
>    functional changes and might require additional discussion.
>    The patchset will be resubmitted later.
> 
> Changes since v1:
>  - Rebase on top of msm/msm-next
>  - Reorder patches to follow logical sequence
>  - Add sc7180 clocks assignment
>  - Drop sm8250 clocks assignment, as respective file is not updated in
>    msm/msm-next
> 
> Changes since RFC:
>  - Reorder patches to move global clock patches in the beginning and
>    dtsi patches where they are required.
>  - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.
> 
> The following changes since commit 627dc55c273dab308303a5217bd3e767d7083ddb:
> 
>   drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume (2021-03-22 18:52:34 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-3

I tested this on sc7180 lazor and the display comes up

Tested-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
