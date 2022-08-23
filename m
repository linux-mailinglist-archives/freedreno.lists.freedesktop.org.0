Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EB759CEDB
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 04:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC3878EF94;
	Tue, 23 Aug 2022 02:57:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 083AF12A88D
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 02:57:42 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-11d2dcc31dbso7143201fac.7
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 19:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=k9bh85zEwdXnkIg7OqvJbsldra6EITvqvq3BXqIAXKk=;
 b=Aea2giar/rgR4x1lgytCyCxTVv8f9PDlrDOAdnxyS0IGj61DMS3sV8sanZX2svonJj
 K1oEkGtUtKsI4/pbZQL2I4p8KcwnDbfE6/n5SEAearxyLxGcevAnEyB3PcJ+ER5gf+VU
 uFKzLOQ9Ds264e37UhQhFWu8pF5utN6r2MUAY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=k9bh85zEwdXnkIg7OqvJbsldra6EITvqvq3BXqIAXKk=;
 b=C3Dfb9szluGWZ7pAlJGEhwWWx96yzcI2Nl5hAjS92cv7OyUropcrjaPrOvKDNBRrF8
 YIqudx4kmuUBpsru/AtODJx7VKuz6up5SJERHN38Hu1GbvehGsAsOXqL819jCDYDx78U
 9yOUGP0sbk373z5vZdRU1fUIwY2DHNEWsfosIdrUPVFJb6An2ANq1xhMm6+hZ2iZr/Jj
 aV5BgB6BisqJUzjjh701F9ldCmxh1jZyebMv+vSklkqPYassF/gELjUjWCi05d454z+f
 cFa8UUfnzyohpBj5YTlyK8a0nT3jCLr9WmVBMxcRQ4ZB6KIPfv2drqMA20UoDkRIGatZ
 Mqrw==
X-Gm-Message-State: ACgBeo2vujgUULYPfDde5wXg7A+9wW3yWRL5tkZX75mF3JROCNz7QKoi
 /GUP7TO961xzLWMeIOC4F4HcYpwElS6gurrxhD00+A==
X-Google-Smtp-Source: AA6agR5r49UulfMOnXRzzL5cO1NYpo0SpanybCWC1I8v58Dp0GMjmdbnk5reWM17/kcgTAgkupqBW/lMsNT2CUZwOtQ=
X-Received: by 2002:a05:6870:a99c:b0:11c:2c37:3d03 with SMTP id
 ep28-20020a056870a99c00b0011c2c373d03mr547267oab.0.1661223461927; Mon, 22 Aug
 2022 19:57:41 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:57:41 -0500
MIME-Version: 1.0
In-Reply-To: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
References: <20220822172204.281045-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:57:41 -0500
Message-ID: <CAE-0n53wZLe73-f+zt2kPNWHNp+zGHx127e=gH=Vi+et4aAmEg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: drop unused variable from
 dpu_kms_mdp_snapshot()
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 10:22:04)
> Follow up the merge of address fields and drop the variable that became
> unused after the commit 9403f9a42c88 ("drm/msm/dpu: merge base_off with
> blk_off in struct dpu_hw_blk_reg_map").
>
> Fixes: 9403f9a42c88 ("drm/msm/dpu: merge base_off with blk_off in struct dpu_hw_blk_reg_map")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
