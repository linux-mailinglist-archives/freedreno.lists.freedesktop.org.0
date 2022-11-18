Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A06A362F31E
	for <lists+freedreno@lfdr.de>; Fri, 18 Nov 2022 12:01:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC49410E245;
	Fri, 18 Nov 2022 11:01:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com
 [IPv6:2607:f8b0:4864:20::1129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A72010E245
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 11:01:22 +0000 (UTC)
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-381662c78a9so46071607b3.7
 for <freedreno@lists.freedesktop.org>; Fri, 18 Nov 2022 03:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Ovobe2fmhyuPYDoklkU2etCcFH2NxQp5RSdNIJe8b60=;
 b=raJdBwpGpiE+WuVHI+SLApMrpyXB/zkijj4DZV+Yc4lCCvMmxDhF19eVHQR+Jt9Abj
 nFtdPjd4HPDBIPoHN/QHaZ7g70gPEyrL9OjoVW7nJBPtAQF0/05idVala0tCsDvZtwq6
 mn9wn5TApuPWvDNAc3qb4xx6t5fFWt7QCO8UqOvP3z/hvTRJVJe2RfpQIc4IdOrtCKk1
 NpBz0t55cfja3K6wcUpDI87MW9Jhsz8kU7dboIWfGmoZmAndw3cuOajSKy4+hRm9nrGm
 0fIzjHB0nbzG0nSx9fI4VdbSKuzVNA98fsWidV3gLpMDYdPhikkbbo/7OTXQ6sL5p3jk
 Y+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ovobe2fmhyuPYDoklkU2etCcFH2NxQp5RSdNIJe8b60=;
 b=Jvobhc6K+N3g9MMXr4kcPNWsJC6Ztu65zdc3hZBSa8nfgHouPkxrZPb3vYqS25dbOv
 8BXnyC7bmprI8wSdnt+xfVqKdXO76+EgVn1DJpXKb36Lzg5lvLgBVQwDl7WNXo8VrDyx
 n/QDNC3uAzFVDeVG132MtrIJNmbzlC/lFNmuNKxhuoyN3gLEh4v8LyCr2UKIRRdML5C/
 ERC91sFTvNu/LE+Iuc0mGL5FrMocTO7A+5I/Mdo5WHU4xQQf5ytLmJEjLDl7HqWsA9/R
 5emgsfcItplHA8XAEGRmEwnoqm7psyvvRae6iwUfA2oP2Zw8druj8vZKQ9IcCo8ekElF
 lyZQ==
X-Gm-Message-State: ANoB5pn4nT2BJ2ItE9CojUCJWeVXKKlkQKZGrkg3PHcpJ0i5PvAe4K7j
 wIhAM8ACKbUV7BOeOqRObQYD4AupUkNFhtAG+n3XtQ==
X-Google-Smtp-Source: AA0mqf5JTyZRxJWSp9nZNeFD4B5joGQXfKxY0vIOKubrYnUYC6PwJW0ADwQKqfVPCvXfPacDmoHvfB03MLfTPf0+K8k=
X-Received: by 2002:a0d:f846:0:b0:37b:e3ae:decc with SMTP id
 i67-20020a0df846000000b0037be3aedeccmr6063826ywf.418.1668769281590; Fri, 18
 Nov 2022 03:01:21 -0800 (PST)
MIME-Version: 1.0
References: <1668725369-6331-1-git-send-email-quic_khsieh@quicinc.com>
 <1668725369-6331-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1668725369-6331-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 18 Nov 2022 13:01:10 +0200
Message-ID: <CAA8EJppjMK=SNbnir4QGgVJ5we1UGjrrvG6KJFgcSfRVZZm8sw@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/2] arm64: dts: qcom: add data-lanes and
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

On Fri, 18 Nov 2022 at 00:50, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> Add both data-lanes and link-frequencies property to dp_out endpoint.

Bindings update?
Deprecate the old data-lanes property?

> Also set link-frequencies to 810000 khz at herobrine platform to have
> max link rate limited at 810000 khz (HBR3).

No. As  I stated before, the link-frequencies should list all
supported frequencies (min/max in case the frequencies are
continuous).
Stating just maximum is against the property description.

>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi   |  9 ++++++++-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi           |  5 -----
>  arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi | 10 +++++++++-
>  arch/arm64/boot/dts/qcom/sc7280.dtsi           |  5 -----
>  4 files changed, 17 insertions(+), 12 deletions(-)
>

[skipped the sc7180 here. All comments noted against sc7280 apply to
sc7180 too].

> diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> index 93e39fc..e8fca18 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
> @@ -440,7 +440,15 @@ ap_i2c_tpm: &i2c14 {
>         status = "okay";
>         pinctrl-names = "default";
>         pinctrl-0 = <&dp_hot_plug_det>;
> -       data-lanes = <0 1>;
> +       ports {
> +               port@1 {
> +                       reg = <1>;
> +                       dp_out: endpoint {
> +                               data-lanes = <0 1>;
> +                               link-frequencies=<810000>;

Following the existing examples is nice. Not following them is frowned upon.

> +                       };
> +               };
> +       };

Just:

&dp_out {
    data-lanes = <0  1>;
    link-frequencies = /bits/ 64 <160000000 270000000 540000000 810000000>;
};

>  };
>
>  &mdss_mdp {
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index a646405..4afe53b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -3899,11 +3899,6 @@
>                                                         remote-endpoint = <&dpu_intf0_out>;
>                                                 };
>                                         };
> -
> -                                       port@1 {
> -                                               reg = <1>;
> -                                               dp_out: endpoint { };
> -                                       };

Please leave it here. It is a part of the SoC, so it should be in SoC dtsi.

>                                 };
>
>                                 dp_opp_table: opp-table {

-- 
With best wishes
Dmitry
