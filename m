Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E8474CB62
	for <lists+freedreno@lfdr.de>; Mon, 10 Jul 2023 06:48:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5030C10E072;
	Mon, 10 Jul 2023 04:48:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FC210E070;
 Mon, 10 Jul 2023 04:48:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43B9D60C77;
 Mon, 10 Jul 2023 04:48:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73CCAC433C7;
 Mon, 10 Jul 2023 04:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688964523;
 bh=Gr7cxaqETvuMRpdzKWQ/4Ai9lPZvj2URIYRVKpma7q8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h0ov/NEbarKf+n8FwzQjb/b6U0PKDyXbtZMsOD0PWn9RPo+jXPr0vgVc7eixb9XK7
 XyqJvtI8wZSzF5kQNJgCDZKHpv9FJJ/Yt2sks3okC3SbC5CSXySy+qHIbBsuMMKHB/
 1SEMSe3RB2tnSVkwNFS9LESvWVWxfRiY25HihxUK+h5Ox8qaUi1okshXy4mFJD325I
 eOwxEweuiIP+1EtqTcEGKm8KaZNdU+kCNS1e5wLj9u0tlfqO8utBz7yfyjTy/aqR7G
 KYLyKyo07k8XuMmlw1PzSIsEI2iEGg6Oba8iWfu8SMH2v1/6xKw9ZGOpTeuCB2BvDc
 juDtSUN+ZpcfA==
Date: Sun, 9 Jul 2023 21:52:18 -0700
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <5kykffxgb7cl5bcjaomctykhz6l3fsib4de7q7mnzdgkidhsbz@sx5elfrgoe4u>
References: <20230709041926.4052245-1-dmitry.baryshkov@linaro.org>
 <20230709041926.4052245-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230709041926.4052245-2-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH 1/5] dt-bindings: display: msm:
 dp-controller: document SM8250 compatible
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun, Jul 09, 2023 at 07:19:22AM +0300, Dmitry Baryshkov wrote:
> It looks like DP controlled on SM8250 is the same as DP controller on
> SM8350. Use the SM8350 compatible as fallback for SM8250.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 7a7cf3fb3e6d..a31ec9a4179f 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -28,6 +28,7 @@ properties:
>            - qcom,sm8350-dp
>        - items:
>            - enum:
> +              - qcom,sm8250-dp
>                - qcom,sm8450-dp
>                - qcom,sm8550-dp
>            - const: qcom,sm8350-dp
> -- 
> 2.39.2
> 
