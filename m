Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5780459CEE1
	for <lists+freedreno@lfdr.de>; Tue, 23 Aug 2022 04:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ED6D112621;
	Tue, 23 Aug 2022 02:58:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA44192E5F
 for <freedreno@lists.freedesktop.org>; Tue, 23 Aug 2022 02:58:15 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id o184so14534141oif.13
 for <freedreno@lists.freedesktop.org>; Mon, 22 Aug 2022 19:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc;
 bh=Svo0VGhlNsAjRUEIv2HFN82q65Tj9SoA9pghjvSW7MI=;
 b=l4gsy/Cqtu0Ddtr5c0Mw1W6jT9cH4cG+2aDIDHRWR01eumWvfXL5BWx22Th+luIvZp
 yXfVd/YyoBs4Opw8G5MEdcqufPqLdg6SEpWCB7UTX+PuUhXz6mlN0OL8lblsa6AXzKEm
 qFQB9RQrT8mHOn23ZAwZQwXRqyOrGinQwgnvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc;
 bh=Svo0VGhlNsAjRUEIv2HFN82q65Tj9SoA9pghjvSW7MI=;
 b=b0YVTTG29icy3lwoqv1ZOdEL/9Q1gWeWdu0VVS0KIQWF3RFkxUDhsrdHxXWglTS8Q4
 RUYNF+EBhJCMfGvtB4sjmcqJuarRPLoR/JLlXUs4Zk6vcqq1EBGcVL5YOYIuvmcwRgQW
 ebGyGqiWZRq2QmIQ4gVXm/OwjUm2Y+uA1PBhLC50oUhx9QC/ZaEavxkVrY2yh8S52m58
 IuqzGEe/Vji19mJ4RMz0gbMJ8VtFwYZ13nyaXsXWHTwHns5ofokC1+scTWfVz9ytBFFP
 uGKte2BTW70zjYIkT/FC3C+blaN8odVqn5L3jgxftDrlS5hvzEeIT/zh4xEnKmBxCmjm
 pKeQ==
X-Gm-Message-State: ACgBeo2GeIrOvnr8cCEVm3l7kd9K29NkbysyTX6frD17LxMQh2KK6CbX
 +SkyP/UaXPNdIAC6U20w5zFjmrL8S9VeEkFF9OeJXg==
X-Google-Smtp-Source: AA6agR6Wi2uGRso3C6MRzWzjATij1xpq9Z5eK8DFfpx6n5awO9yfPC2oMQXAhCtd+xmSU/S7YLGprQPWH9gKZuEtZWo=
X-Received: by 2002:a05:6808:1142:b0:343:86a0:dedc with SMTP id
 u2-20020a056808114200b0034386a0dedcmr513378oiu.44.1661223494913; Mon, 22 Aug
 2022 19:58:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 22 Aug 2022 21:58:14 -0500
MIME-Version: 1.0
In-Reply-To: <20220822184900.307160-2-dmitry.baryshkov@linaro.org>
References: <20220822184900.307160-1-dmitry.baryshkov@linaro.org>
 <20220822184900.307160-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 22 Aug 2022 21:58:14 -0500
Message-ID: <CAE-0n53oO8BNA8BLFP3cnQQ4GnknOJZwxgPUb8wR8tphPY6yNA@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/3] dt-bindings: msm/dp: mark vdda
 supplies as deprecated
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-08-22 11:48:58)
> The commit 85936d4f3815 ("phy: qcom-qmp: add regulator_set_load to dp
> phy") moved setting regulator load to the DP PHY driver (QMP). Then, the
> commit 7516351bebc1 ("drm/msm/dp: delete vdda regulator related
> functions from eDP/DP controller") removed support for VDDA supplies
> from the DP controller driver.
> Mark these properties as deprecated and drop them from the example.
>
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
