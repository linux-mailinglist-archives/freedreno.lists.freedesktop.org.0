Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48026733D3
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 09:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D5DD10E8F0;
	Thu, 19 Jan 2023 08:37:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28D1710E8E2
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 08:37:11 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id p188so1605840yba.5
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 00:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5W30qCxVKf0KARy+TLTjIt9Y3WaxPoZtvKimLdjidWI=;
 b=dZmYHThxSgG/zloX7Dz/TblAHFGnQhaqJk3S0H4Co64uzDBruSrZJJAa414xkyUiZ6
 GqXevocPagiBF441A9XBAHat6S7FH48JHWwnnC6LPJeYmsq8zWSIsyMKf8KlBU8TV0qU
 csfJ8Ic2UG8OkBQU6W5nggtagyfFDQ9pK7fquszs+FGyc/ZoNNrgVV2pa4SexUZjrT13
 ocq/z2jBesQxSbF6VdXdyKsudFED0HQsJL0Kv1j/+WOZs4HxCL6BxUeaYzzYYmafDaeb
 dVddQeLZDMbbY/TRxhw5YKERjHg1IZ6NqcVmnKueThsnwWgJSCmYhVWZD1b1yKKEUd1A
 +1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5W30qCxVKf0KARy+TLTjIt9Y3WaxPoZtvKimLdjidWI=;
 b=HkmDkJKF79Mq71MG3klJ5fjCM/D0LP+nFWrG9IYEvlAAsw/6ZKZYEEwxarR/G4jynP
 QlzmAmkqtGBOAQJzYzZQlYyeamdGpFEbHKAkS3ClPZkpviqh4T5hk1LFObG8Aw5QOaZK
 Vx6aN7wCW9PvNgsFapI31dXsJDvIoH0qnzPXd7OTRW4voZwtbJTrSrGXeBde+gAmeQfW
 seRYCplzbMZNtEVNccKsUhAgZ0KLTAYAVq2fiAPxadNbmz27PnvcuhijBTNcKnYw67vr
 oagfPGbmPaVsQb0Y9W/hpYPcrokPORs/YBq/bcxShJsFq/x4dkK4QdsitD1pWZ6eoAtl
 AzEQ==
X-Gm-Message-State: AFqh2kqwHcsZ61m7IiqotNjZ1HGrk0QA4Uvl7ACliu8q3PCPneHxBl15
 HDfIHcwbJavhBHOCNDhNXEarBLfY8P3awQhkkT3zSg==
X-Google-Smtp-Source: AMrXdXuaEM66ZFVHU3adMHT8v6p6wBn0BYXl02ic25ZtL9O2RpLvMcfl5xsbyGaABZf1lpRV0+JwNKzTNmOGQDTLOdI=
X-Received: by 2002:a5b:592:0:b0:7ed:9cee:464 with SMTP id
 l18-20020a5b0592000000b007ed9cee0464mr1308159ybp.194.1674117430262; 
 Thu, 19 Jan 2023 00:37:10 -0800 (PST)
MIME-Version: 1.0
References: <20230118193015.911074-1-markyacoub@google.com>
 <20230118193015.911074-9-markyacoub@google.com>
In-Reply-To: <20230118193015.911074-9-markyacoub@google.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 19 Jan 2023 10:36:59 +0200
Message-ID: <CAA8EJpq689pt0VXEjo_F48W8JQ+MGnEX3TH1z2ACdD_49YG-mg@mail.gmail.com>
To: Mark Yacoub <markyacoub@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 08/10] dt-bindings: msm/dp: Add bindings
 for HDCP registers
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
 agross@kernel.org, Mark Yacoub <markyacoub@chromiu.org>,
 quic_jesszhan@quicinc.com, ankit.k.nautiyal@intel.com,
 devicetree@vger.kernel.org, lyude@redhat.com, tzimmermann@suse.de,
 Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, lucas.demarchi@intel.com,
 quic_abhinavk@quicinc.com, jani.nikula@linux.intel.com, swboyd@chromium.org,
 robh+dt@kernel.org, christophe.jaillet@wanadoo.fr, jose.souza@intel.com,
 rodrigo.vivi@intel.com, bjorn.andersson@linaro.org, sean@poorly.run,
 johan+linaro@kernel.org, tvrtko.ursulin@linux.intel.com, andersson@kernel.org,
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
> This patch adds the bindings for the MSM DisplayPort HDCP registers
> which are required to write the HDCP key into the display controller as
> well as the registers to enable HDCP authentication/key
> exchange/encryption.
>
> We'll use a new compatible string for this since the fields are optional.

This doesn't correspond to patch contents.

>
> Cc: Rob Herring <robh@kernel.org>

This should be a

> Cc: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Signed-off-by: Mark Yacoub <markyacoub@chromiu.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20210913175747.47456-13-sean@poorly.run #v1
> Link: https://patchwork.freedesktop.org/patch/msgid/20210915203834.1439-13-sean@poorly.run #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20211001151145.55916-13-sean@poorly.run #v3
> Link: https://patchwork.freedesktop.org/patch/msgid/20211105030434.2828845-13-sean@poorly.run #v4
> Link: https://patchwork.freedesktop.org/patch/msgid/20211115202153.117244-1-sean@poorly.run #v4.5
> Link: https://patchwork.freedesktop.org/patch/msgid/20220411204741.1074308-9-sean@poorly.run #v5

Please, clean this up. I suspect that the long list of previous
iterations might belong to the cover letter, but not to the series
themselves.

>
> Changes in v2:
> -Drop register range names (Stephen)
> -Fix yaml errors (Rob)
> Changes in v3:
> -Add new compatible string for dp-hdcp
> -Add descriptions to reg
> -Add minItems/maxItems to reg
> -Make reg depend on the new hdcp compatible string
> Changes in v4:
> -Rebase on Bjorn's multi-dp patchset
> Changes in v4.5:
> -Remove maxItems from reg (Rob)
> -Remove leading zeros in example (Rob)
> Changes in v5:
> -None
> Changes in v6:
> -Rebased: modify minItems instead of adding it as new line.
>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml    | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index f2515af8256f..17d741f9af86 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -24,13 +24,15 @@ properties:
>        - qcom,sm8350-dp
>
>    reg:
> -    minItems: 4
> +    minItems: 5

No. eDP uses 4 register blocks.

>      items:
>        - description: ahb register block
>        - description: aux register block
>        - description: link register block
>        - description: p0 register block
>        - description: p1 register block
> +      - description: (Optional) Registers for HDCP device key injection
> +      - description: (Optional) Registers for HDCP TrustZone interaction
>
>    interrupts:
>      maxItems: 1
> @@ -154,7 +156,9 @@ examples:
>                <0xae90200 0x200>,
>                <0xae90400 0xc00>,
>                <0xae91000 0x400>,
> -              <0xae91400 0x400>;
> +              <0xae91400 0x400>,
> +              <0xaed1000 0x174>,
> +              <0xaee1000 0x2c>;
>          interrupt-parent = <&mdss>;
>          interrupts = <12>;
>          clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> --
> 2.39.0.246.g2a6d74b583-goog
>


-- 
With best wishes
Dmitry
