Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9AD436AD1
	for <lists+freedreno@lfdr.de>; Thu, 21 Oct 2021 20:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6238D6ECE3;
	Thu, 21 Oct 2021 18:45:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76856ECEF
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 18:45:22 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 204so1493022ljf.9
 for <freedreno@lists.freedesktop.org>; Thu, 21 Oct 2021 11:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=9MuLW1yfrGnnXorHHuXQXcRAluIurMXU5vrmf/nqkGE=;
 b=FITLZmM/2oE6KZ12z4Oo85YoKei0F42uWLMnZ7ontaKS8PHbrY0Qfaugi2465wnXNJ
 1fFUxxF/tZhW4Jpy10fPp/i8kRij5Z3QLe/WsNl6HLtGtkS1hF7li4+I6pV6tN9PY62O
 zmWUJ18OgEvHA+oSZ3HmZPt7a8MHp05RfAqfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=9MuLW1yfrGnnXorHHuXQXcRAluIurMXU5vrmf/nqkGE=;
 b=g4Jx4YeUBAlNNVc5NqB6hGW7z4br6U1eON39LL6m+rcYA6sOFrdyQwVIvR2ITM60i3
 jQPrY+Brg9OAswSdkfmo98d9Ti1N48cNVu1U7xix6HRgbNqxvWAtuEbKP1XdwM9ixkLl
 snmzmD+lOAfdb13bV1+4IFtll3dNr422aRhQZ1G5vDymfIS4diPPWBLw0s06WvDcAMFf
 ldpGsnQBIr3MpSMSPxfbVr64T+mo82LD2YJGQj9aLHDJ0UIRHFdc5wi4MAJMauL3Onk4
 R23g/qF4jOk2LSSWSEZ0hX2chq2ruripEipggSrBSuecFXfJKJvCPYIvETz9WR3WSs3v
 AgDg==
X-Gm-Message-State: AOAM5324GHxhFUk5gRXcvezjx8431fLbYrFvSnEijWnplKyt2rfgR52g
 k9ExxjJfIknTjheaFs49PtygJsPVr0t27bc8bSHtDw==
X-Google-Smtp-Source: ABdhPJwpbVQtsFa1/rdGMFSiAHJ/DrNi3DxrP6HwLnRItX7TvhyyMIFGC8yEIl690fJTmadvvpEHD+Ho6z6kxVBZMW4=
X-Received: by 2002:a05:651c:283:: with SMTP id
 b3mr7755337ljo.459.1634841921121; 
 Thu, 21 Oct 2021 11:45:21 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 21 Oct 2021 11:45:20 -0700
MIME-Version: 1.0
In-Reply-To: <1634738333-3916-3-git-send-email-quic_mkrishn@quicinc.com>
References: <1634738333-3916-1-git-send-email-quic_mkrishn@quicinc.com>
 <1634738333-3916-3-git-send-email-quic_mkrishn@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 21 Oct 2021 11:45:20 -0700
Message-ID: <CAE-0n51Q7Uir5LvmU8MJG-KmNsiYN690xr5svVv8_H=de-EkpA@mail.gmail.com>
To: Krishna Manikandan <quic_mkrishn@quicinc.com>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: kalyan_t@codeaurora.org, sbillaka@codeaurora.org, abhinavk@codeaurora.org, 
 robdclark@gmail.com, bjorn.andersson@linaro.org, khsieh@codeaurora.org, 
 rajeevny@codeaurora.org, freedreno@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, 
 Rajeev Nandan <quic_rajeevny@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 3/4] arm64: dts: qcom: sc7280: Add DSI
 display nodes
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Krishna Manikandan (2021-10-20 06:58:52)
> Add DSI controller and PHY nodes for sc7280.
>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> Signed-off-by: Krishna Manikandan <quic_mkrishn@quicinc.com>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
>
> Changes in v2:
>     - Drop flags from interrupts (Stephen Boyd)
>     - Rename dsi-opp-table (Stephen Boyd)
>     - Rename dsi phy  node (Stephen Boyd)
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
