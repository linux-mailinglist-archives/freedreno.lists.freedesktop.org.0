Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6254CB892
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 09:19:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B07F110EA73;
	Thu,  3 Mar 2022 08:19:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com
 [IPv6:2607:f8b0:4864:20::829])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C711B10EA73
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 08:19:48 +0000 (UTC)
Received: by mail-qt1-x829.google.com with SMTP id s15so3947729qtk.10
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 00:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eBbghWmyN77JF7RUpoIN9lkaA23tcjbHORN7ZoYwWzA=;
 b=O33UcScGamI/CbJS2qdYJFMnkoGyvajYHAEDnA1q32GaQGdYlOFF7E/Wu4I2A6awOB
 8kHS3FMUK2LE41rzxdVjPjRD9UKIjJgcB730BEVO9EFbgrwPgXVRpI2j0WITQtJrjn4v
 cVeafQ/DY+JzVcs8qekyK+4EZn/xF0kAVhJNY0eX56zgfPsIpB3vQ92roJgu8daAvomr
 fL6PV8jZKzTYn+t2bn9N/tWswi4bxc71DF6zMvRz50BOSDS/whVmIdG4MoA4nBKNmwEI
 ENNeJnXecQxETQlmR0yjeMH6vWpP18HnOa30Jt3D8T1DHzWE5IQIAuA4+FGcjHqlBSxf
 zAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eBbghWmyN77JF7RUpoIN9lkaA23tcjbHORN7ZoYwWzA=;
 b=7eFxOrF/+hkSR3+cY00o61AGqmBlyM/cGJWq9MzZXQnxkAAgIjJUE+LOYV9l6mNyqB
 SSHvn0l+BfSKGwyYeCUSHL3xChbd9889HbgHHuYOwUguGuxBirH2GqcGHCGogZuUkXtE
 LgXAJhqcijp1iYyWI7c4ACVUfZe9elxcftlb57mdUhhdVl156KpFGbZMvCcLsX2Ck5Vy
 XuhVlCKhlkDiMe135FhuTkqQPt/atDOoe5Zbh09Iec3vUJKyGMwfOtgNwLnqqM1jyvAy
 vnhBUSAmekH4bNLQfLTT/Db9Py7TSmPAlfYmAhOP0yxhJ8t3wJLhOuCQrQx0ViIMYCxU
 EyxA==
X-Gm-Message-State: AOAM530l6svRtRTvoPairWTv2iBF+zrvziQKtWabHbDNZNUQl1ru8FuN
 vtopPKp8X/mkEg+dWuhkShl1YETIBX1EOvZu290mPQ==
X-Google-Smtp-Source: ABdhPJzwybpbRKv/JsGwbbxWqXiPUR4uibbx0YjX5VRLF4ZSmc8ArqQjtlAMg4s/pfikPz32DA/3T3dwuz1Doz+bPUQ=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr26214309qtw.682.1646295587875; Thu, 03
 Mar 2022 00:19:47 -0800 (PST)
MIME-Version: 1.0
References: <1646294904-4753-1-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646294904-4753-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Mar 2022 11:19:36 +0300
Message-ID: <CAA8EJppbk+yCmVgRbUNBn+BO09xDZe93RXK_cUxbX9HZM9ZXmw@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 0/3] Update mdp clk to max supported
 value to support higher refresh rates
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robdclark@gmail.com,
 swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 3 Mar 2022 at 11:08, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> *** BLURB HERE ***

Description, dependencies, etc?

>
> Vinod Polimera (3):
>   arm64/dts/qcom/sc7280: remove assigned-clock-rate property for mdp clk
>   arm64/dts/qcom/sc7180: remove assigned-clock-rate property for mdp clk
>   arm64/dts/qcom/sdm845: remove assigned-clock-rate property for mdp clk

sm8250.dtsi is missing

>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 ++-------
>  3 files changed, 6 insertions(+), 21 deletions(-)
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
