Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D0556AFC6
	for <lists+freedreno@lfdr.de>; Fri,  8 Jul 2022 03:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5FE10FC5D;
	Fri,  8 Jul 2022 01:31:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2FF310FB57
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jul 2022 01:31:32 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id j193so3565062oih.0
 for <freedreno@lists.freedesktop.org>; Thu, 07 Jul 2022 18:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mGR8qW/qcR3tV8N518zXTOtY5AVTv6L2Gv4vwTMvX2c=;
 b=Ue0qNkMJastmFq+YudyeYt2KIe+niHTqyrivhnn+9BmvMSOmjJzkOt/UBQWfBf2b53
 cC1+vGvZvdYF516WCMQwCHxWN3Q/j7JhyJOecljID8oFeNWFvSQkgWYcRvUfp8fhypoT
 fqeCky+as3DBGScPTDOT6uHMYWv6Qge4d41+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mGR8qW/qcR3tV8N518zXTOtY5AVTv6L2Gv4vwTMvX2c=;
 b=eQJ0MePO1VSSaQWJqeoCyz+EnJzWwWINsDJ7INaEeeFhLjbnwyqSf78hqHWSYtKzf8
 qTvFUmd2bRPurzectCDJJLiJAcFiDdJOVJ+XO2zJ91MGP9EvGLltAyO3kUI0v46ioO/v
 GrbfK7t/t95H8iaw3+DV93Yaf/diDZQSvbF1eG7fLkxmrGyv/IkCE41pestvbJRiYq+S
 +fzcHPnCEf50FHRaV/6qggmpoNKwelwYFxiz9FXECG+yjK6o7SrFDFCFBa/64abgyz19
 i+LpZB4idJgtweBYOlzLSQuDpGqENb1Xj++I0tp/FR41kltqaDSyYxYnRk582BvCxS9Z
 YqNg==
X-Gm-Message-State: AJIora+33jzdrDoTiySzUuKQ+GQz3wS7UdTjXPRpJb0DLyvHg2nTUaaH
 tUUW/9mvW7/jLD31owbFqb8r49BdveQbqs8RKcKIfQ==
X-Google-Smtp-Source: AGRyM1seFnmCmW9IUueoNP90VpqA1jwKAoGBliX7GDJogEyAv6R8J1FU+8CcIIRVxUr4LlXHPKu47wp3cT8ZmPpjRSE=
X-Received: by 2002:a05:6808:171c:b0:334:9342:63ef with SMTP id
 bc28-20020a056808171c00b00334934263efmr498377oib.63.1657243832038; Thu, 07
 Jul 2022 18:30:32 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 7 Jul 2022 18:30:31 -0700
MIME-Version: 1.0
In-Reply-To: <20220707213204.2605816-5-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 7 Jul 2022 18:30:31 -0700
Message-ID: <CAE-0n53ES+cLCWpd_T1bohybNrw4V7ntj87AbsesQJcmFedcgw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/9] dt-bindings: msm/dp: add missing
 properties
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

Quoting Dmitry Baryshkov (2022-07-07 14:31:59)
> Document missing definitions for opp-table (DP controller OPPs), aux-bus
> (eDP AUX BUS) and data-lanes (DP/eDP lanes mapping) properties.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
