Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E996A4DDFD0
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 18:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 926BF10E02F;
	Fri, 18 Mar 2022 17:26:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14B910E02F
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 17:26:21 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id qx21so18253281ejb.13
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 10:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PCoJVU7mrdRYYKIeNxpHu40jIUtYCc2ytq8sJtJQeGU=;
 b=G/3LRJiL3DqJDP4WBNy8s7yyrZw6nESOCNsC2Nwpxwkyj67SgiTW1sew1I9mDZ9rmq
 5LXuoS1QxtJ748Oyjmt7XCguWrg/XLVqNtIkCzWgSXsqWI6/amBXVbX/UMrghLTYUU7X
 trR4fIkpdHtHmSusLVFyY7k9PVKpBF1ayFw4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PCoJVU7mrdRYYKIeNxpHu40jIUtYCc2ytq8sJtJQeGU=;
 b=eq1T5K34QwsoaypmeJe+YzqvAkwnDFLYT4o/H8bJczrndx2iuhHlMoxpJXqfvqZpaW
 HdiPC+dm+q8299DQz3YS6CQTYlMWHGYM5XxIAFlrqqS0jUZILvE0uaUDFxdMNGIvvFT3
 grUbNl/PqTPk+FnC1XCUEjf2GVZnFmU3/ArBcIbvM+Wun1nvBHpE3Iz+fLyzx8w6hfMD
 yx0uJV36/eEteLdROzp/krnixCS83h+U5EAfqvjek+8E9ceK70nen438GWa6p0om1Z24
 Z90tfVUmUh+kOa6rkgJ+9vP2aIO9TMkkiL2mAn5ZvhHDnpUDVe6QmILZ2LQSEQ6zbeGZ
 Akxg==
X-Gm-Message-State: AOAM533zBA4Cji7ZRbocrJlLrGnjxGePDLFnTJvxutMCg0WYQ1UtstA2
 b54Kji9Qtjw5HSxN0cOVXiGpKRe6k2RwgPwNpDk=
X-Google-Smtp-Source: ABdhPJxEEoqGh+2v1Iy/QHp0HPIen9Gn32Aiya6rdX/MhhnInxusjNBlZXIjQ7W9+vLMC27m2kpFtA==
X-Received: by 2002:a17:906:7952:b0:6da:94c9:cccb with SMTP id
 l18-20020a170906795200b006da94c9cccbmr9863898ejo.469.1647624380103; 
 Fri, 18 Mar 2022 10:26:20 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com.
 [209.85.208.43]) by smtp.gmail.com with ESMTPSA id
 hb11-20020a170907160b00b006df8951ed1bsm2887937ejc.32.2022.03.18.10.26.19
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 10:26:19 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id t1so11070498edc.3
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 10:26:19 -0700 (PDT)
X-Received: by 2002:adf:fc47:0:b0:203:dda1:4311 with SMTP id
 e7-20020adffc47000000b00203dda14311mr9062480wrs.301.1647624064675; Fri, 18
 Mar 2022 10:21:04 -0700 (PDT)
MIME-Version: 1.0
References: <1647452154-16361-1-git-send-email-quic_sbillaka@quicinc.com>
 <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1647452154-16361-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 18 Mar 2022 10:20:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
Message-ID: <CAD=FV=XM1njMY63SCC3yNoA9Uvu+_3xLGkC5OWoLjR-0KnmhWg@mail.gmail.com>
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 2/9] arm64: dts: qcom: sc7280: Add
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 quic_khsieh@quicinc.com, Andy Gross <agross@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, quic_vproddut@quicinc.com,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, quic_abhinavk@quicinc.com,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 quic_kalyant <quic_kalyant@quicinc.com>, LKML <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, krzk+dt@kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Wed, Mar 16, 2022 at 10:36 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> Enable support for eDP interface via aux_bus on CRD platform.
>
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
> ---
>
> Changes in v5:
>   - Change the order of patches
>   - Remove the backlight nodes
>   - Remove the bias setting
>   - Fix compilation issue
>   - Model VREG_EDP_BP for backlight power
>
> Changes in v4:
>   - Create new patch for name changes
>   - Remove output-low
>
> Changes in v3:
>   - Sort the nodes alphabetically
>   - Use - instead of _ as node names
>   - Place the backlight and panel nodes under root
>   - Change the name of edp_out to mdss_edp_out
>   - Change the names of regulator nodes
>   - Delete unused properties in the board file
>
>
> Changes in v2:
>   - Sort node references alphabetically
>   - Improve readability
>   - Move the pwm pinctrl to pwm node
>   - Move the regulators to root
>   - Define backlight power
>   - Remove dummy regulator node
>   - Cleanup pinctrl definitions
>
>  arch/arm64/boot/dts/qcom/sc7280-crd.dts | 93 +++++++++++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)

At a high level, I'd expect your patch to be based upon Matthias's
series, AKA the 4 patches from:

https://lore.kernel.org/r/20220316172814.v1.1.I2deda8f2cd6adfbb525a97d8fee008a8477b7b0e@changeid/

I'll leave it up to you about whether you care to support eDP on the
old CRD1/2 or just on CRD3. Personally I'd think CRD3 would be enough.

Then, I'd expect your patch to mostly incorporate
<https://crrev.com/c/3379844>, though that patch was written before
aux-bus support so the panel would need to go in a different place.

Stephen already gave some comments and basing on Matthias's patches
will be a pretty big change, so I probably won't comment lots more.


> +&mdss_edp {
> +       status = "okay";
> +
> +       data-lanes = <0 1 2 3>;
> +       vdda-1p2-supply = <&vreg_l6b_1p2>;
> +       vdda-0p9-supply = <&vreg_l10c_0p8>;
> +
> +       aux-bus {
> +               edp_panel: edp-panel {

As Stephen pointed out, it should be called "panel".
