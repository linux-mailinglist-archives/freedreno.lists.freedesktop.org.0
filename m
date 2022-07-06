Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3A25695DB
	for <lists+freedreno@lfdr.de>; Thu,  7 Jul 2022 01:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6C710E15D;
	Wed,  6 Jul 2022 23:31:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A479610E413
 for <freedreno@lists.freedesktop.org>; Wed,  6 Jul 2022 23:31:06 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 n12-20020a9d64cc000000b00616ebd87fc4so12875126otl.7
 for <freedreno@lists.freedesktop.org>; Wed, 06 Jul 2022 16:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=bLBb96h4o+6m7G+7u8bDwIvQ0631/O8eJZaab+T17s0=;
 b=Vd9gt8Urb8w6iPVD/v7g1pifq9NFSRgh2NgsOEiOp86rfRNkozal3BpenJIcvOsru7
 hd/x3zZjpU27fNbXhoBEFjgDh60CtsSYn2xjmDu5QQC5dwSC8XDrgSgUEz872suYRmAm
 rTEei11GOXk7LwwvlTJdb2p04gTABzcIZMz6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=bLBb96h4o+6m7G+7u8bDwIvQ0631/O8eJZaab+T17s0=;
 b=migM3qqeCGtJVgrEVhubrTzyIbw+R3kadtAHGYbyOJMSKUWoEDwNgAIM57P/onTmLD
 +/NwGcrFIqIt1JE9uM4D22buB75LZ6divTVWCtCNIwVnUX0PGIZ8la8ciEeuBI1LOnkA
 9yhCXeFE4r0VznuvVLf9PepQ97mQpDaLAcrIGdGK+NvV1X7VI8ylo7zKcDC9XQRAiycW
 TzKiA28JZVxpQvo+Z+lJBF3eohrC1g4oENh+TVQtDN7oQRKVYs1H7T878+D7EU2A4iKv
 2K8xud3G8mjM1Elt8k6UZ8LNEHK20six2b1EzWSq3ZiJZ3uoQ//j1/eJ/UDx0I2n9Fa8
 RqtQ==
X-Gm-Message-State: AJIora+ey9TVcZJoEpctGJ3lJxr3ek1lcgU3Xi7YqoXgwOrYIsJxstxQ
 krv91kErGd4LW7668KMPLr1VY2puxzCQzgZ3nN/5aA==
X-Google-Smtp-Source: AGRyM1vNuiQwjPxBKLkD9XvgxVOjYM4F2c7Ajdm7Hss8UtcjtIkKw8yz94vtZ+yqZ/p1OH7O2q6wqiiOuLyTQ0m+HQQ=
X-Received: by 2002:a05:6830:d81:b0:616:c424:6f22 with SMTP id
 bv1-20020a0568300d8100b00616c4246f22mr19265666otb.77.1657150265868; Wed, 06
 Jul 2022 16:31:05 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Jul 2022 19:31:05 -0400
MIME-Version: 1.0
In-Reply-To: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
References: <1656690436-15221-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 6 Jul 2022 19:31:05 -0400
Message-ID: <CAE-0n50+-FUxLZZRCGr14csROPK=zqEc=kWfyMK_Qo_q_up3tQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 devicetree@vger.kernel.org, dianders@chromium.org, robdclark@gmail.com, 
 robh+dt@kernel.org, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] arm64: dta: qcom: sc7180: delete vdda-1p2
 and vdda-0p9 from mdss_dp
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
 quic_mkrishn@quicinc.com, quic_aravindh@quicinc.com,
 freedreno@lists.freedesktop.org, quic_kalyant@quicinc.coml
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Subject should have 'dts', not 'dta'.

Quoting Kuogee Hsieh (2022-07-01 08:47:16)
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
