Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E48464E69AF
	for <lists+freedreno@lfdr.de>; Thu, 24 Mar 2022 21:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8A610E268;
	Thu, 24 Mar 2022 20:12:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB95110E2E4
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 20:12:07 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-d4164acd34so6050272fac.4
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 13:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fm33v815cGyvRnZSik/3qfh/le6zz0KlP6K6B+y0Ujw=;
 b=j7BsnOzcEainxu4qHj53ZoSIQjjCWDVI5dpkX6Y3H7F6bGoLg+zwQ1mH1J+hSY+eBC
 fUnpuDvR1s6e0lQ1cGONY7o0FhHRrOtx65byEMhBahgjGMhkzlr4QtW3ds3UgP7X1ZUC
 bGMQzgtuDRbwkG8eX+c81M6n5aYkFSU2zHGkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fm33v815cGyvRnZSik/3qfh/le6zz0KlP6K6B+y0Ujw=;
 b=MY5M5/D4rG6rrL/JfPIYNa7BxiP0wASewF0/20F7vjsnVeCFfDRbHbgUlaFstxvDBQ
 py5/s4HRTzV7xJ4bZBU+mKx/0zSOuFDzrHkkESvXt6zWm4/vCDI29rO+WlXSCoBYD02D
 8btdHXLvdx9L6D8wPF3UGU6esyVVY7BrUmryxS6EsjJ0oQiLGfoFhw7GGjYVudH6EeuU
 KqOdDRniCqnCsjVlZA11PjSaneFr6DrJVLAjYMl46kd3kVILaH1yX2U3Qg6xPFTIy7QI
 Wv8dO9kXz9599e6BRmLc+o4oVyYsx4dh8GVp+9h4iStUB032yqMzfcjaUBCeIQehJc3i
 481w==
X-Gm-Message-State: AOAM531Dx+v3q+h9k8oNFjn4MRG4Z2yCr01f0pjfOH+PrZQ6kWln1yIY
 Q956k7MBartv+DyJ17XCc4jsvMuzAl//ljX4D7CPUQ==
X-Google-Smtp-Source: ABdhPJzKBovD/XnQBM2VJdM2UICBfRNvK7J2MglCmPB4nXDGNIsSoqA1flcavm/5l9LdPtrW0MWyu1WgO4fQQ3UEHWo=
X-Received: by 2002:a05:6870:b69c:b0:dd:b74b:4099 with SMTP id
 cy28-20020a056870b69c00b000ddb74b4099mr3107374oab.193.1648152727293; Thu, 24
 Mar 2022 13:12:07 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:12:06 -0500
MIME-Version: 1.0
In-Reply-To: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
References: <20220324115536.2090818-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 15:12:06 -0500
Message-ID: <CAE-0n519RudiM+BG722M_BKqb=9Qt1rPFH5eYE1=9Lut6H7o4A@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm: another fix for
 the dpu-qcm2290 example
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Rob Herring <robh@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-24 04:55:36)
> Make dpu-qcm2290 example really follow the defined schema:
> - Drop qcom,mdss compatible. It's only used for MDP5 devices.
> - Change display controller name to display-controller as specified in
>   the yaml
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for QCM2290 DPU bindings")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
