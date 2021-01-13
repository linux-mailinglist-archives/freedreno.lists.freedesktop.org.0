Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3B82F5411
	for <lists+freedreno@lfdr.de>; Wed, 13 Jan 2021 21:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F726EC46;
	Wed, 13 Jan 2021 20:25:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C80936EC47
 for <freedreno@lists.freedesktop.org>; Wed, 13 Jan 2021 20:25:56 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id be12so1726276plb.4
 for <freedreno@lists.freedesktop.org>; Wed, 13 Jan 2021 12:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=gcin89rV0I7IqOVbv9QUmTeBAufbW/EP7UVT7uECDZc=;
 b=W3/hfnVx1RKsL4BcMpubo4sIVkeHPQNvBiKClmnTGfqiZIKSQNo4mDZfx0kJQnXQm7
 D6jatbyMCWCHJMfpg2HfYmnwgMGkzs5HYGM0kgMjpRA0wpvjZq/pIqVf6PJsRt+Kx6XW
 r/YcVR2l5+N25gm2DaDM+Ap+SK+7GQuvK7rx4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=gcin89rV0I7IqOVbv9QUmTeBAufbW/EP7UVT7uECDZc=;
 b=nc23kThpV46RQ/atyitOUb26IRfSeEp5QQk9rbmjGf49NlCOwQ0Vg7FTWxiJa6430Z
 oNI6cpzs1/+Rk1dBhGPzP1w95uhXocGUSJ+Dp2CmOY8BvGpg28ukslX5ZEj1FFHze+oQ
 ZVJHkmlRuwgIodBxLZHfVIgEUu+JpMijDPxAS+3cSKTVi/DRlyUL/WHjJrktu7IY8rOb
 WoNfaYGHLSeyK0gNF6mbtnln2jt9caGYzgD1j/6O00rsbYyvimaC+yQ6Bbk/49zBjPcZ
 GJa9Eks9VEAkeOsvSpb87QdmNB6C3tBgGtjSeRp+knllPKNiNdd2lowPkjgBM+pRaRcG
 0D4g==
X-Gm-Message-State: AOAM533fhEsrg6nyrdyzVLLsUBrup+UWtLYWJTlEnmnD5Vx4tE9hXaKA
 +1yuOcAKC3gh9LgtcF/ZMgATDg==
X-Google-Smtp-Source: ABdhPJycCWJ3lRjFwltpCDQVyM6m4HdsDCiUKkLSp4ACw4lxoBY0IFDGY9PSQ9YLIGnXpVCrdx04ug==
X-Received: by 2002:a17:902:9009:b029:dc:52a6:575 with SMTP id
 a9-20020a1709029009b02900dc52a60575mr3869284plp.57.1610569556468; 
 Wed, 13 Jan 2021 12:25:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id 36sm3511232pgr.56.2021.01.13.12.25.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 12:25:55 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
References: <1610564400-29788-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run
Date: Wed, 13 Jan 2021 12:25:54 -0800
Message-ID: <161056955435.3661239.1548841852585636847@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2 0/2] fix missing unplug interrupt problem
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-01-13 10:59:58)
> Both AUX_SW_RESET and DP_SW_RESET clear pending HPD interrupts.
> Therefore irq_hpd handler should not issues either aux or sw reset
> to avoid following unplug interrupt be cleared accidentally.
> 
> Kuogee Hsieh (2):
>   drm/msm/dp: return fail when both link lane and rate are 0 at dpcd
>     read
>   drm/msm/dp: unplug interrupt missed after irq_hpd handler

It won't apply to the drm msm tree. Please rebase and resend.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
