Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 865334D2284
	for <lists+freedreno@lfdr.de>; Tue,  8 Mar 2022 21:25:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4F410E556;
	Tue,  8 Mar 2022 20:25:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45B110E59D
 for <freedreno@lists.freedesktop.org>; Tue,  8 Mar 2022 20:25:53 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso324608oop.13
 for <freedreno@lists.freedesktop.org>; Tue, 08 Mar 2022 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=2UXmQ50P7tN4nCifSsYLR5v4PC0QeUfNpesrP6Nz2bo=;
 b=UnBlg7FjIvKHdIM/8qFzs/2KBWiZLm7f9JvWz0IKkewxQ1/Zhr7+PheRLI05qkcc+3
 pASI0vapPEsrO9tpxNGtZ5cuekPc76PMGnIKbr9LMSAWUE9pakBEXWOFHi6+roOSpuUa
 QLT1GBBANS6oJ3m42NJnfwcF0Lc38etOsDvJY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=2UXmQ50P7tN4nCifSsYLR5v4PC0QeUfNpesrP6Nz2bo=;
 b=bHq5qhF3JTmweErKkDYdfH6KylADdekVuqgTdAJZgENfDZprqibEqT/ro0+arV6MRx
 XeKYIHek49MgeGBXPS5DzC+UERXlAKgHGDC30AWDLJW0u1mGCXTE19JmmpVcTcnG8g5w
 EqPMmFmy1iTLRIrXWDcrqBZC/TKrHFU5jDcoYztLonMunmascJNUwNDTj5TqBAC6q8vV
 M7bZd4JcijuNM0u2OUMAYEzj1R5NNm9pdxec5RVM8n0tu4cu5cd1fZTK2MlAWxPaH+aZ
 c/YXn3JNhKAWdVoqpv47QUhO1tNEuGmqxhbpggE8bMHb2Tyg58dnzooou2YHktl4J4hJ
 l6bQ==
X-Gm-Message-State: AOAM530ylVo1UgjH40cVCJwtFu+7PenVubUMS7pUVQmTfYSt0OLdJNnS
 jTrhuXcWUmLsPiEoheKKRa+hu7+R/394lztxAm4jtA==
X-Google-Smtp-Source: ABdhPJznHjaBW3HlsoRzKsRdv2O2Pu9HzfsfCXAIfzhdmW0Ezry2PXhAde/tG2cfzvENxhTq1veN8mnHh0KzqzzWoH0=
X-Received: by 2002:a05:6870:d250:b0:da:b3f:3211 with SMTP id
 h16-20020a056870d25000b000da0b3f3211mr3469915oac.193.1646771152990; Tue, 08
 Mar 2022 12:25:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 8 Mar 2022 12:25:52 -0800
MIME-Version: 1.0
In-Reply-To: <20220304032106.2866043-2-dmitry.baryshkov@linaro.org>
References: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
 <20220304032106.2866043-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 8 Mar 2022 12:25:52 -0800
Message-ID: <CAE-0n52wgr-EENZoNKTu5cAur5=f7spxu2EYFUkdKsFF_=q0hQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/5] drm/msm: unify MDSS drivers
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

Quoting Dmitry Baryshkov (2022-03-03 19:21:02)
> MDP5 and DPU1 both provide the driver handling the MDSS region, which
> handles the irq domain and (incase of DPU1) adds some init for the UBWC
> controller. Unify those two pieces of code into a common driver.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
