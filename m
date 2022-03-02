Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DA84C9A81
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 02:38:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316DF10E1B8;
	Wed,  2 Mar 2022 01:38:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0471410E1B8
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 01:38:53 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 d134-20020a4a528c000000b00319244f4b04so305120oob.8
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 17:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rIkwW4M5gVOhf6lStrndyYQMI45yK4r8ntbnRtdBpfQ=;
 b=TKKK6Cm980ULKq4I2QCxffulSprZbP7BMvFu2JAr/2/up2F7lA2dwyqJ12Zt6efIim
 PUS2AW5T8/QbIO7WsJ0Nei+H1tlbhOklnsWn7koBBV49QPJUxR697SSlt5j/U/o6pv13
 gRYOnZ/vjQ6anC866KKgcw89XkP7CotO/+KLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rIkwW4M5gVOhf6lStrndyYQMI45yK4r8ntbnRtdBpfQ=;
 b=YpTX0SphQzQqyKSNXLuODkSO/fhjP49qNaYy922MyjbkQD7CQzz/ME5YpXfTBi9FHc
 TTtA0ZlHp5eWbyy4iv2q3awG+Ok1CKrkuZPgYyt6JalSb07beWdsdJzoBfYMD6KKEN4Q
 Y3tuvPynhSEyRAAfYOJOqG7Al3D03nkREB3K5zd7Y3gdad7n5T36ioLdeB+IYskkqTk6
 cLoj7Q62fkN6SciBs+8lwCAfQ/hvhCBVMfzKnjlPQ+Sz0jmt8IwNnaOh19oT/8EsDPqn
 q0LljvrUhy0oMZZz+BUeEPL1G1OFcYWj/ewdWNIVKQZQV94MPzwe5SaT6qpg3I665OlA
 10hg==
X-Gm-Message-State: AOAM532aK2OJNOb2/PVY0HICAmmePzVm8BMhcbWw2N7LtbTyUbJkX4oK
 TuEKFcpTc5Lrx51bRokM/3sUiq3yQTM6qCD/6GfwzA==
X-Google-Smtp-Source: ABdhPJxzYrMW2U+TG3BLR0861lZPPswIdwTyU+n8hPIaCWD803U1juloOlCoo84blCjcV1MqrGMAewbBXyc6GyGp9bU=
X-Received: by 2002:a4a:9821:0:b0:320:52bb:3806 with SMTP id
 y30-20020a4a9821000000b0032052bb3806mr797405ooi.1.1646185132284; Tue, 01 Mar
 2022 17:38:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:38:51 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:38:51 -0800
Message-ID: <CAE-0n52brK_6gg5-hYA1cNzk3WVw9f0f_XO3QpUywJzY19u=kg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 1/5] arm64: dts: qcom: msm8996: Drop flags
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

Quoting Dmitry Baryshkov (2022-03-01 16:52:06)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
