Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A783F73B175
	for <lists+freedreno@lfdr.de>; Fri, 23 Jun 2023 09:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D42F10E5F5;
	Fri, 23 Jun 2023 07:27:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB4C10E5F5
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jun 2023 07:27:55 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 1A4063F663;
 Fri, 23 Jun 2023 09:27:53 +0200 (CEST)
Date: Fri, 23 Jun 2023 09:27:51 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Message-ID: <xlr3rmz7wy5o3ka6cxo2tzl3hqbnk4vkm7jsgjdhyimiyyqnfr@pjjwjg37675s>
References: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-0-8bf386b373eb@linaro.org>
 <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621-topic-sm8x50-upstream-mdss-bindings-dp-subnode-v1-1-8bf386b373eb@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/3] dt-bindings: display: msm: sm8350-mdss:
 document displayport controller subnode
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Robert Foss <rfoss@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-06-21 11:26:25, Neil Armstrong wrote:
> Document the optional document displayport controller subnode

document the optional *document*?  Same in the other patches IIRC.

- Marijn

> of the SM8350 MDSS.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> index 79a226e4cc6a..f2cbeb435f1b 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> @@ -52,6 +52,12 @@ patternProperties:
>        compatible:
>          const: qcom,sm8350-dpu
>  
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    properties:
> +      compatible:
> +        const: qcom,sm8350-dp
> +
>    "^dsi@[0-9a-f]+$":
>      type: object
>      properties:
> 
> -- 
> 2.34.1
> 
