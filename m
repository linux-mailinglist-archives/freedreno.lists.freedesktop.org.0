Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3731652E110
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 02:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2D5710E376;
	Fri, 20 May 2022 00:19:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D27DA10E376
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 00:19:36 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so4599443otu.4
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=irN92Flw/oZRU+x5GvQi4pA44xQS8ZN3dr1edb8S6XU=;
 b=HGmiyVOkhBJDmzZbHsBdDQPMTdh7tlbynY1O+Qm52VOxPAropp+cPDETfpDtPt48DU
 RODqSYH756xQHht++4zfJUAYHURG5zrONEB57fC7jMMRVH1lzKqL+ZLe78X8Q/kitsqq
 03/FqjDCO9oFUM9RdDZ5MiVcmYH08mkXqcoac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=irN92Flw/oZRU+x5GvQi4pA44xQS8ZN3dr1edb8S6XU=;
 b=Z839skMBd4ga6KfMQ5qhExGGfum89+xDBNWnjUIIPVdhIz1D1VNfWHqiUW7YSg8ecs
 Ung4nKd0k+lInAxgZqQiKbK7XEIGAxG9eHXMyqBJDI/cuEOiuustpHW6U1FWJ0VHXWqD
 NAvwwQpi4v6+nS/KkFyQvxuNotqkZ7GkkE7ufcqJ8qeoNOpMYpbd91YSa3qOXNXSjzKl
 rW0twcE45c1G4GDl0nwioAu04irtNaQ+katJNLemqjXvsE0tTN10SB1xGttBSw+ht4Ex
 qpJmbf656cpXTxilDusCmyd2clfNBDkeoYAite2fgsmtgF30zFYbFo5nRWcERGwmOTsF
 CvZQ==
X-Gm-Message-State: AOAM5331NIinTLdxQSv0g2Ta8ksYpekyuHNcev/NpBLVg0z8QGoSJHZS
 5VCmoHL7J7G78ywZWj84MH+YOptV0ovyWUJIP0RUQQ==
X-Google-Smtp-Source: ABdhPJym/G8+304YgHxkp02EOBkIdEUGSXWtylPSqsACNEbDFVSAvLIxO87X9cqUpNTs6/nLv8CeLcHqq7+/vchVze4=
X-Received: by 2002:a9d:63cd:0:b0:606:9e7f:79f8 with SMTP id
 e13-20020a9d63cd000000b006069e7f79f8mr2963568otl.77.1653005975978; Thu, 19
 May 2022 17:19:35 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 17:19:35 -0700
MIME-Version: 1.0
In-Reply-To: <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
References: <1653001902-26910-1-git-send-email-quic_khsieh@quicinc.com>
 <1653001902-26910-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 19 May 2022 17:19:35 -0700
Message-ID: <CAE-0n52yT6S4TLpc2e2-kkbMB2Fu2PcZskG-ZFLo7y1YVTyazQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/3] phy: qcom-edp: add
 regulator_set_load to edp phy
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

Quoting Kuogee Hsieh (2022-05-19 16:11:40)
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..78b7306 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,14 +87,19 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       for (i = 0; i < 2; i++)

Use ARRAY_SIZE(edp->supplies)?

> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
> +       ret = regulator_bulk_enable(2, edp->supplies);

Why is ARRAY_SIZE() usage removed?

>         if (ret)
>                 return ret;
>
