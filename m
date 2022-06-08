Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A1F1543DFB
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 22:57:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607D211A0DD;
	Wed,  8 Jun 2022 20:57:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6879111A0E6
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 20:57:15 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-fe32122311so98420fac.7
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 13:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=7HuOLi1pz8TClFoTL+rZB2VywOYDNgZNcPsKAhcwhDU=;
 b=G21/aKkUSjkrb1rz382eogv0q+fqealbOBP6erxKAk6hOhSVN1Gb5tADqPrMJrcTpE
 LBGyoN22m373bi4xwyHHpBY7THXwbBjsdKkd2QEiW1VylqSYPJCMzQ+98B2QamS3jBr9
 D6LDnHUesGUIrGR/j6Q/1b/o0kaR7DNAXo45Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=7HuOLi1pz8TClFoTL+rZB2VywOYDNgZNcPsKAhcwhDU=;
 b=0N4J11J24g3pqNsrCJrB4zsB1pDzNcVdK1YA5t4RtXgt+HzyrcQsUyvLIbEBHCUQT8
 Ro0rZVfL7nCNaZ78IzGgsROspIeBtnMFo5LvIsVzGvfhbHFt75cwCm24GoryWMO6m+fJ
 BB5nhokTgAOe85W1yevvBouGoJIKs94DsFDuxyIBw9O1h5369L9nSJUnVbUCvYa6Gsx9
 jQeNNu2TcVquio365TZcahKv9V3yyCTxIwyGujw7wvjvtLGpkbTgNeN6MKe4pRXVE3hx
 cyYUjlX51IL0FtHHWs7nZJvF4Tc1xKS+6EEkYeXiKZ07/+bkuHfwzgyn7nz2k/Z6hY1n
 hXdg==
X-Gm-Message-State: AOAM5333+q3WLOWoDjM3TbhLgPbw9cKJLMPPYwgHEDhYPgrKIzAF00QR
 fQclnHjglVZ5T+aNUfDdYNDUzyLBGNTC9fXsRU5pVA==
X-Google-Smtp-Source: ABdhPJwENV+5v4HsKCmxScnymfhi+4EFnfR5wionjJb+lf3WPyLHg71mAzkYzbBGADbUwxuUs6CBt/xEv3nXYPRu8Mk=
X-Received: by 2002:a05:6870:b381:b0:fe:2004:b3b5 with SMTP id
 w1-20020a056870b38100b000fe2004b3b5mr1751882oap.63.1654721834435; Wed, 08 Jun
 2022 13:57:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Jun 2022 13:57:14 -0700
MIME-Version: 1.0
In-Reply-To: <20220608120723.2987843-5-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
 <20220608120723.2987843-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 8 Jun 2022 13:57:14 -0700
Message-ID: <CAE-0n53MTinLneHvkyf8UY=nzy3jTK8-f56BusQJ+0G+CSiMyw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 04/12] arm: dts: qcom: apq8064-ifc6410:
 drop hdmi-mux-supply
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

Quoting Dmitry Baryshkov (2022-06-08 05:07:15)
> The HDMI circuitry on the IFC6410 is not powered by the 3v3. Drop the
> hdmi-mux-supply property.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
