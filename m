Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE496F0D94
	for <lists+freedreno@lfdr.de>; Thu, 27 Apr 2023 23:04:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF98710E12E;
	Thu, 27 Apr 2023 21:04:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from relay03.th.seeweb.it (relay03.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::164])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60F4210E045;
 Thu, 27 Apr 2023 21:04:35 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 6712B1F6DC;
 Thu, 27 Apr 2023 23:04:33 +0200 (CEST)
Date: Thu, 27 Apr 2023 23:04:32 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Message-ID: <eyidelorpuv6ed4e5w7q76qlpkj7n34dfsjmnxf6g3wrmrfevv@puf755fnx627>
References: <20230411-topic-straitlagoon_mdss-v2-0-5def73f50980@linaro.org>
 <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411-topic-straitlagoon_mdss-v2-10-5def73f50980@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 10/13] drm/msm: mdss: Add SM6375 support
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
Cc: freedreno@lists.freedesktop.org, iommu@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
 Sean Paul <sean@poorly.run>, Joerg Roedel <joro@8bytes.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2023-04-21 00:31:19, Konrad Dybcio wrote:
> Add support for MDSS on SM6375.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

(After reusing sm6350 data, as suggested by Dmitry)

> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index 4e3a5f0c303c..f2470ce699f7 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -546,6 +546,15 @@ static const struct msm_mdss_data sm6350_data = {
>  	.highest_bank_bit = 1,
>  };
>  
> +static const struct msm_mdss_data sm6375_data = {
> +	.ubwc_version = UBWC_2_0,
> +	.ubwc_dec_version = UBWC_2_0,
> +	.ubwc_swizzle = 6,
> +	.ubwc_static = 0x1e,
> +	/* Possibly 0 for LPDDR3 */
> +	.highest_bank_bit = 1,
> +};
> +
>  static const struct msm_mdss_data sm8150_data = {
>  	.ubwc_version = UBWC_3_0,
>  	.ubwc_dec_version = UBWC_3_0,
> @@ -580,6 +589,7 @@ static const struct of_device_id mdss_dt_match[] = {
>  	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
>  	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
>  	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
> +	{ .compatible = "qcom,sm6375-mdss", .data = &sm6375_data },
>  	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
>  	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
>  	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },
> 
> -- 
> 2.40.0
> 
