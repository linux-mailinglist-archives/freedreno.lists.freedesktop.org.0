Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA508C85851
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 15:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C478C10E422;
	Tue, 25 Nov 2025 14:47:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WSN1UBh3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j87xzNWk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10DD10E420
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:47:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APC201A1672184
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=0OtSc4Iv//RzAZHCwgmMh85n
 iL32lnUpnwK33iA2iag=; b=WSN1UBh3oO4OzK6Tk0pSjA/1hOqvHqA+hgShwSyY
 4lexRVBlWAb9QBTO49fkLvldQx1SGHMy6wxOVQS5UgCvW/CHvqey4Yvgzwm+78wK
 HNSx9R5lHaGDmDkicvwhBAHfMooi/jvzINeKlgjoV0ci42xssMQzO1FuDq+ACL+j
 0ODcZ1LtuhOdkSSYneaUm1KWvKUrkrqik/t9TJ5O55NFhJRzMr3SVGhHT7EQHuQK
 tZzxmcTAn+vS+gr8mLJ3WIUPuT5ohHVekm5ONva7jeI14Q3uKKPm8CZO/rGxq7c0
 +y9Rsfh6H+f0liX3mynCkWBF8X8wCNq6KNMXtU3zqn8Aug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w81r6s-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 14:47:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-89eb8ee2a79so2698315885a.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764082034; x=1764686834;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0OtSc4Iv//RzAZHCwgmMh85niL32lnUpnwK33iA2iag=;
 b=j87xzNWk4+Ma4i1+04YtHPLOJt4aY6fizIdiwisUq12qlZRNpY6Wk6ASEh0m/6BJlk
 f9+xBNiYA7vCzX00zI980PCGlbNj2TV+zg/F2cHGFplfKNgazHKLk6Pe7ElyznuILyBy
 QtlxBWo/fLIdhj1BN/RWI/E8loPJlLC1yzsNNl1G8yw9DBa9WxQjfCWuQaRjWo1dFXiX
 klJC/oQN5+AF2GgUpWxjvnh9L6dA4Ba9chGc9zzAO9KzQsdYdmew56FdtABvpbbZAE7q
 IGZkKxmsXjfQZuPp5ET+rENv2i5pmb3IJ1fMW/LM9ffU/aQeaOjorAB1Q04o/QMUw3tu
 T9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764082034; x=1764686834;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0OtSc4Iv//RzAZHCwgmMh85niL32lnUpnwK33iA2iag=;
 b=E6LXU+598A4n48/AzfDarUMox/hQa8Jh22L2CiTwo7oVLCehVBTdN8asKw0rx61QPB
 cGdAo/NbWUYsXHledihlUaAsHbJEidr6W3mvYgRBbBD9csBU1Gfr/ncP54h5sloCFK3N
 ac70SFDioX+4yetSZstEc66TgBq6s/QONC6f+ha8eLRMeYWlU5RDeWqpgoLemIks9Nj5
 52hG7l9wvlrhxP6KlfXs4g4HL4NmaIbgXLS0ZIQD1LCtvL+s14GRgNOOOgzz6S23gQWq
 x0+UBua2K8NNjGqSCH5ZM077mGw/ktAiTnvNkcPSUqpnPXxMDE9WdBtOa0Mw968eI16w
 dJoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnqNG2xuHv8om32Zq1MEG2MhlflsV1tqF++W7keA4vHj3IwFnfv4fQEwYus1BwT5N4zrkT+ihlQAo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXNJ5b0O0z7KdHiBT+/9VATowrLMEks16FIi2dbhAdUA/gr8AH
 Ee2tKyz21i/aQOpofvVPuFIQlkUFXiSEuAWoRFK6CzaYu9GMzW1C31AF31jUArQsjhZOve1O7C2
 Brjpn8942PEsZnHP51Tt+AZ3vUcS2e4lnQtK9FD9p/s/3JFbqWzfUaUocZEonwCn1Pl0NtOc=
X-Gm-Gg: ASbGncsc/GF9GTUWu9LEOH9C+5Rui+cKajYP+sKcisDgWddDRwhQXVWFeYKBm7B42Z2
 E2b/cRNr5nPe9T/o4fm5+TX84MnXY0aB0Hlxvnc9SwCLR6zondGoYJQT6sUKnLIMoqMcSb5r/4O
 EZZMBjMG+Eysiv2m+fctO+7RABBMQ1Agp+Ynbk85b+KGhMli597RzqQX2br+sqwNw500ZRZbYbS
 F0d3jaRIcxry/ZOs4VMvoXC32Jq7Dp+wWkyhHdVVQvZfyDH7gAiRFaGp3UzEBha8+yHApEacPxc
 JH3fW1jcsb3/A/rhEwRhwqki58Cq2CXRQxJJY733R1/IZ0Igfe1XEXra/ldmp8rSh432bPJ+gpT
 YV4Li9TePzQ4eYlMEqmF643KETsoIxK5bYZ5WYzejQ7zZIVGKKmTSc2ilmnYfp+TjDefFZgmp63
 B31aA+q527Ja15yIAyKsVUats=
X-Received: by 2002:a05:620a:1aa7:b0:8b2:ef70:64ec with SMTP id
 af79cd13be357-8b33d4a72c3mr1768051285a.46.1764082034108; 
 Tue, 25 Nov 2025 06:47:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGG7UOLRXXghJiqS+TfOorFOsx005dRphXTelmvvYi2z9s+6NL/AWnFV8TeVC1x1Pw/DIRsiw==
X-Received: by 2002:a05:620a:1aa7:b0:8b2:ef70:64ec with SMTP id
 af79cd13be357-8b33d4a72c3mr1768044685a.46.1764082033476; 
 Tue, 25 Nov 2025 06:47:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db88f71sm5301984e87.34.2025.11.25.06.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Nov 2025 06:47:11 -0800 (PST)
Date: Tue, 25 Nov 2025 16:47:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Subject: Re: [PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
Message-ID: <teg6is2sw35s5nyd6df74hwhctnx4txjd355reqpgfwl7xtkq2@e2rzbskjfz26>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
 <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125064758.7207-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDEyMyBTYWx0ZWRfX75gr2jN61VYH
 DC96TNNPL8/aQknh8I3HwlL/LCkhCTSjPp/md9fAJL1gmHDASzajOkiXOlNSl2KszkYYp5MdhzT
 uV1sAw7RWVsjx6jI8Zn4wFhufjHWLgXrl/8o7TmVa9Ikn1HcqLCk839RTnTVf7m3b8J2ZsQ+vNd
 /whHnKbZ21ZbfXBb1OgSB99vGoKYj0LSn2eaDtB8KJcSRK2JmKq/hwe/G+FUxeq3sdgd8cwtkIv
 gL0+ILQGHGqGiA/Fxvp24BA/z29CMrG7sgDcqXewl0FFNAcnT1KQAI+b/OeD3/B4ye9RAjJ2yux
 GFzrRiuxfGmCNux8avlNqqgKaKW0vQr//vPvNzECueenTsu0uL9yYok5zmaz0rjKmw4PgwhU4sd
 iNCxPdLNuf06H0FcYmdEpnF1LIjLPg==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=6925c173 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-U1_elcvvKRzM9PYnLcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: vOFaYW_mgwx0HruXa_FsX1hxr1BpVxQI
X-Proofpoint-GUID: vOFaYW_mgwx0HruXa_FsX1hxr1BpVxQI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250123
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

On Tue, Nov 25, 2025 at 02:47:53PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index bf9a33e925ac..797ef134e081 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -243,6 +243,24 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
>  }
>  
> +static void msm_mdss_setup_ubwc_dec_60(struct msm_mdss *msm_mdss)
> +{
> +	const struct qcom_ubwc_cfg_data *data = msm_mdss->mdss_data;
> +	u32 value = MDSS_UBWC_STATIC_UBWC_SWIZZLE(data->ubwc_swizzle) |
> +		    MDSS_UBWC_STATIC_HIGHEST_BANK_BIT(data->highest_bank_bit);
> +
> +	if (data->ubwc_bank_spread)
> +		value |= MDSS_UBWC_STATIC_UBWC_BANK_SPREAD;
> +
> +	if (data->macrotile_mode)
> +		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> +
> +	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
> +
> +	writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
> +}

Can we please merge this with 4.0 and 5.0 functions?

> +
>  static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  {
>  	int ret, i;
> @@ -296,6 +314,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	case UBWC_5_0:
>  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
>  		break;
> +	case UBWC_6_0:
> +		msm_mdss_setup_ubwc_dec_60(msm_mdss);
> +		break;
>  	default:
>  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
>  			msm_mdss->mdss_data->ubwc_dec_version);
> @@ -552,6 +573,7 @@ static const struct msm_mdss_data data_153k6 = {
>  };
>  
>  static const struct of_device_id mdss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },

After glymur, please.

>  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
>  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
