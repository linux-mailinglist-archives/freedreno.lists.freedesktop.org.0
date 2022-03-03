Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A8B4CB3E4
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 01:50:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A91A810E7E2;
	Thu,  3 Mar 2022 00:50:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13B7E10E7E2
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 00:50:28 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 6-20020a4a0906000000b0031d7eb98d31so4045655ooa.10
 for <freedreno@lists.freedesktop.org>; Wed, 02 Mar 2022 16:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/2EC8zNvMiYjPaYg70TgRdx3fCegP4HpnaEb1DNrlZA=;
 b=OBFuGz0Ovh0fRb/PVgoG+6iRhtp4Lo5PnJTLPVBDsK3SbG51eTCV9I4bToYGWzzQwQ
 uLhWFAuGVtEUu6Ssk8Uzo1ocqlJ05rCzZpWp6izZ5LzLEP1Ww01xvVoGmkOtrQ219h/u
 wCjoAYhfJqyZV9e8VwkWp+RUhZkYyr03XT89c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/2EC8zNvMiYjPaYg70TgRdx3fCegP4HpnaEb1DNrlZA=;
 b=3e8sm0KjljAR5NfgGG0R8fNQbMTbSRzNAFjcqOxYBjLDeHpROn8rB5imDYEOZOzzpC
 N15NrfVwNNzRU/+PGewSVIOdO5RgIhf9cMxD5raeJ9GdJLketvFaKHb1e9AlEQHEERWS
 1tjAIZljBitpQ6OU1m+md5VFOxCnGYMWBiXDkF89bwHYqcx/pWlioIczT95oSd0sMZbP
 lYsdlIOQRHWS7mSEgPzGU5MzYx1bpFV8NRchdb/lqKaSZiYjroo+YpKKW2qBwZl94141
 pbt0EEyhTVb2kb5hQT2n7dh2p8nm9EXOsq1aD+nNmxREnHWdSXLBu1J9gHdrZj6fylbi
 lFBA==
X-Gm-Message-State: AOAM530nj8Y0vh7+Nmbn6SZBPsgoansmTYKru2jNpU4K04/V5p18Q6cQ
 A5a7t53oIlcteg+seCMYIviMPCe4W2f35Z+nP3s0bg==
X-Google-Smtp-Source: ABdhPJymMjnJcBkJ90VOhI42XO7hU17YKFFFlRx1RXjtrukwo8gQVLyOc3QdIvx9eR+49WHllUiLCYVPLyMyMvHI2gg=
X-Received: by 2002:a05:6870:14cf:b0:d9:a9ce:92a9 with SMTP id
 l15-20020a05687014cf00b000d9a9ce92a9mr2104667oab.64.1646268627242; Wed, 02
 Mar 2022 16:50:27 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Mar 2022 16:50:26 -0800
MIME-Version: 1.0
In-Reply-To: <20220302225411.2456001-6-dmitry.baryshkov@linaro.org>
References: <20220302225411.2456001-1-dmitry.baryshkov@linaro.org>
 <20220302225411.2456001-6-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 2 Mar 2022 16:50:26 -0800
Message-ID: <CAE-0n52WNiinbFSaKJKQ7sPwD6SNH_o9tyyw5ig-m0v8svsumg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 6/6] arm: dts: qcom-msm8974: Drop flags
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Maybe the subject should say "mdp" because there isn't an "mdss" but
this isn't a big deal.

Quoting Dmitry Baryshkov (2022-03-02 14:54:11)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Fixes: 5a9fc531f6ec ("ARM: dts: msm8974: add display support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
