Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DA04CC937
	for <lists+freedreno@lfdr.de>; Thu,  3 Mar 2022 23:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2307010E3BC;
	Thu,  3 Mar 2022 22:38:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84A8810E3B8
 for <freedreno@lists.freedesktop.org>; Thu,  3 Mar 2022 22:38:16 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id g20so8506820edw.6
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ST9Fc76g6pvjQi4fhR+noZ4Seq3datbHBQS0X9jUxZ8=;
 b=FrOz5ub3zWjEQK22ZLwg3u+vEvcmxk5pcWahe3+zoJFfvsvs0UQBjv/AElEkUlyAw9
 EePN55pYYRl4RbnXJxniWi54yJRwLRFnUpNNgmipiWdmEHy76MIi5bA6dIIROOGw5+9j
 DlrsvRRt7Ab5hlgGMIvKwZMS89rVmz14yqa6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ST9Fc76g6pvjQi4fhR+noZ4Seq3datbHBQS0X9jUxZ8=;
 b=Asr/4wKCFelv5GjfD1HXgzPjO6hLJl/7tx3a27ktZzNIjnXTHuSz4VKCYzoXlrSlm4
 K4lxSu8QoIkWDeSz3gyBMGe0pdNvL1vH5VJjCvS2AHDCTdDxLrTDWnO7o3e+jtyzcode
 cOxJrD9k1RrWAv7U0w94QGskc03b8gS3oJZABaiigTI//ckxGdONdesuPHcts1KiiqfW
 ztO7xn6/qI2eqwU9KsvnNIHQ0CQZ+J27bGY3JkpBg6xI4LqjYAgzPDQML4lBrAJ5HfX1
 45cQqHsxasJrRt/p4xVtHsuSNnnxDpX8MYJM/vW1+1LALDr2JPPEqU2LPFSdmH2Z+Wuc
 S+Gg==
X-Gm-Message-State: AOAM5313wwfaiNdf2Sok17bcWWRTTvv5xPCd2g0f+sbZV0xU12dDowkB
 DMnMHqmxI2RLb7Cwh+zKAplhiZYJI9/RDQ==
X-Google-Smtp-Source: ABdhPJxXI0jfo3W1oz8oQpDwjcAJaql5NxvgnOFunWrQILmXdjfV3fRF266KYtuyj3tlMyrtFN8NFw==
X-Received: by 2002:a50:cfc4:0:b0:413:b19d:d9c0 with SMTP id
 i4-20020a50cfc4000000b00413b19dd9c0mr23144544edk.384.1646347094801; 
 Thu, 03 Mar 2022 14:38:14 -0800 (PST)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com.
 [209.85.128.48]) by smtp.gmail.com with ESMTPSA id
 c6-20020a05640227c600b00415e926bbe1sm987630ede.89.2022.03.03.14.38.13
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Mar 2022 14:38:13 -0800 (PST)
Received: by mail-wm1-f48.google.com with SMTP id
 l2-20020a7bc342000000b0037fa585de26so4564450wmj.1
 for <freedreno@lists.freedesktop.org>; Thu, 03 Mar 2022 14:38:13 -0800 (PST)
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr5453850wmj.98.1646347092922; Thu, 03 Mar
 2022 14:38:12 -0800 (PST)
MIME-Version: 1.0
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646300401-9063-2-git-send-email-quic_vpolimer@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 3 Mar 2022 14:38:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VHBn0H6Oz0F3vHrXZzSSo8y+QbLc-xn+CVVSQkommsHw@mail.gmail.com>
Message-ID: <CAD=FV=VHBn0H6Oz0F3vHrXZzSSo8y+QbLc-xn+CVVSQkommsHw@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v4 1/4] arm64/dts/qcom/sc7280: remove
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Thu, Mar 3, 2022 at 1:40 AM Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> Kernel clock driver assumes that initial rate is the
> max rate for that clock and was not allowing it to scale
> beyond the assigned clock value.
>
> Drop the assigned clock rate property and vote on the mdp clock as per
> calculated value during the usecase.

I see the "Drop the assigned clock rate property" part, but where is
the "and vote on the mdp clock" part? Did it already land or
something? I definitely see that commit 5752c921d267 ("drm/msm/dpu:
simplify clocks handling") changed a bunch of this but it looks like
dpu_core_perf_init() still sets "max_core_clk_rate" to whatever the
clock was at bootup. I assume you need to modify that function to call
into the OPP layer to find the max frequency?


> Changes in v2:
> - Remove assigned-clock-rate property and set mdp clk during resume sequence.
> - Add fixes tag.
>
> Changes in v3:
> - Remove extra line after fixes tag.(Stephen Boyd)
>
> Fixes: 62fbdce91("arm64: dts: qcom: sc7280: add display dt nodes")

Having a "Fixes" is good, but presumably you need a code change along
with this, right? Otherwise if someone picks this back to stable then
they'll end up breaking, right? We need to tag / note that _somehow_.
