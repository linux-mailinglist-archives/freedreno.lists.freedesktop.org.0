Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94571357427
	for <lists+freedreno@lfdr.de>; Wed,  7 Apr 2021 20:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F306E96D;
	Wed,  7 Apr 2021 18:22:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D411B6E96D
 for <freedreno@lists.freedesktop.org>; Wed,  7 Apr 2021 18:22:39 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id q10so13706730pgj.2
 for <freedreno@lists.freedesktop.org>; Wed, 07 Apr 2021 11:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:to:date:message-id:user-agent;
 bh=hi29bvNz3b0h+J1/8SmX9GkZQUb/KXU3bHzILeV7OBI=;
 b=dvwti10imC/5yBGONbIa6fAg6KAoYu+GkfwHaTpGSX9gtutrz8k4U53XVH8MoVEITd
 GR1KVJhoHM+wT5W+Uty0KbK0AEAIn/HWFUqDi6WdOdTZG6uPlMzd0Kfk0j0iLBoDSVsQ
 vIg31AGvFCG4zA4TvRIsdonHJiZecQ2nzu9vI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:to:date:message-id:user-agent;
 bh=hi29bvNz3b0h+J1/8SmX9GkZQUb/KXU3bHzILeV7OBI=;
 b=uS6Gl0iABbiHzjBBoD2OzsqlBRpraKEt7Mku7Gt/NBY6s5oeZMy2VFfQeBeqxXYLg3
 Uf6i5kiJZu2JyC+E/IH650UD5A8RFaIEGJRAUjxMfYuk2DOL3lzpGajwdX99+FuGV/7C
 LMhZ5iRXKr/mF4aX8TrgnSeW4s+R412IXPEkuGGsrkW9b1gOI6VZv9+tqLi4r0I+02Rt
 /gt+K7SjscVdguMqT4KcZsJslPhlqiBCGJoEsjpa15lFnAbc4bnj21tLKjvcngSHR6cx
 IDI9OLB7DCpI7gCSzSDx5K2CsFP3CD3BHyYA2iqPwvUO8Qor8V+tuqVMYLH8EMz4senJ
 7Q2g==
X-Gm-Message-State: AOAM531QQ93di5IgKnH3tfsuwaWa49UA/TWOwBVR5yUQJ+siqSB9df/d
 hIKy3vTdNoaeCGHpMwui/GT5JQ==
X-Google-Smtp-Source: ABdhPJwxFL0jF4wdaX8clJ5o9U99uJkosPvE3LRxErpWbXVIzWrheMp2PxRLqEGQV20+b4QUq6lrJA==
X-Received: by 2002:a63:6ec3:: with SMTP id j186mr4485221pgc.249.1617819759424; 
 Wed, 07 Apr 2021 11:22:39 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e193:83c5:6e95:43de])
 by smtp.gmail.com with ESMTPSA id js16sm5777559pjb.21.2021.04.07.11.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Apr 2021 11:22:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20210407130654.3387-1-bernard@vivo.com>
References: <20210407130654.3387-1-bernard@vivo.com>
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, Bernard Zhao <bernard@vivo.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Tanmay Shah <tanmay@codeaurora.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Wed, 07 Apr 2021 11:22:37 -0700
Message-ID: <161781975744.1883259.13405764054457057600@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm: remove unneeded variable ret
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bernard Zhao (2021-04-07 06:06:21)
> This patch fix coccicheck warning:
> drivers/gpu/drm/msm/dp/dp_link.c:848:5-8: Unneeded variable: "ret". Return "0" on line 880
> Also remove unneeded function return value check.
> 
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
