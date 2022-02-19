Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF394BC50F
	for <lists+freedreno@lfdr.de>; Sat, 19 Feb 2022 03:48:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3EE10EB31;
	Sat, 19 Feb 2022 02:48:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FF9110EB31
 for <freedreno@lists.freedesktop.org>; Sat, 19 Feb 2022 02:48:38 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so5836647oob.8
 for <freedreno@lists.freedesktop.org>; Fri, 18 Feb 2022 18:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hPdjDdNadPqSVHbuOnqKmiG3swyOEQcjMi4i43w2HUQ=;
 b=AP5Zj0QHPXzaf68gGt3ocS1GQg9DML587jXkKRiK/42bBTMle2SHr2seh9i+gPvEdB
 9seinr0CYty6KtMIoD4brePKNsuTIcUqYjBaCEVlhvB81XGXtE+uujPwmvAr4zuHwOL9
 KPCJ9jiZ4Oao5Rt2w6zAJbOpdxXxm/K8KMb5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hPdjDdNadPqSVHbuOnqKmiG3swyOEQcjMi4i43w2HUQ=;
 b=bYcKDfjnctRl98FIQ1snM7g3Kt2xPwxNPjLNJk2r2k1NLc2nOFdwa0bT1mtRNWktKi
 r9+rdsj3AFTGLZUTYrLgESzIKZ9oj9vX5r8NLIQm2aRS/J051PClR49NZjHk9oiaSBqJ
 2nx7WSJaCCz9Y3u7Tv0fhNh0vW/vQzxLIDCLngykOdQ1fx8Bj/kx1L/nTYWrOIYR5LcW
 4triRW6sXDybKqLYWolWAM+91qKu+9Z6w+pz5vHMTCns2sJYB1Pxby37lImnsnEBKLUY
 MFx5OU6bc5diQoO6UqQ1UbE9qCFIjbUvkWhZtFrfRbbM3DKBkNJMTT2GW8dukVPBEavk
 6wfw==
X-Gm-Message-State: AOAM533dDMiwzT3ddibteHW5u9fblOuV5Kx4Swm3/xz2A12EuEvmYolu
 gre38+Gi5ggq+F6axg+Hp8jXVa7A3nLxojsWY5+KpA==
X-Google-Smtp-Source: ABdhPJzv3fD/5F9JZh4S7/yrUsbnHaMdSMc+45/Z1gxOvab80lBmoKayst3vo1YUAP6EKGWHGzS/pWyicSgVLN5HgaI=
X-Received: by 2002:a05:6870:5829:b0:c8:9f42:f919 with SMTP id
 r41-20020a056870582900b000c89f42f919mr4196156oap.54.1645238917762; Fri, 18
 Feb 2022 18:48:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 18 Feb 2022 18:48:37 -0800
MIME-Version: 1.0
In-Reply-To: <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
References: <1645133788-5057-1-git-send-email-quic_khsieh@quicinc.com>
 <1645133788-5057-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 18 Feb 2022 18:48:37 -0800
Message-ID: <CAE-0n53oA_1iXq8gt97TOWBBxbLVs7YT338ePaBKaeoQsfX=SQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v8 2/4] drm/msm/dpu: replace BIT(x) with
 correspond marco define string
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-17 13:36:26)
> To improve code readability, this patch replace BIT(x) with
> correspond register bit define string
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
