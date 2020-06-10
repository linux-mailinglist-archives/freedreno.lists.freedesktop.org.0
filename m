Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 529F41F4B4F
	for <lists+freedreno@lfdr.de>; Wed, 10 Jun 2020 04:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972F26E197;
	Wed, 10 Jun 2020 02:20:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5566E1B9
 for <freedreno@lists.freedesktop.org>; Wed, 10 Jun 2020 02:20:56 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id y18so350896plr.4
 for <freedreno@lists.freedesktop.org>; Tue, 09 Jun 2020 19:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=dC9/KQFuZY34yyqjXgNCYCIKz+z0z+M8UxzxcZfntAU=;
 b=LshfhBDcAKWKw+BwL1711CUtdj63qrkSDCAl1hU9a4s8T0Drnxqgtvu2sGmOsJJ2yl
 hhnoTDwRU6tZveA+vXZWA7u1LgoUgm7DV4DVmTHTRN8gEI2fuqMAjW+hkOhnQRcep6A+
 esCNzWyueKfigoevJr9Sf8d9sDZ06p66fvk6M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=dC9/KQFuZY34yyqjXgNCYCIKz+z0z+M8UxzxcZfntAU=;
 b=nnXeTsOJ+ZDb9NjKTl/JLSzEZChLKCdScPWqwgMS8YEh3JtX517Tj7uJ2MMz43iRSE
 wmXniRgN6nOPDoQQXpHh4zYY9IhVovpSkZA3C7XLjkqQU1G8MTHfY5e8suYQ5Kp1MC6e
 xiRKOKXf/B7/WLeCMIiCKkmhgBw3ni6QhlFTpLrmzBptbA2gbhhraTijBK21xaHG4q5x
 sx8yLEzpJJdPpmI7NOvbTJC8zcYFhibBgmy81kXHUNYJBKDsNaYLDaxK8zWhtc/TQcgb
 txkzuSuR51hD20x1yMSnhBYlhAj0nsqPqUNQ96sAc/8kchb9a8VugGszBZNPtGXmF/Kg
 y+kA==
X-Gm-Message-State: AOAM5301pZp5Xm6r8RaMQVaTITHkNWTEluiSE7cnl+81ff8RMXwpUKE+
 v0Qva2pnZGTBa15imaeNqyZLhA==
X-Google-Smtp-Source: ABdhPJxmED+EAnYjUtWkB7dB6RYq/eITyPggCRbENMcrnsfK8Hlc1oCgRoX7471ZCmTD51mFldzUag==
X-Received: by 2002:a17:902:aa88:: with SMTP id
 d8mr1082183plr.257.1591755655666; 
 Tue, 09 Jun 2020 19:20:55 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id d2sm9249070pgp.56.2020.06.09.19.20.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 19:20:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20200609034047.9407-1-tanmay@codeaurora.org>
References: <20200609034047.9407-1-tanmay@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Tanmay Shah <tanmay@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Date: Tue, 09 Jun 2020 19:20:54 -0700
Message-ID: <159175565407.242598.7527036274929582020@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Subject: Re: [Freedreno] [PATCH v6 2/5] drm: add constant N value in helper
 file
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
Cc: sam@ravnborg.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 nganji@codeaurora.org, seanpaul@chromium.org,
 Tanmay Shah <tanmay@codeaurora.org>, Vara Reddy <varar@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-clk@vger.kernel.org,
 chandanu@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Tanmay Shah (2020-06-08 20:40:47)
> From: Chandan Uddaraju <chandanu@codeaurora.org>
> 
> The constant N value (0x8000) is used by i915 DP
> driver. Define this value in dp helper header file
> to use in multiple Display Port drivers. Change
> i915 driver accordingly.
> 
> Change in v6: Change commit message
> 
> Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
> Signed-off-by: Vara Reddy <varar@codeaurora.org>
> Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Can you resend this series as an actual patch series? None of the
patches have the proper In-Reply-To headers so it is hard to track the
thread.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
