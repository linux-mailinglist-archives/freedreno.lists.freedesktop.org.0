Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD12452E01C
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 00:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3331F11A4FA;
	Thu, 19 May 2022 22:50:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA2311A4FA
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 22:50:23 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id y66so2109422oia.1
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 15:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=deoE4Qm8qsxnbdmXPjW300PaU2ET31mJnZqz2L/cn4M=;
 b=aRgwz/HUss1HuOFpQCIKu/P8t9sN5XH9pnTf2BwXDw+HqKFu/SgOVgmkCmCmdiqkFS
 FtrWmnzUbmqrVIrtquJ2Zw3E1bLnuQp7U4PSC9gUwsyB2958DE/oDCoVursXsRP/I8aJ
 v+gK1ozci++VDzcs1hsANHv4Tcx6yjPjfZVJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=deoE4Qm8qsxnbdmXPjW300PaU2ET31mJnZqz2L/cn4M=;
 b=8DVFARpYxFi7DjyjchSMN/MceO2SZMXqG9Ueb4+HwFTv7/pGdFFwGGli2HdFPgBvP/
 YgYiyKCK55+VoCaRYgnJTe3W1vWVfjgRowJGF8tcskgAG0mL7/wWNe4ySnUp1yweeo5g
 /IxqpO7C1PFEgZv9BUSvQES+7HVUVrrL4zcQ/vwTN+dFBScggqRGyT3oza1/yF2ikV20
 kLoGSl77CK/1wb/gTWAB8jbm96/JEwPoSU78+Zw1NFQSbaIa1rdhmiRlsP8dZHmUyDGq
 J/3CHWr7qw68QoyN0vXrzym0bmCWdlhYWoKoGd+GuyQ/SwrjxoWKDNZ0xcDYNrczwxEF
 Nb6g==
X-Gm-Message-State: AOAM5308NPxr6nXr5TG1MuERjQwD3ZPiYubD9V2+j5Zp8iYopA+ov+6m
 zPkVUplwWrX66OAf4xhjhEiKIcUFBAQ/1njpdTkLbQ==
X-Google-Smtp-Source: ABdhPJxveqssC09W6euurj9Q0qnAOSawljamJowys0OFddGMQRpM4VOMvK2OjEDDVKeek9Bs6FrxRRgNoQ6rQQ622pg=
X-Received: by 2002:a05:6808:14c2:b0:326:c129:d308 with SMTP id
 f2-20020a05680814c200b00326c129d308mr3615754oiw.193.1653000622517; Thu, 19
 May 2022 15:50:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 15:50:22 -0700
MIME-Version: 1.0
In-Reply-To: <1652982339-18190-2-git-send-email-quic_khsieh@quicinc.com>
References: <1652982339-18190-1-git-send-email-quic_khsieh@quicinc.com>
 <1652982339-18190-2-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 19 May 2022 15:50:22 -0700
Message-ID: <CAE-0n53EbwhC9G5tbLutGb3+8EfmYj45n7DHwjpP0C=b_DuFUg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/3] phy: qcom-edp: add
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

Quoting Kuogee Hsieh (2022-05-19 10:45:37)
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..90093cd 100644
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
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);

Where is num_consumers coming from?

>         if (ret)
>                 return ret;
>
