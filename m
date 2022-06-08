Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C20A3543DF7
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 22:56:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1AC11A0F6;
	Wed,  8 Jun 2022 20:56:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6271F11A13A
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 20:56:35 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-f16a3e0529so28801981fac.2
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=uoflk9ZD42yTqlWFFFtt2B3OyFO93fCK9K2LB5UTMT8=;
 b=mspAVxZx07cISScTn8vphHUwaC9+I1lJP/rNe4vCeLEPkIMfrye3kzXFsg8y30kNUQ
 E8axWJREnFK7kgXPPdhb40iW94D8vS94Xa+Q1cGSDK+kpoAIHLcEnO9xUwW2BqULnlQt
 JgsziaHWOF+CdH+0ugkPKHjk7GSuBnZrUas/E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=uoflk9ZD42yTqlWFFFtt2B3OyFO93fCK9K2LB5UTMT8=;
 b=8J+4ODgizBCVqQgkRdAj2phQA8+jrYz4V3RXBLK4a8Q4YF/9r0EkYrKxRuJ3P7elEx
 6QBDvJ19Kh1wy9Fle6ZjCZ0tKSwbM8mb2DxB+aeraLcTXnE2apPAqXyl3HhTkR+5R1Ww
 EzE7NNM2C8MibxTlWCFo2B/w6BZeYaNGwR7Iyc8Kj3NuNzif5Mn19XHgW4WcrxjQA5hV
 DCP707J+v1IZG5FlGHLtdxe1MFWx0kEV9p9GLvMoL94A9+fcA3qo66yIEcADiFvDpjyG
 Ei8iBw06X/31aomGKqgMrx7E1Cx4JNPfqxGHBfMsq+w7JC3oJbPwYRB5Pts9OMp5YyK6
 zFVw==
X-Gm-Message-State: AOAM532+7vPKmxHWpLkxpcI483n48Rs+EjDk7At339ykFOQx2pacWDQF
 cRScUXhmQPAvJeaNwxPE8sokit0MfXvrh52yk0oCCA==
X-Google-Smtp-Source: ABdhPJyIaQ3UiUYUvaiSPO44e3POU/qNgkGu5ZFpgew9NSUx88rB+R+DEX5E3FMCjq8MpcqYcFKBsJcgHwyAMwkkIzQ=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3367934oap.193.1654721794575; Wed, 08
 Jun 2022 13:56:34 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:56:34 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:56:34 -0700
Message-ID: <CAE-0n53UGHQXcU++xk+sXxNTg78_Na=Cw4Jjtmn_JtknW=r+5w@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 02/12] dt-bindings: display/msm: hdmi:
 mark old GPIO properties as deprecated
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-06-08 05:07:13)
> Mark obsolete GPIO properties as deprecated. They are not used by
> existing device trees. While we are at it, also drop them from the
> schema example.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
