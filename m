Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FA84C9A8C
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 02:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932A710E1CF;
	Wed,  2 Mar 2022 01:39:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A738A10E4AF
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 01:39:18 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id y7so461301oih.5
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 17:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=E6diWwTXyeBROW+UGxxDyRa540TTA/bBdes9qrLj4UM=;
 b=jClyHtOzmfwF+u9W6xgJR6B6yp3RH6kTbHE29G8BHKgUzCjDDSxB2nN0yjCN3FJpLp
 KIiE6M+zGmn8Eo2R3XENJVQyVXtU8wnePn/LZyhc0WdkbGAeyhi4RS+uSeaDjnc84n8A
 HihsyMdu+/mY7F3WGgT63ly95lVeSlendbVn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=E6diWwTXyeBROW+UGxxDyRa540TTA/bBdes9qrLj4UM=;
 b=txuYp1xpz09XmOqLW3LYTf7C+miPcp0CEkVFbM/Xe3qA9SEDN1WWRHYUTE5gFLUn+7
 TpGYU2sLe2sUAXJ0DJt3I9Uv1OtKW7MVX6yw+1j53ECX4IVzY9dy5FjqtY+ZYKhsLu/i
 iA+rE8BB4ZXKzL812qnaYmlHS8YwNueOe+Bx2F7s5+Zw4DBxET6GvxDeNKm0KEUrIwaN
 hzxstsNmhVTsgPtKWvGFBQVV0otAAoDZZzGNo3Ht5S5wbgbQGpN8Pz6z1zjcRTVGJVW1
 vWgu64wKQUU/V+RwB/71s4+s+lDI98R6SOg8WGXFwoczZXXd3EFpsktktnDGqjrbIjcn
 /nlQ==
X-Gm-Message-State: AOAM533jd1dPCXmtx0KkbrMZFE3zUiRbmZYWBIvYMYh6mUtAZfgub52N
 rzgm1e/z6+yQhSjRWlpDuacwslYPwWW5AxkgISSjAw==
X-Google-Smtp-Source: ABdhPJyVc8mt/2E94etQO2CuebnJCzyKdSVFOgRL21bsaQOZk6+CbkyQqoi5RkRSPudHu38uY0wDaLUvCMtoeKLFGLU=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr15559750oiw.64.1646185158007; Tue, 01
 Mar 2022 17:39:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:17 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
 <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:39:17 -0800
Message-ID: <CAE-0n533xbLE8WTO4YKb0rxa9BRqqdPN65MfNdrtEjXytWtCGA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/5] arm64: dts: qcom: sdm660: Drop flags
 for mdss irqs
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

Quoting Dmitry Baryshkov (2022-03-01 16:52:08)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
