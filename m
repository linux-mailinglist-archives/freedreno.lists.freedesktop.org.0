Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 409FF38CBE0
	for <lists+freedreno@lfdr.de>; Fri, 21 May 2021 19:18:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8782897EE;
	Fri, 21 May 2021 17:18:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC07F89683
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 17:18:19 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id v22so20327195oic.2
 for <freedreno@lists.freedesktop.org>; Fri, 21 May 2021 10:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=mwxoM60YVpuuxxpLWPRnHvcEPjCapnvSBgj+Dy7snG0=;
 b=jualahogEVesPIS1gieZtC1DETW5VCcI+hWyJqH0Kdjum2lD+UwbPEbKgqxu7GcmRI
 pHz3Gd6XgJQGv0HVfnMeiKuAAmPge4eHFybgu34Ra+YEqSSGRQ7w5SNmzzTlkAEn8uJT
 wSXoTlG2XmtPpOywIe803JpKMa8vjwuDJ7zTX6z1K431z68kCNBsqNKz76tKz43AxutL
 uDNyXegyJ2L9vg2x5VWLFNkw1+SJF/GTMXvWehvvKArrotqAf2ofM+M4Q1Ib+jAx0B+u
 +vo7SWqkp9zwx/QWUyhMHfr5OZfjGlHaEoUL/25wAGR0kRG9Q6vLurVTiTzPMlA/r4DF
 80zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mwxoM60YVpuuxxpLWPRnHvcEPjCapnvSBgj+Dy7snG0=;
 b=NXnltBdKOoIDuy2nKutL0FQOvRWCnUar0szrboR+6bFNasn4MYXwKNL9C4UY0aVKMP
 kqVlIUlxvn/9IQ1wUXsDdx1zki7tG85Y6ORBmNYFn7jbkqghZrRJzr2UxXHcnwqTLbFk
 afV1Xp3uX0HqUiVE2jqDaGn0TWckdfQYvDCT6ShDydsVfP0x0weICkW/7ei0vfUQlE6O
 TGtPaINSchjFR/49Dqz+wW9OPup8q+oh0bEsCyseJKkotnFHn/9qlgbvQxT1iqBjuqCb
 A6wXUk+qwr8wcY9mgL0BcxPYXJ2o14AHiGGWlhaVR7bgpKnfpQluPRn/gK6+kVqScTQb
 aeLQ==
X-Gm-Message-State: AOAM533Fi+JhqC3U9nJpu1ZtmqkU7obMenQSRwGECYDLSyQhFduJ4BEY
 b9Hid2iraEcYQV5LX7HRqIchGA==
X-Google-Smtp-Source: ABdhPJwgfHYqvQ5wMl38vkWZL9zz0zUQ+NMWGofTkepeO9trJy2uIAEJzA/Kkl4P5rhSVJIkkVUw9w==
X-Received: by 2002:a05:6808:4c2:: with SMTP id
 a2mr2930417oie.150.1621617499278; 
 Fri, 21 May 2021 10:18:19 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w198sm1215089oie.26.2021.05.21.10.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 10:18:18 -0700 (PDT)
Date: Fri, 21 May 2021 12:18:16 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Message-ID: <20210521171816.GD2484@yoga>
References: <1621592844-6414-1-git-send-email-mkrishn@codeaurora.org>
 <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1621592844-6414-3-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v17 3/4] dt-bindings: msm: dsi: add yaml
 schemas for DSI PHY bindings
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
Cc: sean@poorly.run, devicetree@vger.kernel.org, dianders@chromium.org,
 vinod.koul@linaro.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
 abhinavk@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, khsieh@codeaurora.org,
 robdclark@gmail.com, robh+dt@kernel.org, tanmay@codeaurora.org,
 kalyan_t@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri 21 May 05:27 CDT 2021, Krishna Manikandan wrote:

> Add YAML schema for the device tree bindings for DSI PHY.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> 
> Changes in v1:
>    - Merge dsi-phy.yaml and dsi-phy-10nm.yaml (Stephen Boyd)
>    - Remove qcom,dsi-phy-regulator-ldo-mode (Stephen Boyd)
>    - Add clock cells properly (Stephen Boyd)
>    - Remove unnecessary decription from clock names (Stephen Boyd)
>    - Add pin names for the supply entries for 10nm phy which is
>      used in sc7180 and sdm845 (Stephen Boyd)
>    - Remove unused header files from examples (Stephen Boyd)
>    - Drop labels for display nodes and correct node name (Stephen Boyd)
> 
> Changes in v2:
>    - Drop maxItems for clock (Stephen Boyd)
>    - Add vdds supply pin information for sdm845 (Stephen Boyd)
>    - Add examples for 14nm, 20nm and 28nm phy yaml files (Stephen Boyd)
>    - Keep child nodes directly under soc node (Stephen Boyd)
> 
> Changes in v3:
>    - Use a separate yaml file to describe the common properties
>      for all the dsi phy versions (Stephen Boyd)
>    - Remove soc from examples (Stephen Boyd)
>    - Add description for register property
> 
> Changes in v4:
>    - Modify the title for all the phy versions (Stephen Boyd)
>    - Drop description for all the phy versions (Stephen Boyd)
>    - Modify the description for register property (Stephen Boyd)
> 
> Changes in v5:
>    - Remove unused properties from common dsi phy file
>    - Add clock-cells and phy-cells to required property
>      list (Stephen Boyd)
> 
> Changes in v6:
>    - Add proper compatible string in example
> ---
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-14nm.yaml         | 66 ++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-20nm.yaml         | 71 ++++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-28nm.yaml         | 68 +++++++++++++++++++++
>  .../bindings/display/msm/dsi-phy-common.yaml       | 40 ++++++++++++
>  5 files changed, 313 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-20nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-common.yaml
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> new file mode 100644
> index 0000000..4a26bef
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml
> @@ -0,0 +1,68 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/dsi-phy-10nm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Display DSI 10nm PHY
> +
> +maintainers:
> +  - Krishna Manikandan <mkrishn@codeaurora.org>
> +
> +allOf:
> +  - $ref: dsi-phy-common.yaml#
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: qcom,dsi-phy-10nm
> +      - const: qcom,dsi-phy-10nm-8998
> +
> +  reg:
> +    items:
> +      - description: dsi phy register set
> +      - description: dsi phy lane register set
> +      - description: dsi pll register set
> +
> +  reg-names:
> +    items:
> +      - const: dsi_phy
> +      - const: dsi_phy_lane
> +      - const: dsi_pll
> +
> +  vdds-supply:
> +    description: |
> +      Connected to DSI0_MIPI_DSI_PLL_VDDA0P9 pin for sc7180 target and
> +      connected to VDDA_MIPI_DSI_0_PLL_0P9 pin for sdm845 target

"Reference to the 0.9V supply for the PLL." would have been sufficient.

But overall I think the patch looks good.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
