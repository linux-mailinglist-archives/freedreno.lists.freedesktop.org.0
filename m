Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AADCBF9E4
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 20:58:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AF610E272;
	Mon, 15 Dec 2025 19:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUNFOjgq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Za8JlOoc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A69AD10E25A
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:58:32 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BFH3gL61204954
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=GbZ18lxOGiUe/HsYW3W2V15E
 rrAIjtn7+Jnig2AbJV0=; b=pUNFOjgqiXY8pKRWmYw/q0uWeRil694u10zENVSs
 GidobybU22GXDkgiahUFZgKf/cGM/Ei6fqtLrn+nLIpmDI5sF2xxuyb/Dpg5DL2O
 G7n52WgvyxXETQLIC3puQ6te1Sot9xi89jJo50OcobJdXmFOA3gMYcjRxrm/bEje
 XIacPnx3VTO9gXsun8pwjXgD6Uk5HSaHpvPZcQ69ToEKXI2fPm+qwEhC8OssM6hw
 vt/YPUnaq3zgLqFtcUcUfBRW6ZLtPXDPRh+MQrimW/eiEjQBl+v0tG9py0XnJvCb
 pPRZ6gmMd/kTm9pj7/0H6ZKhwsCwA94shEdXfArAXnZSbQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2pdagfk8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 19:58:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee41b07099so46169331cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 11:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765828711; x=1766433511;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GbZ18lxOGiUe/HsYW3W2V15ErrAIjtn7+Jnig2AbJV0=;
 b=Za8JlOoc7HVRpB+YyEh3W2WHrpGQ3PmIER4UtiDZdMDxg+2apsQpdWSK1RVU/OS46e
 M4nHAXpit7y8VA7oecRg+XcF6F+ZLVc+2D6/IcIrQ+1x0LkiPUA4QZxlydvI8vsLRwgO
 7neAAVOEf15Ri9Jch+MytWcXzChpGDCuNbOXOrabJfHegM2XNcFOkUEZaClD4yQTh56w
 D0eygekfgdsIl4kgBratuqtGsr+C/5hylfwaW3za37pKknBZFQEg8U3785ASomCCP/eK
 Ecd+uJV+L420TfP33L3H3qIkc+wWGu+eTOadxlS36pwtgQOYphHy7aWuNJgwZPL7iIqA
 FesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765828711; x=1766433511;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbZ18lxOGiUe/HsYW3W2V15ErrAIjtn7+Jnig2AbJV0=;
 b=Da1n5BlDG4XUrEu7ZQIOP5GKd7va9lO+2tS6QsbGoa30DtWe2yNpLXrJSvVC5kvQiW
 TAGOkOelZWbX4o/vXQW7xL9F4riFlRjVj6HHosYSD9GLYEJh4uhVzbVA6WP/Ue+jEWU7
 nM4kG4P6CctX16PMnRrvaJYtHyMI8s9sZGEN0DxVXHMLtsiP23zD5d55BOM7tzWtkDLK
 3UV7t09TYZoK58aDI+hc6tosOoL2qZaBwivUQUJUSHq6SS1jo6VAEfCC8fAaXZI6EKHl
 wYqcvU8MnDOexrYhk/ceCyM2jfp0ghc0W790r3QvSqhvRKYjUH8MLpxo3TlNCS/YEilg
 oBwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9qe2DUt0RM9N5oVfPhVaXJvH1z0nq/4Y1Bwbz/PeVPZllCMOwXZ2k9LL7RluZ1oemrdGGPbB2CtA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZFowUv8ODcPxDh3DgvJ808BGX4KUtVAW1xIXNshJN7kj23aoM
 e5QY7VzGIMjWhnOu0caanvkI8jOqYTtm2i4oFxpnFnK5M0DSTDkm4zF0vomgixQyricRfIVPCa/
 YJYbz3k4WBgDzRSgIi+o2ztEzqoOTe4JQOmrIdRKZmmTJWvT+WnzJi6hV2nAW3ZHZV6XooZc=
X-Gm-Gg: AY/fxX5nwBzt/H4LJDNfwHNNuQI4vptDRgM4OnDeuZzCO5E+z5q4TkLEqXHW8dOCkel
 U8L9kJ2b/oSsaKNokrsQYpMyCx6iPqYjO/TD+w6ADgMq9702W8ApOqSeH+L2/u5D39ZGL9yd+IY
 Y7AEmSYKR9WRu7iNIzZq5+2JIFfjQ9kbn6yG6oirP3iR/4JDX1hzlvwNSJviDMzJt+h6qY4kaxj
 67nEhLydbtihwTdMW7sxiCSD4XAiqp/kZzEi/fkT7OieFCjQZba8CzlwCofr4fv3ckqr8CqfPVc
 o67p3CyITuw4zCVyLYg1ftQAP64W4AjpVBr8/u+uae0kOPbWcAOWkw742wOjpQ+9lPXv9BGx99j
 GgruAdKgDFJ40iI/Fh4BU4DM9mi2TNppPDNelruU6LMNdRAVPCaEPmnfQwdQr0nq0o8kdfr78z7
 wrae4ZqLzSMz9x5++4kiMxBsc=
X-Received: by 2002:ac8:7fc2:0:b0:4ee:2200:409e with SMTP id
 d75a77b69052e-4f1d04adcf9mr184522661cf.4.1765828710844; 
 Mon, 15 Dec 2025 11:58:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGD8gPMKgZe1NIXF16IRzWVaynEkaU6K0gMBwesa267GBxyPXnZwQyLh159lx5eTh04Ay8IQw==
X-Received: by 2002:ac8:7fc2:0:b0:4ee:2200:409e with SMTP id
 d75a77b69052e-4f1d04adcf9mr184522161cf.4.1765828710310; 
 Mon, 15 Dec 2025 11:58:30 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-37fdec393ccsm29465041fa.21.2025.12.15.11.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 11:58:29 -0800 (PST)
Date: Mon, 15 Dec 2025 21:58:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: Re: [PATCH v3 05/11] drm/msm/mdss: Add support for Kaanapali
Message-ID: <k7k7fpmlde4tjiqxhzbf67olcdzsfmctendyjeewwh6v2kkl3i@33t2qfjxhwdp>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215083854.577-6-yuanjie.yang@oss.qualcomm.com>
X-Proofpoint-GUID: C_A0t9I9GlVJLHQFV4DSxKNQSx3-LKig
X-Proofpoint-ORIG-GUID: C_A0t9I9GlVJLHQFV4DSxKNQSx3-LKig
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDE3MSBTYWx0ZWRfX9DfADyqXS1Wa
 gVqYGXhd9bYywdqtxr/QY9+C10bo87w0v7u4CCKbnNtX5uvS9R8LC4l60aZLZ20bEQEBaiTQTEr
 RCca77OVPwJNgvAdQG/EgGy81/+MJfHz++G+LPHN9CmdFfd+Clz8kSUS+tuVLpa68UZDPYAlKHL
 KRk8epBsuhxHUntoFxxso35O94yTPxdOAlc0Eeyk2iVzo5sYRNcFSLeNyD0PukB+JzAqCRRSSIl
 a91lK6RykZHROJOkjDym/CYmxx1bZLHpxjy7x4MHhKMvvYhvbyG8BEWfkp/8BQ0nAgKBRS+hIyN
 IOOlo/UuPIsm9TVFoDhhu0burXfsQRMYbWSc6JBrbz33MrMD77cW3B0fNlS+weqRyEc0ZIoIZlo
 srPIpavFkzETt2RwyeLmBuy8hvecSg==
X-Authority-Analysis: v=2.4 cv=JYqxbEKV c=1 sm=1 tr=0 ts=69406867 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=HmsCTVYA9p91sAGNaR4A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_05,2025-12-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150171
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

On Mon, Dec 15, 2025 at 04:38:48PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Add mdss support for the Qualcomm Kaanapali platform.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index bf9a33e925ac..cd330870a6fb 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -239,7 +239,11 @@ static void msm_mdss_setup_ubwc_dec_50(struct msm_mdss *msm_mdss)
>  
>  	writel_relaxed(value, msm_mdss->mmio + REG_MDSS_UBWC_STATIC);
>  
> -	writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	if (data->ubwc_dec_version == UBWC_5_0)

This is the _dec_50 function, you can't make UBWC_5_0 into a special
case.

> +		writel_relaxed(4, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +	else
> +		writel_relaxed(5, msm_mdss->mmio + REG_MDSS_UBWC_CTRL_2);
> +
>  	writel_relaxed(1, msm_mdss->mmio + REG_MDSS_UBWC_PREDICTION_MODE);
>  }
>  
> @@ -296,6 +300,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>  	case UBWC_5_0:
>  		msm_mdss_setup_ubwc_dec_50(msm_mdss);
>  		break;
> +	case UBWC_6_0:
> +		msm_mdss_setup_ubwc_dec_50(msm_mdss);
> +		break;
>  	default:
>  		dev_err(msm_mdss->dev, "Unsupported UBWC decoder version %x\n",
>  			msm_mdss->mdss_data->ubwc_dec_version);
> @@ -552,6 +559,7 @@ static const struct msm_mdss_data data_153k6 = {
>  };
>  
>  static const struct of_device_id mdss_dt_match[] = {
> +	{ .compatible = "qcom,kaanapali-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,mdss", .data = &data_153k6 },
>  	{ .compatible = "qcom,glymur-mdss", .data = &data_57k },
>  	{ .compatible = "qcom,msm8998-mdss", .data = &data_76k8 },
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
