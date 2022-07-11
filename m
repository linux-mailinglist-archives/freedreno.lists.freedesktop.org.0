Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDA9570888
	for <lists+freedreno@lfdr.de>; Mon, 11 Jul 2022 18:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448C912A758;
	Mon, 11 Jul 2022 16:47:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38EB610F95C
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:47:52 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id eq6so7002893edb.6
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CgkIi7fMPRr2AoUFqLpQX7xH/fNuy4VUkp8cy7sE2D4=;
 b=V3/+Rch1ns/j5gS9Z+XimMOBxyslbkPIkGNRpBpOz0bsiaJNcIunGHgZ3wYeuNJ5KB
 iiojbeFMZBZKTs54MZfAuQo8noiaVjkbPCw+VGJd7zq3ffX2k/PYiJbk2Lf2ec74x8vX
 oOjelTn9RDQbi834Br05L23PNacDs9h+toRZ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CgkIi7fMPRr2AoUFqLpQX7xH/fNuy4VUkp8cy7sE2D4=;
 b=ehl5cMCChN4bLLMMAZg5bgE3bH6rj5JSbegpPGSmxkHGrmkIpxYdDKMd4nwCL/pYnw
 FDy6Xmt5CIfUvWInFdDDZu5sBW9ZSlc4C40Z+7CAKBT5iVl+TjzZy6ckGEbt7Z0FGVzv
 ntMDYmEJ2NfTMdoSY6jDwY4aHx/7sYj0eBaU9LcEA7pHlm9aVFqo4wPZIwvs+SkeXIZM
 CVr+XUC7HUDPRqY7qT/zKhAb7W7Rtr/k6oPlmTToudN1mH2wBTnsoWgoFP/oIrYfLrRj
 cJ7PeVfdGCYcZqE/AFnUKE9FT5lliYuiv8A8oISePDxwtt6SAJFtYkeTJC2Wzdf+Qj1o
 fcAw==
X-Gm-Message-State: AJIora/ueG8/J6V478wK8P2iwEBqiDRacrvFlslS82MC83280sj5VOZH
 PckGbLM/SwY3ORQ+Ijb6Op9hXWTOCkQGSgR+XmE=
X-Google-Smtp-Source: AGRyM1uHTL0OhUNy2m8D8PwTeYYd8PYDW/xW/w8uJ6mNIOl4s9pt03c+V8gjxceNl8AP/Oi8h7miyw==
X-Received: by 2002:a05:6402:400a:b0:43a:40e4:af89 with SMTP id
 d10-20020a056402400a00b0043a40e4af89mr26643348eda.383.1657558070556; 
 Mon, 11 Jul 2022 09:47:50 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com.
 [209.85.128.53]) by smtp.gmail.com with ESMTPSA id
 kv21-20020a17090778d500b0070abf371274sm2826926ejc.136.2022.07.11.09.47.49
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 09:47:49 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id ay25so3370130wmb.1
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 09:47:49 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr3975351wmb.188.1657558069021; Mon, 11
 Jul 2022 09:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1657556603-15024-1-git-send-email-quic_khsieh@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 09:47:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X0Fh_p4TnA3c=SadVKCDVFaWnT9Cj1zydQWqZdYL8eSQ@mail.gmail.com>
Message-ID: <CAD=FV=X0Fh_p4TnA3c=SadVKCDVFaWnT9Cj1zydQWqZdYL8eSQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2] arm64: dta: qcom: sc7280: delete
 vdda-1p2 and vdda-0p9 from both dp and edp
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

On Mon, Jul 11, 2022 at 9:23 AM Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Both vdda-1p2-supply and vdda-0p9-supply regulators are controlled
> by dp combo phy. Therefore remove them from dp controller.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 2 --
>  arch/arm64/boot/dts/qcom/sc7280-qcard.dtsi     | 3 ---
>  2 files changed, 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
