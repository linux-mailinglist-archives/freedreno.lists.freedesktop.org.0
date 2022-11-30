Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB00463D1A2
	for <lists+freedreno@lfdr.de>; Wed, 30 Nov 2022 10:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F272910E0BB;
	Wed, 30 Nov 2022 09:21:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91F810E0BB
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 09:20:57 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id o127so5270950yba.5
 for <freedreno@lists.freedesktop.org>; Wed, 30 Nov 2022 01:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VgWpKJeG3/tybrVDEBxDjhgC2NrM3Rx6PkdmaV95rbk=;
 b=zdtQAQWDk4FnFK86ZcgrZQAMzCT1IyHgsnQbdaM9MxP1jbUKoo405i8aFBPc2XxnvN
 72mLgb3//1aOTLAuTenYxEYS2Qog7auIYPPg2d5dljDuySf0AdxzIwnB0teGfyh3MHXH
 7T5NfKCg9gyoGE2r8WTcsCR5Gsrq/tbwK9k4UmtV482FrjipmAESmoMrZHVQK1Mn8+mo
 AugT8o9vYgoN7Yuv746DbDvt/ldIJlsB5BQnH7w9iVSD15F/iTfgeCA4hxVQuGmR6TlI
 QcTn7HivJ3tn71hBper17qTBIYVbLsGddGXI5rXd/IQRpdEgqx2PUr/vTvykUORMCJlk
 DiWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VgWpKJeG3/tybrVDEBxDjhgC2NrM3Rx6PkdmaV95rbk=;
 b=7hqgcsF6lqiO8g7MCNtf61yw+RvNk8ps84ukxRVfYD+LWpcMtTMaiEkZ7Whu2q+s77
 3t9WDd6VxZrNbPovpA/YnhVO2U/LXWCWW2vcbm47j3H0SfSRu/EvaCRXXV4U1jkeCEKa
 vqq7KihmxAt3LHkV7fn0j6GykkqnvHE62BlorpV05lo9yt0lqZJ4S7A5bfIQaAVYY9o0
 O9WuqKUCPr293x9UG3Ij6dnqy03pI8NVyy7La9i8OeE3znK5Um15ZkUVzDhOHwD/Hy/L
 IWXW8/PumtedIi5+YRHTOpmFpIdiiWG9Ye/6ANtN+GeiDLn8oIGFHa0vdbwzK0JI3ebK
 yRbw==
X-Gm-Message-State: ANoB5pkIJccFSwQ7f8Eflw2uKCzOedWbrPvwU0ih7vp+NUXQonxHj9c9
 Q27Hkfr4QQVBwh/4zdjOTW6YeDUKgo3a0NGFD3UyWw==
X-Google-Smtp-Source: AA0mqf78Hw8TSqu8oK1aqKN8OQkfbNJgRXzi7U0lTakAB9DHU/yOz5bIOkvZbFBAe3UtMnwI80NSL2OBrOGx5UEJzs8=
X-Received: by 2002:a25:ae91:0:b0:6f7:fd66:8e5c with SMTP id
 b17-20020a25ae91000000b006f7fd668e5cmr10277731ybj.516.1669800056665; Wed, 30
 Nov 2022 01:20:56 -0800 (PST)
MIME-Version: 1.0
References: <1669767131-13854-1-git-send-email-quic_khsieh@quicinc.com>
 <1669767131-13854-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1669767131-13854-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 30 Nov 2022 11:20:45 +0200
Message-ID: <CAA8EJpr_AODJ6WPB8_4aRY8q6XBy3-cXMOkox7VfL-PK1p4pQg@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5 1/3] arm64: dts: qcom: add data-lanes and
 link-freuencies into dp_out endpoint
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 30 Nov 2022 at 02:12, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Move data-lanes property from mdss_dp node to dp_out endpoint. Also
> add link-frequencies property into dp_out endpoint as well. The last
> frequency specified at link-frequencies will be the max link rate
> supported by DP.
>
> Changes in v5:
> -- revert changes at sc7180.dtsi and sc7280.dtsi
> -- add &dp_out to sc7180-trogdor.dtsi and sc7280-herobrine.dtsi

Bindings update?

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   | 6 +++++-
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 6 +++++-
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 754d2d6..39f0844 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -812,7 +812,11 @@ hp_i2c: &i2c9 {
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&dp_hot_plug_det>;
> -       data-lanes = <0 1>;
> +};
> +
> +&dp_out {
> +    data-lanes = <0  1>;
> +    link-frequencies = /bits/ 64 <160000000 270000000 540000000>;
>  };
>
>  &pm6150_adc {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 93e39fc..b7c343d 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -440,7 +440,11 @@ ap_i2c_tpm: &i2c14 {
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&dp_hot_plug_det>;
> -       data-lanes = <0 1>;
> +};
> +
> +&dp_out {
> +       data-lanes = <0  1>;
> +       link-frequencies = /bits/ 64 <160000000 270000000 540000000 810000000>;
>  };
>
>  &mdss_mdp {
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
