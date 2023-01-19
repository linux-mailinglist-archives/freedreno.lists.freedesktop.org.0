Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F56733E0
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 09:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A54510E8E3;
	Thu, 19 Jan 2023 08:40:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB2ED10E8D3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 08:40:42 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-4bf16baa865so16778177b3.13
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Wz30k0eHuCJ5qW+R1e/5VxG1p016U2jxYAEXQ6zDyEk=;
 b=IYs36GIo4XvlIdNhAXfovMq2GHRF7gmKwKlRQmrnF4ajNS9SSKRkjhGtnAxNu+XsbF
 4lYop2I58AhUQvp6C1U8Sg08CXcjtReKV5TH3rsatEn+FiyLfnN9fgHV1E+wNqhtC7yG
 PG0GsRqAPE27R94ZCIOFARXmHTa5kkQNuo8c41oWFdmGazDVm9n0g/NEBvel22/cQdx8
 7qvT1InMrpl3t+rEjLo2EXjI7kfGnUUbPo+JU8AtVJgubdVEQaSNIXTB5foczjEY/yRD
 9SFXwwWe8k6x1G8apIF7slaNxKeCFm7zsrNxnNaHwXSzp0W7897zq3kN4mQl9VXyopSZ
 CCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Wz30k0eHuCJ5qW+R1e/5VxG1p016U2jxYAEXQ6zDyEk=;
 b=NJlwdTvKeJYSWJjtx1TE3/Ewrn9zxz4xs+5jQ+pPR4A3h30ckgkK8XqD4rlxhe2XQT
 mmjnULYV3vnU4ONc56Exb8YeGGiqgpGAPqY8xp9fMrjDADwA5+0+wfehU/Ibkd878aLR
 eDi0j3QEfr0AzOokwLg04Txu2gF4WhSxJr360MFwgIK9lya2JK0CudXVn0/fIJ/rRPQL
 MC/HtrHL5SE7N6YnTiPL+GqbZAa28/m+v4ynrkKaxz3Zz7pIBDsWvjZaGKI+pkjC1/V4
 01OQpyeGWTuYq52H47RNL+fsuUG+SWzQzx8ho+1duL4hjEeGOT9Vnc5FwG0UNKXjh/Ub
 RrKw==
X-Gm-Message-State: AFqh2koxyDa1HZAJVkl9Sb4liQ4xPC5yfu8JEsihDfjzvKyM7jOPMzTA
 KCfXePQF8QDriDhO/FVYAMQ/lShZ6D6OZSbK/Ps8Zg==
X-Google-Smtp-Source: AMrXdXvA8Npb0BzSkuo6iBimkuIOlahd1dNVQpsDdSqUrv249CwsCg4zyuf/p2yX6ErTXCQN9nQbqKKzNwL6V4wL72M=
X-Received: by 2002:a81:7582:0:b0:370:4c23:eacc with SMTP id
 q124-20020a817582000000b003704c23eaccmr1183986ywc.127.1674117641858; Thu, 19
 Jan 2023 00:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-10-markyacoub@google.com>
In-Reply-To: <20230118193015.911074-10-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 Jan 2023 10:40:31 +0200
Message-ID: <CAA8EJppqft3vtB9PgLe=NunYCo48rAQzAb_nLYACAQ8Onr_ZaA@mail.gmail.com>
To: Mark Yacoub <markyacoub@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 09/10] arm64: dts: qcom: sc7180: Add
 support for HDCP in dp-controller
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
Cc: quic_sbillaka@quicinc.com, imre.deak@intel.com,
 joonas.lahtinen@linux.intel.com, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 arun.r.murthy@intel.com, krzysztof.kozlowski+dt@linaro.org, airlied@gmail.com,
 hbh25y@gmail.com, ville.syrjala@linux.intel.com, marex@denx.de,
 ashutosh.dixit@intel.com, matthew.d.roper@intel.com, abhinavk@codeaurora.org,
 javierm@redhat.com, quic_khsieh@quicinc.com, stanislav.lisovskiy@intel.com,
 agross@kernel.org, quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 devicetree@vger.kernel.org, lyude@redhat.com, tzimmermann@suse.de,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 lucas.demarchi@intel.com, quic_abhinavk@quicinc.com,
 jani.nikula@linux.intel.com, swboyd@chromium.org, robh+dt@kernel.org,
 christophe.jaillet@wanadoo.fr, jose.souza@intel.com, rodrigo.vivi@intel.com,
 bjorn.andersson@linaro.org, sean@poorly.run, johan+linaro@kernel.org,
 tvrtko.ursulin@linux.intel.com, andersson@kernel.org,
 linux-kernel@vger.kernel.org, swati2.sharma@intel.com,
 manasi.d.navare@intel.com, robdclark@gmail.com, daniel@ffwll.ch,
 bhanuprakash.modem@intel.com, seanpaul@chromium.org,
 freedreno@lists.freedesktop.org, maxime@cerno.tech
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 18 Jan 2023 at 21:30, Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch adds the register ranges required for HDCP key injection and
> HDCP TrustZone interaction as described in the dt-bindings for the
> sc7180 dp controller. Now that these are supported, change the
> compatible string to "dp-hdcp".

No change in compatibles, so patch description should be updated.

>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-15-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-14-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-14-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-14-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-10-sean@poorly.run #v5

Again, this probably belongs to a cover letter

>
> Changes in v3:
> -Split off into a new patch containing just the dts change (Stephen)
> -Add hdcp compatible string (Stephen)
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v5:
> -Put the tz register offsets in trogdor dtsi (Rob C)
> Changes in v6:
> -Rebased: Removed modifications in sc7180.dtsi as it's already upstream
>
> ---
>  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> index 178efaaa89ec..6f6fe5cb6563 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi
> @@ -817,6 +817,14 @@ &mdss_dp {
>         pinctrl-names = "default";
>         pinctrl-0 = <&dp_hot_plug_det>;
>         data-lanes = <0 1>;
> +
> +       reg = <0 0x0ae90000 0 0x200>,
> +             <0 0x0ae90200 0 0x200>,
> +             <0 0x0ae90400 0 0xc00>,
> +             <0 0x0ae91000 0 0x400>,
> +             <0 0x0ae91400 0 0x400>,
> +             <0 0x0aed1000 0 0x175>,
> +             <0 0x0aee1000 0 0x2c>;

Is there any reason for adding these to the -trogdor instead of adding
them to the base dtsi? Does hardware differ between the sc7180.dtsi
and sc7180-trogdor.dtsi?

>  };
>
>  &pm6150_adc {
> --
> 2.39.0.246.g2a6d74b583-goog
>


-- 
With best wishes
Dmitry
