Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13288FDB1B
	for <lists+freedreno@lfdr.de>; Thu,  6 Jun 2024 02:02:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC00E10E37C;
	Thu,  6 Jun 2024 00:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IpLVKVIT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCB110E37C
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jun 2024 00:02:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 784BD61468;
 Thu,  6 Jun 2024 00:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBC3C2BD11;
 Thu,  6 Jun 2024 00:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717632149;
 bh=2G2tZzmDv9j7iW8NqCgiq2C2uMvnSDId5qDlOWEF8sY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IpLVKVITL0BtDoEW8ENkufsrauDT2dEGsHufCcmP/rrP2ajQ/MtwexE2ty3vw2Ect
 X+dtDdO9eaX50HARB5RrF3wiZNb9NKrSphLfrkWs+BZA5CNGgLPL5GoCNDzaiG8WCs
 NRz9OOELSLIJLFxXV/AO7Xd8X41x0mrtilPe28Ks8nQGt+wAqsg6sZlwCla5a6dCAW
 +Yzllipm9Q7rDf60GI9qezkncDtnAFPxeBh+5lYIcl+a9cJFd5L7BepgKH9HSt75Iw
 dlo+h+7sIBN3lTMBu91UBuyH6/ZFdg0K0qGXkaDoftXkv/N2B37nnBBWDlVgF30hMu
 NjTAMYwi2OE9Q==
Date: Wed, 5 Jun 2024 18:02:26 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 MSM <linux-arm-msm@vger.kernel.org>,
 DT <devicetree@vger.kernel.org>, freedreno@lists.freedesktop.org,
 Arnaud Vrac <avrac@freebox.fr>, Pierre-Hugues Husson <phhusson@freebox.fr>
Subject: Re: [PATCH v2 2/4] dt-bindings: display/msm: hdmi: add
 qcom,hdmi-tx-8998
Message-ID: <20240606000226.GA3460814-robh@kernel.org>
References: <a2cb1290-9e01-4136-9592-ce439b1096b6@freebox.fr>
 <9d54a12a-ae66-491c-aa1e-96b7daa02201@freebox.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d54a12a-ae66-491c-aa1e-96b7daa02201@freebox.fr>
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Jun 04, 2024 at 03:47:20PM +0200, Marc Gonzalez wrote:
> HDMI TX block embedded in the APQ8098.
> 
> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
> ---
>  Documentation/devicetree/bindings/display/msm/hdmi.yaml | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/hdmi.yaml b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> index 47e97669821c3..13199f1676f7c 100644
> --- a/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/hdmi.yaml
> @@ -19,14 +19,15 @@ properties:
>        - qcom,hdmi-tx-8974
>        - qcom,hdmi-tx-8994
>        - qcom,hdmi-tx-8996
> +      - qcom,hdmi-tx-8998
>  
>    clocks:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 8
>  
>    clock-names:
>      minItems: 1
> -    maxItems: 5
> +    maxItems: 8
>  
>    reg:
>      minItems: 1
> @@ -151,6 +152,27 @@ allOf:
>              - const: extp
>          hdmi-mux-supplies: false

You need 'maxItems: 5' for clocks in the prior if/then schema.

>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,hdmi-tx-8998
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 8
> +        clock-names:
> +          items:
> +            - const: mdp_core
> +            - const: mnoc
> +            - const: iface
> +            - const: bus
> +            - const: iface_mmss
> +            - const: core
> +            - const: alt_iface
> +            - const: extp

Please match the order of 8996 for the ones that are common.

Rob
