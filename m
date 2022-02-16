Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 098A74B7D02
	for <lists+freedreno@lfdr.de>; Wed, 16 Feb 2022 03:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AA110E5F8;
	Wed, 16 Feb 2022 02:01:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E5310E5F8
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 02:01:56 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 u25-20020a4ad0d9000000b002e8d4370689so827144oor.12
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 18:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6Wmbu3EJTHz1mNI3CkkV4P0E8zKS2lBcLvhz8h1rG/s=;
 b=kE+NAUbJwM+UndQVoL3vCSB0zGnXd2EIJtE1hcSIeXu8C+PBIO/aeF1Gm0Td2qWuw4
 XYYdOl/rc+lvtXjcBK1uZNOAaKiJVHEObDo/QCjOJDF7HZOLrkpFeY6at9diZvEDsPTC
 6fMp3v7z7u2FUh6HdKHKhFpNni6FLI06GdY0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6Wmbu3EJTHz1mNI3CkkV4P0E8zKS2lBcLvhz8h1rG/s=;
 b=ItQJt9GYZgkVlLSq+B8g2VV10m8VBO0ZeVlCM9nxTgAxJ5APBD2MY/04bqPUW3smcj
 XjmdleEsg9DQ7e5bxbOTDGRyGDmmnmQp4SSimD96Rdjot5P1/PH81RpEPqL/37khIDv7
 AKMlS0RmUaAqxvpoAW0YutbzeW3C+EfNY6xtRZZfBdaQx2afeau3rZvImyBDPjU00Z8L
 /HZG2zPavztNpPmUGP2Rr7BQa2HtVbsAyeVtrTB2qJfy2zcLZeQgdcsedIOCyrfNs9nI
 pBuz0U9ozBBTV7Ii5xgUtQF5wYkEDiQgHEKiz/SMpPw8uzrAo5qz5VQUe+NqBlvOJxXJ
 dEcQ==
X-Gm-Message-State: AOAM531P/DWH4yUT+L8gOVJyxpMgUcRCPDD1YJPJVlbXuZX+pTwr9pD8
 ORRgeaCnpk6bKNtS91OGBCj/YA81sZHIjFTD20DkgA==
X-Google-Smtp-Source: ABdhPJwyPrbG3vOYY4Y2pjmlb3uTOssMjvoo873FPyIiobvt4UggvDXlixGwmrkAC22KDEsUvZPcsCX7qtF8dAKGDzo=
X-Received: by 2002:a4a:d58b:0:b0:319:8746:ac3e with SMTP id
 z11-20020a4ad58b000000b003198746ac3emr208922oos.1.1644976915579; Tue, 15 Feb
 2022 18:01:55 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:01:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
References: <20220215145306.3470924-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 15 Feb 2022 18:01:55 -0800
Message-ID: <CAE-0n51aBW9NZWqH4FQsK7_Uif1JtbORdrVXVz1p10c-b+Mb2w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: drop unused access macros
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
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-02-15 06:53:06)
> The access macros BLK_foo are not used by the code, drop them.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
