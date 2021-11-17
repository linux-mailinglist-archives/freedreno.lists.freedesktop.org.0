Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5248045411A
	for <lists+freedreno@lfdr.de>; Wed, 17 Nov 2021 07:44:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A966E6E249;
	Wed, 17 Nov 2021 06:44:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF4656E241
 for <freedreno@lists.freedesktop.org>; Wed, 17 Nov 2021 06:44:41 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 a23-20020a9d4717000000b0056c15d6d0caso2921078otf.12
 for <freedreno@lists.freedesktop.org>; Tue, 16 Nov 2021 22:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=4KLLnT3lbE++1zW9IFNlDp63h9Sm/+5C3hvYnuVhVto=;
 b=Pou//tJ+XTHrkeW/AllQYZpDimofzYxEc7jVKrltzTA3GjLP7+nyqqdUg7UgoOcl0P
 NeahRDIxD6QXIcKG5oT/GnvwX2bYABXdVEn8lxIwicbPnLhKrhPeq8CxOAxtQwleVefn
 o33v1ohDjye4Z3ztHsH0vrGjImvOhvUoqvRRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=4KLLnT3lbE++1zW9IFNlDp63h9Sm/+5C3hvYnuVhVto=;
 b=sTFkdE5Y2iFhMKF/LPFT/7J60fWGNHKc+djZz/eEDPsvBIcT8ZFjDpClkVODHZg6ZS
 KbOllCCLSqb2hjYkv5ybhx9PWcYeau4bcyZL+4uo3Owoum5AMN+A/fliMHXVMN9RXHuc
 8sSwNDIbunLd34FJTUZHZv5jGeWQwgkkiRBIfT65BzbLJtKCecwoDFXl+tgLEDrDcugo
 XHyRpZ5UBIbTyBlYennV8jWQP/ZGzG+kkcQkf3D6vnwQrWLcXhwcJOs32F7rxBRaNGZY
 uPxWhSnKcyWKFrU08DTPuIJOe6XSrCSaMu4x2ds7is1xS9a0S/zW3nK9vOcqPXJOA1yQ
 euww==
X-Gm-Message-State: AOAM531KkOEAcOrJVQMUa9v5cRoNLoXR2Qi9ARbGxJrh7sPPGlISghfP
 6kL2YkNJEvA2Ph+uGxVOxny0qg76q9+pBtU2Ka13MA==
X-Google-Smtp-Source: ABdhPJzyXkbDI3NrFOfsZtutYyMeBpAr8cH2dtM4PqNy4KOdAZHLaC2NYpVU1JLU58nPIOoLn0OLZ322dDNO0JgsrYU=
X-Received: by 2002:a9d:7655:: with SMTP id o21mr11601317otl.126.1637131480911; 
 Tue, 16 Nov 2021 22:44:40 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 16 Nov 2021 22:44:40 -0800
MIME-Version: 1.0
In-Reply-To: <1637046458-20607-4-git-send-email-quic_sbillaka@quicinc.com>
References: <1637046458-20607-1-git-send-email-quic_sbillaka@quicinc.com>
 <1637046458-20607-4-git-send-email-quic_sbillaka@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Tue, 16 Nov 2021 22:44:40 -0800
Message-ID: <CAE-0n50jpAq7jynEL5opHJd06zThUaWVzLvc_zidi-qYUxiwcQ@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v1 3/3] phy: qcom: Program SSC only if
 supported by sink
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
 quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Sankeerth Billakanti (2021-11-15 23:07:38)
> Some legacy eDP sinks may not support SSC. The support for SSC is
> indicated through an opts flag from the controller driver. This
> change will enable SSC only if the sink supports it.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---

I suppose as long as the existing user has already chosen to set the
opts in the controller driver then this is fine.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
