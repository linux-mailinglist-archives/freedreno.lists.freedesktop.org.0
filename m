Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C7D4BAD63
	for <lists+freedreno@lfdr.de>; Fri, 18 Feb 2022 00:50:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19E710E17D;
	Thu, 17 Feb 2022 23:50:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C0610E17D
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 23:49:58 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p9so10941435ejd.6
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 15:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IgGbzOlUTHOWKPpui7MHtfG8jNNY4bniwC/YrreyLuI=;
 b=IhdrQsZx8xawrXEakDHV3a9kOZ8U9S9uUunE5nfMVHp+ZBvfxF1mHvbyZG0jMTuTnG
 +/3fdRSqXEn7uwXzF9F3GkCNY4oC7rJDO48HhEuxRPWaU133PgRgpP39DJ7b6cPyP5cC
 s6paU9KqyRAUfYfpmBrnMSZ3Ip5spynzdF2+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IgGbzOlUTHOWKPpui7MHtfG8jNNY4bniwC/YrreyLuI=;
 b=8C0e0MIZJ1DNQ2pIzKftCSPW1a8ijFip6ZRfClshhummWN7muwfe5HnyMQNK6QCnC6
 gxEHKHyrjgAhV3RQ8SluBgm5iQt5Uh5NH6Ul0wa5GYhdoRz60YvqRzUFsykuGAV5WfLk
 pQFgaZFEJF9O9IYfpbYUrUk2kzeD7SBgpg99xX0k23HvtDqv8GX3Kie38FO9166VDPgf
 FVEAHZjEmKnr7E6GfA7dulxGyH+ntE0FGfDhtgThe8xTCuuGUccsCmjEuu7BErckQ/9d
 r60h8FRi8e8DPrfqr5+yZlPteurH77W18z0O5+2QIK+D/tw/zKcUYFCiP3gI2S8CIFvK
 bzgg==
X-Gm-Message-State: AOAM532Dloga2v83QyvAcKWj7PjoUpWV9vkVLIEqNoXN+lY7iYbdIHnL
 cM4eiYNjj6Zqq2QkxoJsQAb2mQZoFRm04X0kC3I=
X-Google-Smtp-Source: ABdhPJx0lyP4gjRg4ZgJtSZhv9ucSWQ4r4P8iFyDog4eLe6Qr0m1Kaabe84NacPYaNa7dpYsjLPrVg==
X-Received: by 2002:a17:906:4fc7:b0:6d0:84a3:458b with SMTP id
 i7-20020a1709064fc700b006d084a3458bmr2756485ejw.674.1645141797173; 
 Thu, 17 Feb 2022 15:49:57 -0800 (PST)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com.
 [209.85.221.45])
 by smtp.gmail.com with ESMTPSA id b4sm1690905ejv.108.2022.02.17.15.49.55
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 15:49:56 -0800 (PST)
Received: by mail-wr1-f45.google.com with SMTP id o24so11663866wro.3
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 15:49:55 -0800 (PST)
X-Received: by 2002:adf:ef07:0:b0:1e3:333f:a101 with SMTP id
 e7-20020adfef07000000b001e3333fa101mr4100610wro.301.1645141795187; Thu, 17
 Feb 2022 15:49:55 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Feb 2022 15:49:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U9v40Ld1N5VsEbny7BBtSWuC5rNxWqcuLQocS1bxLcoQ@mail.gmail.com>
Message-ID: <CAD=FV=U9v40Ld1N5VsEbny7BBtSWuC5rNxWqcuLQocS1bxLcoQ@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add
 support for eDP panel on CRD
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> +&pm8350c_gpios {
> +       edp_bl_power: edp-bl-power {
> +               pins = "gpio7";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;

As far as I can tell you're lacking:

#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>

...which is needed to use PMIC_GPIO_STRENGTH_LOW. I'm curious how
you're compiling?
