Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C2D4C9A8E
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 02:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5633110E691;
	Wed,  2 Mar 2022 01:39:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6210E63E
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 01:39:28 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso284370oop.13
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 17:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=c8c86OEqOSehxlQhPxGLo0iioV8oYfqJEJFuDjvqLWo=;
 b=hIE/VP6awfGy025Pee+jBTHAeWWsN2/N4U2oVA29EZ6sUVlp6ZS33TimoWvJ74FSJl
 WZUZTV8acVAWTHoaqZANsb9aRlIwGrgMCvpZqNmF1+R+V9lXm60GkhdkUYnagxGNYtpG
 zICC0orF/OdRvUeQ0kK3GMm5zET7oci0WXlsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=c8c86OEqOSehxlQhPxGLo0iioV8oYfqJEJFuDjvqLWo=;
 b=7QQ4N3t8xkhBU3/vMf2mS5TTmCenGU0bkwENt42P9WgkgYvHGzMbVcaLMM1dr1/7CE
 gpSOziGCjIEEBNWp0jdlC87AUq5qTiR/EqKiIxkLwGurq5CpkZopETi6KwRdBA2a2coy
 UTTIWeG50ofAdaif1gENGhgrv0UcG+2nfnZxddFDM3GcF1qp4sAnVNhYAFBLdNVDwUXQ
 uObG/kew9vih1wEzIB9MgvFi1cbL2wBwDFUSUWECCqXKqVIPHYe8VQoTGUJP8uE1Thvp
 ldyKpqwlwa/Lg9XvoENpwn6BW6y3UiXuvoimX0GfTg58vNKKQ8+Ri+C3ekoBqLXSKsp/
 Gg1g==
X-Gm-Message-State: AOAM530Ai9PP7X4kR+BG3OaVjHfKR6TzDlJOjqzTpes0NWM+TrF20B/t
 gmW0+clsouCnoP9RR4ajlqpgGP5RG1aZYzM8X64U9g==
X-Google-Smtp-Source: ABdhPJzrJISuUSwYLe5NX4z7wkzXV0rSJsqIg1aIyyv6HslMpOfb1uyj0QJbf+YVMB9TH0G981YvTpkC/Lu/VyeRMmA=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr7908109oab.32.1646185168324; Tue, 01
 Mar 2022 17:39:28 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:28 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-4-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
 <20220302005210.2267725-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:39:27 -0800
Message-ID: <CAE-0n53S4q5JN3a1ypwaR8kEKbJVjmLZVgY_O0+T3KY5eXjesg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 4/5] arm64: dts: qcom: sdm845: Drop flags
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-01 16:52:09)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
