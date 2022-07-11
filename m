Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2E25707D6
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 18:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B358F6FB;
	Mon, 11 Jul 2022 16:02:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82DA8F6F9
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:02:32 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id u20so5317509iob.8
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QQxLMmAEvX+K2A/q42hfIktD7BaiK+JMPvH65uBEZaA=;
 b=QY1RwoI+28PRf0qShn2T0MkMXofeHvPnOhJ8/2X1gNCd5AQ/yjecfyvqYaW+88dHTt
 BPrvH/k4b+A2tN/qWs77K8wtyqYxXtfbgYcdbfIC+oho3Nkrk9GXm+s0rERVMtGjjEJL
 TC83NdQkXbdvmUcIl5GW1ko060ufJM6cedpS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QQxLMmAEvX+K2A/q42hfIktD7BaiK+JMPvH65uBEZaA=;
 b=yeNZ/S5js5IdVweI8zM7B8o/JkzUsVlanIsgDGOaaRbN7RkXfCO/zD7oTRjaYeYNIz
 9SU0nXu5RMxY3FU7POTPVXy2qZwGKttk5zPgA7+vDfvb98n3ZQHMz8v7+1ZoED/Jx1Ib
 uqV3UKP8aCchQz5n+PGJmP3JCOCUtKGUaHUX+bUDV9dC6KvJOv0g882jArC6LS1aZ8uS
 my8gYrMWIXDXoWQhcpY/dJrN7v4KSyz1B3vOCzxPz4/5OBZ4HjXsjP2zy8Yf2x0oRXED
 rL2YWL7021/JVMxOTxBw6RphJLnFaaAobINH8Vv8oacDzXaaVd4AFwUvocf45HU6ZSJ3
 43hA==
X-Gm-Message-State: AJIora8eCK36w9a5qTJMfL37tBsbU7VRHmdS2lgh35sYcccgJHaQ31ZQ
 txm1Fi/eiUJMtiapoOY5YQLVMqGxSByAp/gsWLk=
X-Google-Smtp-Source: AGRyM1uHezYqedwZPzpGT9wDNiQZa3qD7d4s4OlMq+o6IWA4B4B1JAdSTmtYvqVin5IL7i/aqBCmAQ==
X-Received: by 2002:a05:6638:2614:b0:33f:5bc2:b385 with SMTP id
 m20-20020a056638261400b0033f5bc2b385mr2321867jat.246.1657555351722; 
 Mon, 11 Jul 2022 09:02:31 -0700 (PDT)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41]) by smtp.gmail.com with ESMTPSA id
 22-20020a6b1416000000b0067821726c8csm3675517iou.53.2022.07.11.09.02.29
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 09:02:30 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id u6so5158568iop.5
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:02:29 -0700 (PDT)
X-Received: by 2002:a05:6602:3988:b0:67b:9a59:d390 with SMTP id
 bw8-20020a056602398800b0067b9a59d390mr1412375iob.56.1657555349351; Mon, 11
 Jul 2022 09:02:29 -0700 (PDT)
MIME-Version: 1.0
References: <1657555122-18605-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657555122-18605-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 09:02:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com>
Message-ID: <CAD=FV=WC0XQqOyONddX37=ad8M4N2NHB5UTmDVZU5SEggLvFEA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] arm64: dta: qcom: sc7280: delete vdda-1p2
 and vdda-0p9 from mdss_edp
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Andy Gross <agross@kernel.org>,
 quic_mkrishn@quicinc.com, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant@quicinc.coml, LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Mon, Jul 11, 2022 at 8:58 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi | 3 ---
>  1 file changed, 3 deletions(-)

You also need to remove it from
`arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi`.

-Doug
