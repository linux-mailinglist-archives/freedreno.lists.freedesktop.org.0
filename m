Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9384A7AA4
	for <lists+freedreno@lfdr.de>; Wed,  2 Feb 2022 22:54:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA04910E25C;
	Wed,  2 Feb 2022 21:54:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9798410E3F4
 for <freedreno@lists.freedesktop.org>; Wed,  2 Feb 2022 21:54:29 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id m9so908997oia.12
 for <freedreno@lists.freedesktop.org>; Wed, 02 Feb 2022 13:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=acQVjWKYeBqrGlT8JOrykVFoHSpHX2aivgX9GnGPvpA=;
 b=glPjxi0FLwWoVIiT2y7b8kOIkcA9TF/pKVsHM9W0Zem+9ykyw9JzBn8zEDLt2JWJro
 F/BUIhr5UfohIABInMTnoImT3QnU2yn6ANnzds6M+bl1A7vapMNlYmQbXBvjgj6Lg67P
 pLjUc5PxvQfKPiA71xqKgBwfyLpD/tChQl9pc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=acQVjWKYeBqrGlT8JOrykVFoHSpHX2aivgX9GnGPvpA=;
 b=UDQN8sZ9SnpfXSgUhhZOYcSavMM9z53Y7m/xA3E8b77g3aM5Fxelea8kcJs/sNeMMn
 ewSB7n7LGzr7XM2kDT0X+vQnhTyUWIo7qW8M7SIESjwwBjbQ/AeubIPscyDMzCa8YY0S
 Fyn865Kyxac6dyT99EjsFLexlgdkQ/om7KO0HOthF441DO5qgSKGib/yBMW7uGQAkKYj
 S8CNIBOUHz+HdxP2Ad3qZVljBoAOxcvvLC6i6ZD89FHdwUmGxVxfx32WxNt4Uh8hoqt4
 L6UgS/2dAYNU9xLZ87CvpaDTgCcaLLsLfGv4z1yG1fkyeDwPzpcM0fMAfuqyiCE9WSeu
 8mMA==
X-Gm-Message-State: AOAM533G48yShEt7N+PRuUGP9q4/GDzMk1TH6TnDzJWOWL30W7fyEYhZ
 EphdWqIonPnnGI6/JT7jczqNTSbnhvwDWfl5muNEsQ==
X-Google-Smtp-Source: ABdhPJwVCGpwPJV5uL/f7GjdcYlEJfYQrgUgFJZ4EiR58PChWsEuL/zlZA+IBfjxEJ7UVpn0w1ICD/1eyHOUY8+ny4M=
X-Received: by 2002:aca:df82:: with SMTP id w124mr5918431oig.112.1643838868851; 
 Wed, 02 Feb 2022 13:54:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 2 Feb 2022 21:54:28 +0000
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 2 Feb 2022 21:54:28 +0000
Message-ID: <CAE-0n50sONq+URcWwvDH=UPshgy6+XZEB3sK_4n+5jNktHsEhg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 0/3] Add support for eDP PHY on SC7280
 platform
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
Cc: quic_kalyant@quicinc.com, dianders@chromium.org, quic_abhinavk@quicinc.com,
 quic_khsieh@quicinc.com, robdclark@gmail.com, seanpaul@chromium.org,
 linux-phy@lists.infradead.org, quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-11-15 23:07:35)
> This series adds support for the eDP PHY on Qualcomm SC7280 platform.
> The changes are dependent on v4 of the new eDP PHY driver introduced by Bjorn:
> https://patchwork.kernel.org/project/linux-arm-msm/list/?series=575135
>
> Sankeerth Billakanti (3):
>   dt-bindings: phy: Add eDP PHY compatible for sc7280
>   phy: qcom: Add support for eDP PHY on sc7280
>   phy: qcom: Program SSC only if supported by sink

This series was sent to the wrong maintainers. It's in the phy
framework, not the drm framework. Please use scripts/get_maintainers.pl
to find the right email addresses and send this series again.
