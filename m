Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OMzFKo6qGkTqgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 14:59:06 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA239200DA7
	for <lists+freedreno@lfdr.de>; Wed, 04 Mar 2026 14:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7B010EA47;
	Wed,  4 Mar 2026 13:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGCPAMpa";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMxNpjZf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D82D10EA3D
 for <freedreno@lists.freedesktop.org>; Wed,  4 Mar 2026 13:59:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 624C23J32306019
 for <freedreno@lists.freedesktop.org>; Wed, 4 Mar 2026 13:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U7dURIckBm+11kzsdxwpPLsV
 Ye086yDRD1pOrWSULIY=; b=iGCPAMpaXPjjb7k+N9YtGTCdVuZiNv/OMMRQqYDq
 T8J8v816wGZmbgLB7Qru4bal1KfbqYvS1DdIMLcl8Y9AaoqdrbXE8rgWB/rWpWe3
 teto/vkpEKGj7TAyVpOSt6CRNPDDN7ghEj/5/x6nGvrvnAuBBN+davHcrS7PW0xl
 /JkDYAEuoGvgHVpRKcQl1loGCE7NXqOxWbZ1xtm8l86+p/s0Lf8ztE+CEnjxZmO6
 VlwD67kRH3Pnx7pohCtgxLcFm8HHbUkSFdUtARMrH6RqWO2buXQk1E+eBc3rxap3
 4NIBxsh1dBpu6aCl7HcmUfdjnQmmheUYavucrUFSPUgypw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpau8tbf6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 13:59:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb3ff05c73so4038655085a.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Mar 2026 05:59:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772632741; x=1773237541;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=U7dURIckBm+11kzsdxwpPLsVYe086yDRD1pOrWSULIY=;
 b=ZMxNpjZfbU3YOnssIO10Dwz0d6kSqt7u4pn3VDNfQhAtSsFrOrKcYYBXN0R5kWKoPN
 1f5AXZvx601rvhKvHmbHkPEO5NkI8p1CK3bgI2fnVIVGun3NYdCEHWd1HTj+MmoQvs6u
 1vcPFv2eb7WZ5JeOEHS5h5pwHN04Q7TGyhIYaE35YnZmMr6YWQDxNSBWlrgEj1r5974o
 ix1QZcJbouVJd4mAPUFGuJ0ye2trIOWHvzkyYCb+tvmkWfa1UDuVtkopuynYOCjZlrf3
 rri0uGBrX7SW4ifRPrhjElAgu6fgxDhuv+Y10DMtxJ/JibWVN06m6sMuAexj95uI4xh2
 E7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772632741; x=1773237541;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=U7dURIckBm+11kzsdxwpPLsVYe086yDRD1pOrWSULIY=;
 b=YuEPZ+8sZXhjYQohYkHAKb3lJLHO9V6pP9hUG4MkQBRB4Tv5PwAc98v9MXYUh0fsbd
 vZciiF4egQVKYIGmQ9rIpEw78+f4nWrRQr27SXp0tlG/G2e9PXQiiv61PSD03/brOIzX
 fvj/A7aMz31PBHyJPFvlcM6+nrooFnQHZIy/Fmtxc4Y26AoBnp6JxHIgiEJndlP4zDuK
 00tZCLV5IN/XoaVpTrmW23PMEuPaPB9p5sMNOGFFEcIXYnYRCV1w6B5Mg+i/9NsTGcxb
 hX7Owz+F3+4l0RCxgDVG2I/MzAe6qGi1Q2L+T9ZLSr/uDgqdKH+ir+ecek3wh2HPgxbZ
 QhlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzOy4NvoFIYglIuIk2h57hce0xambF1MzsbKGIpvIzWilzggVaOkjQHO87SWnFVn+wD+hurlMsxDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycQ/7WmDnKB0TP7b72E7aDkEK1PyKJoHgAn5PE1SfTBOsP6S2B
 ugLPD3H9KD23E7jJhsLKlwcg79KqtO+szhMPeYKQcCK2md5whrSIe+MaHB+mVweETCroHUncQV/
 iB8B4BaSEkMXCjEDCUWImbCG3xVKOkQY/76lYs+Q0KKwBCRZDNSeNYIeFbqjUc7FseX9DISs=
X-Gm-Gg: ATEYQzwYzSDVGc5E8AuszJ4R+Gm9mBVyGrfhw1IudsFy+dACoXhJ58fpHAEpSvcolHH
 JysQYQkuRWDe2y0cdkpYtoV4zGOo+1SjNxcZ8l9odGQstbmakVONqKD2ldTlACPTIEy/HXBuyot
 slsO0WcVxR/XerOCgD+gL+bmdc2hC9/dMWxMCJ9j2Sw36lqzp2C6sAzGU7Z7+VwnizyXDfyG5Ia
 2R19fU2XZjY80HlcPhYUJ5aEWzsv+AK5ByRBgx+itKSOmz3jbRiULpYbqAp6PDfpmu+lWdKrb/X
 ptg3JHs26+6Ss2RGaqkdGYE5sY7UiOB8yIVQZOPtoNmAOrhiCIQlJ/5EzPbE9mMJ3NWOBvmNtNE
 go3h0lmSaJLTYhLTV5m4zAe+CNDt+hWD0Wdd7pKfcU5VEaUIASo6cF1Ss1SIhKYy2p/WL2HJVpN
 dVNfX7u1daUO+sf+8v5Epir0YolRyUSVvglew=
X-Received: by 2002:a05:620a:318f:b0:8c7:1119:2994 with SMTP id
 af79cd13be357-8cd5afa9ecfmr237120585a.64.1772632740850; 
 Wed, 04 Mar 2026 05:59:00 -0800 (PST)
X-Received: by 2002:a05:620a:318f:b0:8c7:1119:2994 with SMTP id
 af79cd13be357-8cd5afa9ecfmr237116585a.64.1772632740365; 
 Wed, 04 Mar 2026 05:59:00 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a123588ffcsm1318304e87.5.2026.03.04.05.58.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Mar 2026 05:58:59 -0800 (PST)
Date: Wed, 4 Mar 2026 15:58:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 6/8] soc: qcom: ubwc: Add configuration Eliza SoC
Message-ID: <n7xd4svnk377y3jidocyi6mtncqy3nvnym7vvmxv3v2wolumq7@daasfxggcbyl>
References: <20260304-drm-display-eliza-v2-0-ea0579f62358@oss.qualcomm.com>
 <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304-drm-display-eliza-v2-6-ea0579f62358@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=AJS1/0o2 c=1 sm=1 tr=0 ts=69a83aa6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ofcykXZfb13_7XvavCoA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Qx37NrfbI11ERHpWvaGLfzTfP3Erj6MQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDExMiBTYWx0ZWRfX9VXJFgKJ9Ga/
 N3/a9+qPO3etYxOrnzuiE6nNj9Hrcmx+Conmf+005a1I2RtYlvwAdWeXPQkgRdO9n5583x9ZHPZ
 SkBAkBcARY66l7SMXCr4tY3C+HKptH9krIR6En/F4pO2CmiizftB1TAEZdWQNz8raKFDEOtdgOD
 Ja/wp6TlSy0XbVBMqLlMMLPYOfxzIAP/HxEFw2f94Wl6Nkbp6uw3Q9Q759s3ruYFuC4TZBFmlJ0
 vTq5pQacLRJAVVA0K9NfbSLuQohnmSVIZ5qcWzOI6tgsFbpQDavHP8XnBmt8f5czeNhfvlCXLM3
 0n3CRYPd3gkjP8YUmvv8i3OgXHEPRWHGA4KUXnaSlnVDYx+tcQ2RQ96+7bYSnF2TYLeGPMwOlli
 j3iBGR42aRa4qCUiAWydB2mdGfx18M7zdHIueQN2BRTlfMC5gmGGOpvrMzhOiHgrnPI39BmUp+S
 MjIHFwiTQ61Gb1AeYjA==
X-Proofpoint-GUID: Qx37NrfbI11ERHpWvaGLfzTfP3Erj6MQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040112
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
X-Rspamd-Queue-Id: AA239200DA7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_khsieh@quicinc.com,m:jonathan@marek.ca,m:quic_mkrishn@quicinc.com,m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,quicinc.com,marek.ca,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Action: no action

On Wed, Mar 04, 2026 at 01:58:48PM +0100, Krzysztof Kozlowski wrote:
> Add configuration data and an entry to OF table for matching the Eliza
> SoC.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---
> 
> Changes in v2:
> 1. Use data from manual (UBWC v5 as pointed out by Dmitry, but different

Why is it "but"?

>    highest bank bits).
> ---
>  drivers/soc/qcom/ubwc_config.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
> index 1c25aaf55e52..633d1efa0883 100644
> --- a/drivers/soc/qcom/ubwc_config.c
> +++ b/drivers/soc/qcom/ubwc_config.c
> @@ -16,6 +16,16 @@ static const struct qcom_ubwc_cfg_data no_ubwc_data = {
>  	/* no UBWC, no HBB */
>  };
>  
> +static const struct qcom_ubwc_cfg_data eliza_data = {
> +	.ubwc_enc_version = UBWC_5_0,
> +	.ubwc_dec_version = UBWC_5_0,
> +	.ubwc_swizzle = 6,

Please use defines for swizzle levels as the rest of the file does.

> +	.ubwc_bank_spread = true,
> +	/* TODO: highest_bank_bit = 14 for LP_DDR4 */
> +	.highest_bank_bit = 15,
> +	.macrotile_mode = true,
> +};
> +
>  static const struct qcom_ubwc_cfg_data kaanapali_data = {
>  	.ubwc_enc_version = UBWC_6_0,
>  	.ubwc_dec_version = UBWC_6_0,
> @@ -245,6 +255,7 @@ static const struct of_device_id qcom_ubwc_configs[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8074", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,apq8096", .data = &msm8998_data },
>  	{ .compatible = "qcom,kaanapali", .data = &kaanapali_data, },
> +	{ .compatible = "qcom,eliza", .data = &eliza_data, },
>  	{ .compatible = "qcom,glymur", .data = &glymur_data},
>  	{ .compatible = "qcom,msm8226", .data = &no_ubwc_data },
>  	{ .compatible = "qcom,msm8916", .data = &no_ubwc_data },
> 
> -- 
> 2.51.0
> 

-- 
With best wishes
Dmitry
