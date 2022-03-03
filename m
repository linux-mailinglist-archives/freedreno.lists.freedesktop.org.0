Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4CC4CC881
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:06:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B65F10E326;
	Thu,  3 Mar 2022 22:06:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A505610E322
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:06:13 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 p12-20020a05683019cc00b005af1442c9e9so5798241otp.13
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=pdvZcd1dCzTos36AEvo2XuYW96g/JSyyd6Ju386HZBA=;
 b=GU/VicsmSZRw1d2LkDZ6wzydbTYT4L8dB1zCnJwjzA08Es/V8nusp7J1acftodaTq0
 5HH7HAouRm088ujftN55DNIdMBENIQKdJvGbxCq+X2n4YuPls/MdNaItK8W+zOfxKnv/
 O+Fxmy7cnSFBcug80vgAZtRq7kEgQVZE07yfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=pdvZcd1dCzTos36AEvo2XuYW96g/JSyyd6Ju386HZBA=;
 b=pTOD4xVGhXRuW6soUTRH8QfazhlDX3CnxUPVSORBRAHixAKOb0hh2YNTxyqY5YyF2K
 q8EwaSIEL0JxL2FbmvDn1YN6aHbLbLjR/XWH/F4FPbVwHr6eD85ELTpf7OX/I0a9BD6K
 gbBDDSWXaWSbkoUYjEpdJ6VMuE6MjYw9wfYzCPX57BwA0RvNIaiKELIxddymWhrOzumD
 t3h2EkiixAInWQ6zSqD7I8JpPxgAy8ZCEG66gQitb7/4jEm4Rhjf4z1jM2n8q24O0nXl
 cfvcBY7oAFKZeOeFkY8XBecQoptlSHljLm/jraj23t+wp+XVZw19YJCmY6rax6RIxbWm
 oy6w==
X-Gm-Message-State: AOAM531mZa6nuvPMphP4fkthbrTHfY6jU9+xAW/84LNJYHxtWZGcC6i9
 aN0BzNHqFq3cgTy/tnh+BEqzmuAMoUe29YKdv2la4Q==
X-Google-Smtp-Source: ABdhPJzIsZYjGMPB9mIKaz9We4al2KijnAO/aGSWVSgdvkGTTn/LV94gdLX1B1Wq6BQq3wFmiUQFljUdJvXq2KeLZYw=
X-Received: by 2002:a9d:22e9:0:b0:5ac:1754:342c with SMTP id
 y96-20020a9d22e9000000b005ac1754342cmr19987839ota.159.1646345172996; Thu, 03
 Mar 2022 14:06:12 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 14:06:12 -0800
MIME-Version: 1.0
In-Reply-To: <1646300401-9063-3-git-send-email-quic_vpolimer@quicinc.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-3-git-send-email-quic_vpolimer@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 14:06:12 -0800
Message-ID: <CAE-0n539U9OzNRoaAG28TG7UJBUdiBYdJ-PKzGyF++ihK0Xo1A@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>, devicetree@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 2/4] arm64/dts/qcom/sc7180: remove
 assigned-clock-rate property for mdp clk
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
Cc: quic_kalyant@quicinc.com, robdclark@gmail.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Vinod Polimera (2022-03-03 01:39:59)
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.
>
> Fixes: a3db7ad1af("arm64: dts: qcom: sc7180: add display dt nodes")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
