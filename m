Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 024CFA3DC6D
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 15:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDA210E977;
	Thu, 20 Feb 2025 14:19:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X7Oq9c8x";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA35710E976
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:19:12 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K6gO6O023203
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZzGpuNpEMvmvsVtbZHCixwxV188CGJ6yTEUyvKSil0I=; b=X7Oq9c8xcZesA4wx
 IxZ3gZCZVPgvDMOOY5hRHipJYxUdD1kO6ByZvqvjWmVttH/RixOKn9yGd+mvnBji
 roaCWYOc0P/NHzuIK/T1zYLqwH6G0s04qEHPQUNO1pBlu0x5Ydzk8q+20t0/aKBo
 3okbRmfStWCawdjOyGQRrOHA1uteA76w1MhoO/y25gCql6zmMh27oVXRWcglr2wH
 yMLS765/jvbW3YrXY14Tu9n0SQhPd0mOKguMrIpWKffxvZI8biwz+jlAVYgELqMS
 VCTQzlfdVZE3oV7zN2O4T7/x2vFCLQhRemEKtulAPl62H606349dwYknDlJTNaFq
 +i66Dg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3pfbq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 14:19:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-6e66e017ea4so1806806d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 06:19:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740061150; x=1740665950;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZzGpuNpEMvmvsVtbZHCixwxV188CGJ6yTEUyvKSil0I=;
 b=g0NwQVCC4G1YOJFK6G5RAEEZ5MsiK2u+xBN1aKYUTROqMAB/PQTj/Wdod1A0ZZetZ4
 9F1enZVl4lUQ2FQo88+wODJtjZuvnPPam2ZzARNtLxLYl9PwDIKLVnYaQAJQvXv5w6XD
 DPkM6smpaqMM0bI2VXLVr3o9GIeCrG5yH5wEQaLvCMcBwA+gRwWAI+XOn56sBpxs7yg1
 8c6lcVyzPmWbARxj3Df6rXeJRL9wYAOIyt0G9pH57hdTlIEX+IyGTl9AH5/WVETd7JRN
 1bi52VvTUGhZkMInEv/CKDw4Uhf2xzD7dlFZ90/pKzKuFeptYoLOBfjlA8xWOeSC4Oy0
 IigA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHRcKISD3w7nZ2imB0Ybg/rFYhrEI76A3QEM8xLHGfKRWCgyYszjLvFsB7e6R2Ef1wwfdJL9dM6bo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtRVVeP7x4DyLKcgIfBtECBgkSYuhXyqPLum31ouY05fHodkd6
 27aLfdHkamN4D4HXYx336zpZlA7xj1ey1Njppy083jb/YQon19Fz+boZvDLKmS2KSXGWtBjLTpm
 5IWDXu5YkGTSDkpc38Pu3vvdrT4L89vK0f4Jqo3negVKadQJZ+PhtKYxWAigG973D16o=
X-Gm-Gg: ASbGncsdcsbSNw6kosFJhe0jOaEiQQbOrJVrU8yUg5sReZjK6L9Q6SWIeN4pEa+YFzf
 IMQQ6Q6U6C1WmxCGUGGk3af8Ov0UI8Otf71vBpzCiezHWCcCIDmraAu5xDlLdPSTY0e6l3e6na7
 C5SE5NDpxW9LTiydlSjGAGLKsJYxDGOn7IxyUrKsx8tbzF0fsb4845AtnHEDu6xrbHDi+Dlkpk7
 O7Pq3ek27t/zMGIusJwNStKlqdY7Qtkokt4PkqXN3hSJyuly37C4QY2VCNQeIvJrNuHP18+CddG
 AZ3tqVW+hIMaMxf2dOiIZlqDSHg5TKCPygvsXSkKxQJO0ax/sZvRgw/8srs=
X-Received: by 2002:a05:620a:7e8:b0:7c0:b018:5930 with SMTP id
 af79cd13be357-7c0b0185c4cmr395262385a.15.1740061150197; 
 Thu, 20 Feb 2025 06:19:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGGplcBIxuc1qJMHH/uMdBHwF3xTcMp0hOINAPPRPBlGB53/bt9zTWLON5PGnGl2kKOLrka9A==
X-Received: by 2002:a05:620a:7e8:b0:7c0:b018:5930 with SMTP id
 af79cd13be357-7c0b0185c4cmr395260485a.15.1740061149834; 
 Thu, 20 Feb 2025 06:19:09 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e03aa0b1f7sm8859956a12.2.2025.02.20.06.19.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Feb 2025 06:19:08 -0800 (PST)
Message-ID: <00659634-c602-4382-b4a7-ef32f4d27dbf@oss.qualcomm.com>
Date: Thu, 20 Feb 2025 15:19:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/msm/mdp4: move move_valid callback to
 lcdc_encoder
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250220-fd-mdp4-lvds-v2-0-15afe5578a31@linaro.org>
 <20250220-fd-mdp4-lvds-v2-5-15afe5578a31@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250220-fd-mdp4-lvds-v2-5-15afe5578a31@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: kiKe6aO3eeiDTlmjvioFiHUPEQZ3OxdF
X-Proofpoint-ORIG-GUID: kiKe6aO3eeiDTlmjvioFiHUPEQZ3OxdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_06,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200103
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

On 20.02.2025 12:14 PM, Dmitry Baryshkov wrote:
> We can check the LCDC clock directly from the LCDC encoder driver, so
> remove it from the LVDS connector.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |  1 -
>  drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c  | 27 ++++++++++++++++------
>  .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    | 21 -----------------
>  3 files changed, 20 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> index b8bdc3712c73b14f3547dce3439a895e3d10f193..e0380d3b7e0cee99c4c376bf6369887106f44ede 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h
> @@ -191,7 +191,6 @@ struct drm_crtc *mdp4_crtc_init(struct drm_device *dev,
>  long mdp4_dtv_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
>  struct drm_encoder *mdp4_dtv_encoder_init(struct drm_device *dev);
>  
> -long mdp4_lcdc_round_pixclk(struct drm_encoder *encoder, unsigned long rate);
>  struct drm_encoder *mdp4_lcdc_encoder_init(struct drm_device *dev,
>  		struct device_node *panel_node);
>  
> diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> index db93795916cdaa87ac8e61d3b44c2dadac10fd9e..cfcedd8a635cf0297365e845ef415a8f0d553183 100644
> --- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_lcdc_encoder.c
> @@ -348,19 +348,32 @@ static void mdp4_lcdc_encoder_enable(struct drm_encoder *encoder)
>  	mdp4_lcdc_encoder->enabled = true;
>  }
>  
> +static enum drm_mode_status
> +mdp4_lcdc_encoder_mode_valid(struct drm_encoder *encoder,
> +		const struct drm_display_mode *mode)
> +{
> +	struct mdp4_lcdc_encoder *mdp4_lcdc_encoder =
> +			to_mdp4_lcdc_encoder(encoder);

Crazy linebreak

> +	long actual, requested;
> +
> +	requested = 1000 * mode->clock;
> +	actual = clk_round_rate(mdp4_lcdc_encoder->lcdc_clk, requested);
> +
> +	DBG("requested=%ld, actual=%ld", requested, actual);
> +
> +	if (actual != requested)
> +		return MODE_CLOCK_RANGE;
> +
> +	return MODE_OK;
> +}

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
