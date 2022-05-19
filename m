Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497352E015
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 00:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A7710E378;
	Thu, 19 May 2022 22:48:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28F710F289
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 22:48:56 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-e656032735so8561806fac.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 May 2022 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=gPmJM59HilOSZAiNocBUyn1VGxu9PFrDrw8E4Yeqrfk=;
 b=Ivbz2PDWtVwyLf0aE9K3mPrsVLOK80ClXfeDGxNsqdlxmI6lf/HqV7VfS+K1pFR238
 KfAvg7i6sxEPBmB782C8Q6xIoiiz4VrGwKI6qxj4FpHIfeHM7VsU0oaEHwdpWxktouqK
 31WAtWkdHxSG3SjDgz+OusBnk+tjWjtiPafIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=gPmJM59HilOSZAiNocBUyn1VGxu9PFrDrw8E4Yeqrfk=;
 b=LwQdu1PMoH6lXKL2RXxsw+qPz+4E0fPy3pmFkvbtg9wHxx3W9Udnq0Zqv+V25TO0jd
 XopQwHePE4krpqJphIUEfUZdJwHYlYrsWvmc3w7R745NlqWjtv/LEPWSqWmAa3Pn6ub8
 cpwzKXjwySYYal63Uu6bxZ+bFLVVdzi5pHEcEnDM05+we6G2GYWOF2j0gxCEFCbUD85k
 26LCpIgPzlF21I80fXBgpqdxT5YP+QxFl8yEQwrC6rP9gwZCp0oX8dufjGIxVCn1xEVt
 woV+UScoqbIZzFyB8jNFnurdZybmL+yuEacPQ7uRjYvxIUGvEOUiAs1Sxxbr52sofWXy
 JksQ==
X-Gm-Message-State: AOAM531ScsuV5XjdBYWh06dSXh/ueZ5dlqKq7v2QCfKrAI7Def/tH8nb
 OJBCpiLxMp1SOvrt9I/95OzOzEXqyiYQ/VSRcduT2g==
X-Google-Smtp-Source: ABdhPJw5ddHxY0cfryu3hgg4S9UcGUCH59iSaeUGGcNe4rzoKsPmMGWR455MyyYyru3KXBJ68SY9LKIemGUmA3oUAE4=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr3801393oap.193.1653000536016; Thu, 19
 May 2022 15:48:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 19 May 2022 15:48:55 -0700
MIME-Version: 1.0
In-Reply-To: <1652982339-18190-3-git-send-email-quic_khsieh@quicinc.com>
References: <1652982339-18190-1-git-send-email-quic_khsieh@quicinc.com>
 <1652982339-18190-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 19 May 2022 15:48:55 -0700
Message-ID: <CAE-0n52ugbZfhP7BTYoo9yt1CMsKTW5uW74GdBNx14cRzj39gA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dianders@chromium.org, 
 dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 2/3] phy: qcom-qmp: add
 regulator_set_load to dp phy
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

Quoting Kuogee Hsieh (2022-05-19 10:45:38)
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp.c b/drivers/phy/qualcomm/phy-qcom-qmp.c
> index b144ae1..24f39ee 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp.c
> @@ -5008,6 +5019,11 @@ static int qcom_qmp_phy_com_init(struct qmp_phy *qphy)
>                 return 0;
>         }
>
> +       if (cfg->vreg_enable_load) {
> +               for (i = 0; i <= cfg->num_vregs; i++)

Just less than (<) cfg->num_vregs, not less than or equal to (<=)

> +                       regulator_set_load(qmp->vregs[i].consumer, cfg->vreg_enable_load[i]);
> +       }
>
