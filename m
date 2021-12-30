Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085F481CE6
	for <lists+freedreno@lfdr.de>; Thu, 30 Dec 2021 15:14:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 207B610E79E;
	Thu, 30 Dec 2021 14:14:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1E7410E79C
 for <freedreno@lists.freedesktop.org>; Thu, 30 Dec 2021 14:14:45 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id b85so22758287qkc.1
 for <freedreno@lists.freedesktop.org>; Thu, 30 Dec 2021 06:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIiHEJXmhVq0VBafG1mogzpPwrmMW4FruUD/NmecsX4=;
 b=v2hIyW3mD6FmJ8nkeft+cv6KuVC1JDxtGiR2QFqmE90D7SaoYnF5CB/FKe3h9JwOyq
 /I6mAjM/ssDxFxSSX7wxbUTseuVA4Zuj4iwEoAV7cdbqCjzZJfa+MvYLfMn2myxyq+cZ
 Cp3qJdFlJth6krKQcCtQLgt17jme53BYOgvsoN5KAyfbvcafNi4bj5ejB3w2TFeyZPMH
 Lgiw4wQZ7QipW3UrHtkF1Sq7x/beho5bu9SjSXqX+s1aAhPJ0ELi3+zd5n7TPHeVHe+N
 4AE4Qlbew+zsjT60mRIGyW2N1jNoGoP8csJbdLLCzlfLR3tEC7SS3GVGbKNYHkZKHHMN
 H03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIiHEJXmhVq0VBafG1mogzpPwrmMW4FruUD/NmecsX4=;
 b=XDW+K4JJb3xbXcjEBHX66lbE37nkvtlYh83E9H+4lmDzo6IqDTQHTAWnImaktHExEs
 YmlPjEqCNTaxF0wj7goWsyq/BniIWkhHDnJRdEFCLX0QhpJu0LPQvv8qf2VC8TDCZmZK
 rZg5WpBTw0Bq0AyKxYgYi43yJOKvFM8q7IxMDaFU/QheIQW5hleJc4uYwQXZzZH7te5Q
 uQR1GMVDpYFUYbKtbG6aHCqGOlbNSPf5re0ukvpfgpD8VvTuKGo2b5Gez7s3MVp6fmg3
 EVyC74Hvinq/LoQQaZaMhtBRqDIccSlWYGMWrVOYmj0UVkASlHT4LFJgc3tz6Aje5EL2
 wraQ==
X-Gm-Message-State: AOAM532KfsDtHTUZivvKhd/oth07orIWrpuzzrfn9AD0AU3LHXw+umHy
 LsVbydYfzaRO3CN0ColwDYy/RpufIpONxMk17wo/Sg==
X-Google-Smtp-Source: ABdhPJwiPhF1WQpKvdE8hOeE3MBy5zy9jvFyDBDOF14ZRUSR7yDBFMcY79AZCN5Dj2E2nbfMQHBa9NJGEFhbiHTXthI=
X-Received: by 2002:a37:b8b:: with SMTP id 133mr19734621qkl.59.1640873684877; 
 Thu, 30 Dec 2021 06:14:44 -0800 (PST)
MIME-Version: 1.0
References: <1640856276-14697-1-git-send-email-quic_rajeevny@quicinc.com>
 <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
In-Reply-To: <1640856276-14697-2-git-send-email-quic_rajeevny@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 30 Dec 2021 17:14:34 +0300
Message-ID: <CAA8EJppoe8ebU-yNKF6fbuDK4nf=09eNzVvaq_wQ+qKdjWEf4w@mail.gmail.com>
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [v1 1/2] dt-bindings: msm/dsi: Add 10nm dsi phy
 tuning properties
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
Cc: quic_kalyant@quicinc.com, freedreno@lists.freedesktop.org,
 jonathan@marek.ca, devicetree@vger.kernel.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 robdclark@gmail.com, robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 daniel@ffwll.ch, swboyd@chromium.org, sean@poorly.run, robh@kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 30 Dec 2021 at 12:25, Rajeev Nandan <quic_rajeevny@quicinc.com> wrote:
>
> Add 10nm dsi phy tuning properties for phy drive strength and
> phy drive level adjustemnt.
>
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> index 4399715..9406982 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -35,6 +35,18 @@ properties:
>        Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
>        connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target
>
> +  phy-drive-strength-cfg:
> +    type: array
> +    description:
> +      Register values of DSIPHY_RESCODE_OFFSET_TOP and DSIPHY_RESCODE_OFFSET_BOT
> +      for all five lanes to adjust the phy drive strength.
> +
> +  phy-drive-level-cfg:
> +    type: array
> +    description:
> +      Register values of DSIPHY_RESCODE_OFFSET_TOP for all five lanes to adjust
> +      phy drive level/amplitude.
> +
>  required:
>    - compatible
>    - reg
> @@ -64,5 +76,12 @@ examples:
>           clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                    <&rpmhcc RPMH_CXO_CLK>;
>           clock-names = "iface", "ref";
> +
> +         phy-drive-strength-cfg = [00 00
> +                                   00 00
> +                                   00 00
> +                                   00 00
> +                                   00 00];
> +         phy-drive-level-cfg = [59 59 59 59 59];

And second notice. This interface seems to be too register-centric.
You provide register values without any actual way to interpret them.
I'd prefer to have something closer to pinctrl. Specify strength and
level in some logical way and then in the driver interpret that into
register values.

-- 
With best wishes
Dmitry
