Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98F4C9907
	for <lists+freedreno@lfdr.de>; Wed,  2 Mar 2022 00:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DBED10E828;
	Tue,  1 Mar 2022 23:16:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3662E10E833
 for <freedreno@lists.freedesktop.org>; Tue,  1 Mar 2022 23:16:50 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id gm1so197930qvb.7
 for <freedreno@lists.freedesktop.org>; Tue, 01 Mar 2022 15:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6LEQhSD9kPhUFJhdm4QVnYBLxI6Q1dvUYGGtcoYTPY4=;
 b=JXjc6V1oUSYysMCD8ROsxbutKaDtrNzAIhjxm/BHI8OwiUW+CLPoK75FJu0mlozoot
 NoSY+sBH/f7W6JjAZWt4Ls19FaRwx56UEzv4i9tHRXLIgdg+ZTSdGcbgWPZiwt4QX2uW
 ZMaZnOhbkHEziQvmynDZeAIyV7mWo5c4F0ujFx03MqmHCZoT55jQKVZkqIK2y+WuawiX
 jMUGu0j8N/DZ5AnxsGH7Q9gTImSMm6zNogRE/4rozZgs26fUtTNksXyneSU/sb0TlyOi
 MCaRZy8CVa8xIkjHl/l/4TcjyzGk8gizZl/hPKvZ6EeC2GIq5+GbKhWU5fsDveHnfSDr
 j6Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6LEQhSD9kPhUFJhdm4QVnYBLxI6Q1dvUYGGtcoYTPY4=;
 b=HWupfZBDvDOQeVij6rrnGtUTKNgx2xWP8E5sTBB0k4ciLmN4C0HGfrud3tNXfko2Ib
 vd9ZvunpQBnMibvn/USfib3RcO5C7d/RLStw7TKQ3G4S/sbkjtav6FsZPV85HOBzYq82
 3g3vgDWmxJveeotLJPSveNFlSJWkKRsstH72hJJMC0CnmSayHr7gLF89apfeFuTl7YFb
 fZHvNHBSjs+wCR/9IrZLRpnxsnJz1iuKjX74hG9NKaTpx7kh6hnOYWYDIXln8SSxa7b/
 Cu7moPT6SIFMIQ7Aw3hlUaGnR8YXFfiC3rx3zanZnDHpRu/DfZMLZ5m2tG+Ob2xuKWQh
 MGmQ==
X-Gm-Message-State: AOAM531Ahhsa8WmQ6GKU9OymQNOgulkrQfH1B1s0YBAEGEHJXhx60IHE
 xLuJhXHRYFAt3zjSxRjL/QeirEuEIrzY1R5/5/Dp2Q==
X-Google-Smtp-Source: ABdhPJw25ridC2MDvo8XWVUeik7An6TOGY6ncUYKZQlZ5z1Gz2h5pIoUJpn/RtQ4xXAqZMGXxlEmL+3fbfu3FTJE3AU=
X-Received: by 2002:ad4:53a4:0:b0:430:1d8c:18ea with SMTP id
 j4-20020ad453a4000000b004301d8c18eamr18928372qvv.115.1646176609345; Tue, 01
 Mar 2022 15:16:49 -0800 (PST)
MIME-Version: 1.0
References: <20220301210513.1855076-1-robh@kernel.org>
In-Reply-To: <20220301210513.1855076-1-robh@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Mar 2022 02:16:38 +0300
Message-ID: <CAA8EJppACmfoz1dgRXbrG2zw_Wa1oJf0zGRCB8utPDXNhLZftg@mail.gmail.com>
To: Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] dt-bindings: display/msm: Drop bogus
 interrupt flags cell on MDSS nodes
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 00:05, Rob Herring <robh@kernel.org> wrote:
>
> The MDSS interrupt provider is a single cell, so specifying interrupt flags
> on the consumers is incorrect.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  .../devicetree/bindings/display/msm/dpu-msm8998.yaml          | 4 ++--
>  .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> index 167bc48748d7..2df64afb76e6 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
> @@ -155,7 +155,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/power/qcom-rpmpd.h>
>
> -    display-subsystem@c900000 {
> +    mdss: display-subsystem@c900000 {
>          compatible = "qcom,msm8998-mdss";
>          reg = <0x0c900000 0x1000>;
>          reg-names = "mdss";
> @@ -192,7 +192,7 @@ examples:
>              clock-names = "iface", "bus", "mnoc", "core", "vsync";
>
>              interrupt-parent = <&mdss>;
> -            interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +            interrupts = <0>;
>              operating-points-v2 = <&mdp_opp_table>;
>              power-domains = <&rpmpd MSM8998_VDDMX>;
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> index 8766b13f0c46..28617bc1d2ff 100644
> --- a/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> @@ -197,7 +197,7 @@ examples:
>                  power-domains = <&rpmpd QCM2290_VDDCX>;
>
>                  interrupt-parent = <&mdss>;
> -                interrupts = <0 IRQ_TYPE_NONE>;
> +                interrupts = <0>;
>
>                  ports {
>                          #address-cells = <1>;
> --
> 2.32.0
>


-- 
With best wishes
Dmitry
