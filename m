Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DCA279793
	for <lists+freedreno@lfdr.de>; Sat, 26 Sep 2020 09:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D0F6EDB4;
	Sat, 26 Sep 2020 07:41:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E9E6EDA6
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 07:41:17 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id k8so5264697pfk.2
 for <freedreno@lists.freedesktop.org>; Sat, 26 Sep 2020 00:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=OaqWuxy2M9eImPpuAf5glJGxxD92OtFncd8r97AgYM4=;
 b=O0dm9hMEqc1vEs0A9s9u8sPtT4XYPZ+egumnSlp7wUZCtw2BJSRbP/BmWpow8IJPxL
 Xr4GAJvwYtoZjZdrGgwyAlfx6tFy5hmlmjfsBeeKYS9zlsvk3uFiD3LvQqHc/Uy+OV6p
 nQ0seqgfAIQ5iuHLtYk83rKNW9diUkuC+45Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=OaqWuxy2M9eImPpuAf5glJGxxD92OtFncd8r97AgYM4=;
 b=PEXM3fWHgzKqx6hDpyMKDHSXAwp0pKk+Vi3YktsTegX1Q6cI3bgx2Wy5OcBtTzim2R
 zATKhgg5B9fTgIq1OYLKDr0U16d60sCbkUYkwq80IkWCW5xvnmxpAybDcdzNKJ99bctp
 JEUSugzUgYIchWcarf7pYtQo//bxGfyC/c95zFpKrxFpElicx8Ot8DB8jU8bTLzGjzo9
 Z5WZIH4AQEun9kqSzVlNLJJ3dOSpMz4L48wMM+yXVapU8VLiY5OKlNxzbaJLL6lu17PZ
 yf1sGdVU2I9F/GeQbZnGhKG3puEItM1zJfduZdt4nF7lW/JV89//5gezSWVdb3lDXEM3
 7NLw==
X-Gm-Message-State: AOAM533wVMkyx8HvyLmGDd86+HHQ5AOimGm/8cBnBb9vErWzTf9e3TQX
 9AMPcVw89knKH5Pk/KQd0UBuuw==
X-Google-Smtp-Source: ABdhPJzEAKDRyk+rvxA2q8CkeH8Jl0KDYYDLphxH3dmvJ35XQzgM6LZvJ3fC1/ASAZVYwNv2FOMcew==
X-Received: by 2002:a63:490d:: with SMTP id w13mr2027849pga.24.1601106077143; 
 Sat, 26 Sep 2020 00:41:17 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id m188sm4836662pfd.56.2020.09.26.00.41.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2020 00:41:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200926025512.15145-1-abhinavk@codeaurora.org>
References: <20200926025512.15145-1-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Sat, 26 Sep 2020 00:41:15 -0700
Message-ID: <160110607539.310579.6954031617378004352@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dp: fix incorrect function
 prototype of dp_debug_get()
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, khsieh@codeaurora.org,
 robdclark@gmail.com, nganji@codeaurora.org, seanpaul@chromium.org,
 tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2020-09-25 19:55:12)
> Fix the incorrect function prototype for dp_debug_get()
> in the dp_debug module to address compilation warning.
> Also add prototype for msm_dp_debugfs_init() for fixing compilation
> issue with other defconfigs.
> 
> changes in v2:
>         - add prototype for msm_dp_debugfs_init()
> 
> Fixes: f913454aae8e ("drm/msm/dp: move debugfs node to /sys/kernel/debug/dri/*/")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
