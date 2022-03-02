Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029704C9A94
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 02:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA6110E159;
	Wed,  2 Mar 2022 01:39:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B086410E16F
 for <freedreno@lists.freedesktop.org>; Wed,  2 Mar 2022 01:39:43 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id j24so441083oii.11
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 17:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=hnwoWuopSS9aETx0aHea8Gzs/Q2ZaAGgt+ETW/rAvRg=;
 b=PvF7shDgPAkwu9Y3aP0ixbn3B4FAMuHTY2SxTI+xgkj/u8a6wt62gGtkB30eEbEqC1
 HiyDEXMUCRX1jZFBiTvQ9s5qkvmd0HQlcZqJGZ4TTJgv5vp/9nC4whBYUfoIkmWg54O9
 HA86nqiSleIYSB7KBfT+icrEoJyHfSUHpJVm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=hnwoWuopSS9aETx0aHea8Gzs/Q2ZaAGgt+ETW/rAvRg=;
 b=REScu8Hh9aJ1Nc1bhz/9++FPCOuDWL/2DW7sh9pboz2hSubn6AmCFJBJ6g5mWQQ+Eo
 pfg1hqUmcZhz53os2ukVilf64S1sNxhQ8QrkBolfKffHJen738fFBZahcD8KopSMY8z0
 jl/8fU8dZ+D/GEfxulnm/4rjMk/9p75AiUm2IQrxTNceQu4kHbrzaTXvX2jE4TtQ8pQn
 dpcdZPh/kG8j5VOlTj1wm5HXmjjWkNK3p7Sukct2etdyhtTQNNO0jirwZbEZDbBvrID2
 hHTERspztIpCEMWXblfAyMeIqse+JtUp4SEIkRrsN0Lr+eSERWd+snkjp37wOKd9Bypn
 wo+w==
X-Gm-Message-State: AOAM531i9xrmoLkkYvE/h6ecym4fLgxKaC10zKLXpWeg2oJVKgPpJ3Ex
 aLxgEhOQBgI3qmHQs9OPVoiBKrQzG/ue2Rz8A7iYUQ==
X-Google-Smtp-Source: ABdhPJwQZPLrAbhDzbz89E/z0cdbssP7BsqOm6RzYz69UZb0XC3YFKHa3jk7tT+ocOa6FfgH6dPjedEJ+ySy1/BblWE=
X-Received: by 2002:a05:6808:1a28:b0:2d7:3c61:e0d6 with SMTP id
 bk40-20020a0568081a2800b002d73c61e0d6mr17329920oib.32.1646185183049; Tue, 01
 Mar 2022 17:39:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:42 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-5-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
 <20220302005210.2267725-5-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:39:42 -0800
Message-ID: <CAE-0n50BPBWGY3X-Xzy8Pn5K2v0csS-J407Ajr8_29an-tanEg@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 5/5] arm64: dts: qcom: sm8250: Drop flags
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

Quoting Dmitry Baryshkov (2022-03-01 16:52:10)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
