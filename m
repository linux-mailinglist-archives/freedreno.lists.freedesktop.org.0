Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FE9CD52D3
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 09:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494B210E5E7;
	Mon, 22 Dec 2025 08:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRpbEqJU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NBaETJPw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 179F510E57C
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 08:52:04 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM81WSB3812452
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 08:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=; b=TRpbEqJUhbVzV0tu
 s466P7IMqRZNeJJlAodUf//R/Gfj2EMsu1JnEcp7cYOnTjsDEQ8sg8f6pVLNipim
 gGcptlvILCb/xmWsPGm97apHwSKGr6g/xQtWAgE9HguYftCssDO3zxh4ztjuscVR
 nmBxt3outQiO0qaK+ht58YwvmwYYoRz6TKVFKhD0KQSlc3uec9IaCn5kFd3qfJ6k
 CI6HayG7gxXsd17tqoCUC0XH7cy8ib+gsFxhzR917LqrjpZBbfnTj6MMu186QMJr
 85NLRghXY6EUIJzEVXO5xznXtBl05KfUAly92bfBO52YhvQD2Daay9ViTWth87hq
 WWlERg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mrtcc7c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 08:52:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f1aba09639so11333751cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766393522; x=1766998322;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=;
 b=NBaETJPwhG/JDXexPHeZ+dHt5ROI8xqQ7WWXq5iwyU7mVCZDwRZqoh7VERI6s0/A73
 rkmIOpM5FJUapgDmsFibJmXDZg0nTr8ocaT41Kc+Wwmsdf32hHkkbO0GFJ4BVJCJr47m
 58VLdvNCWtw6Gt+IJW2ALnA4Uzfz8gJvWoXAbbbyHMY2d1L6u9GhRSC72y4x9+zxv4SK
 vWXCBeJH0Q41NbG9sFkbu7Ix4IClLFDTIR5cFpxkTBs1lFH0lH8LM9nU802Q40yddxYZ
 QLATyDol0l6W9ICb6xLpQ/HtAx6p+KWCq+Xux8UHXQjMAW04VbkVeuk3Lp+MK9HlCVUW
 iVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766393522; x=1766998322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=;
 b=rMXLcEnaQuIAhbpWIpNqy7sDJFtFiO18Ubu1ql2g3Ikm/RppqKAGs1PITESPI7DqRT
 P15otC6CjJMy4qd+8CE6kYRozwsFgccXnVDNuWpU/qw7NhKjB1bsN2rEbKl3EKNqbuEU
 N95Ex/+g4whKCehAs2yvV0/Ovzo11IXu9XLJQ/hkyqyFZmlRnKJMzxBquzoFmdCmn5Ah
 Wgykq6tkEo8y2Mt/wpOym6Qf0yO9IILp6DpwGTipPVZa0VXtFTOdstOnCjWIebsqXxul
 MoGqU+XWx5YE7TdxWUyxekSKNt7XfUHSxB4DE1tg29PFtqknrBo0aruGMk/MuRaTSI07
 k1vQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGfX3ii//lKNAPuiSUcgtV9SHm6qudW+fuc7y/E7hL/Z795vpC/L361QtSb/JT/g4dGK3kI4BWcmw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDCbbqvjpedTyZ1riummky3mKchULk+k6kr+jRYzJ8BhBxDNeC
 n+mQr+81z/PwR7hnZlheQ7AGUV7xHJj3STsBUr+pybk8/qpULLMVtDn+gsQDoX67eHzDLx4gKuf
 YQ70NfDtRCMJMGLgQHduLSt0aPGmrzV+rGSlTgB5YM+bGTCsJD5r7JFbxnU/llq+8cLdUT/4=
X-Gm-Gg: AY/fxX5ZNjgCCYvEYUqncijYKqwm7CMScwp9F8UImkSBNwOc3L4rdYn/bG0wuGEnqlA
 3Pt1LVHk290UHyrWF7F/X1Z60+Lqw5B2Wcx82siKE5pgSAGXl9hHA4/+ORzdn2fxrB+CFTL/B4k
 Pb4h0VOlog2DhpfeClpo0DMdjQAVz/3qra1tQWUhN0TGVAZwZ3920BmnfX874l2fy8ybKUPkxBj
 ht9u0zFoVJ9Y7WEtRFLtxNcqejCA8vPHYy+o5wFeopHGhhYGsOHR3a/vFWgzTlGfNXmZ0zPf3mj
 N8n62miSwybpYOv/AcgxaNBmWdsxZpsHzvlBS4TaI7RwZNBG4hBIBw3+v1loU0HV6tpD/VwxRdM
 n3zw5WPZ9dRPadz07PFjWu+CjfeSgePNaqRkmLV7rY4EiGfjavc72vDd0Xm95q1SEVA==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id
 d75a77b69052e-4f4abbdff03mr115520411cf.0.1766393522544; 
 Mon, 22 Dec 2025 00:52:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWwe4NdFNAaev00TKW28UVBa3Fu6va8hqB4ZolVSybJM2HPRrqFtrcc6EfguXpS+jYS4uOtw==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id
 d75a77b69052e-4f4abbdff03mr115520251cf.0.1766393522151; 
 Mon, 22 Dec 2025 00:52:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8044f4acdbsm853980266b.22.2025.12.22.00.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 00:52:01 -0800 (PST)
Message-ID: <e4748c15-935e-4dd0-a49f-a68921074922@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 09:51:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251221164552.19990-1-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251221164552.19990-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: WFFlM1CEgPXCFLGYI2ZNYb1tiKhwt5zJ
X-Proofpoint-GUID: WFFlM1CEgPXCFLGYI2ZNYb1tiKhwt5zJ
X-Authority-Analysis: v=2.4 cv=CeEFJbrl c=1 sm=1 tr=0 ts=694906b3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dk0i7xQ4PQfej7aG6gsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OSBTYWx0ZWRfX0jmX6ymmLvf8
 SG/6rowPHA57TFkmVnEgAxsxUvNIbjHdk6BffFuh3s3eBWCfOdcS8o13bo472jOrG4Nc9ZNmfmO
 hfhx+txEblrPkIfRCfAkF7/xajnbxmTit1yTbdkUxV1XFoVm3p1+NR08/6GHq0W9Axmp1eBsagC
 8M9E4uwOGBUT/i4dBTVqIoOsF22eySNvlGxHQXoXfVccCmjPieZBCevecT1GG3rCaLCRZt5yd4/
 LA2JXia1jz20IfBjLUb2czxegZbd6kvCiNu6BM1nuquEbZonf3r842i/GMtpmFuGz9ye9hr3CNn
 30qeRhBj+4g4nqGufD1x0HQg12b5R0cRSldqu1BR61kJZSdfWXwXD5IqlIQrNgIgvmPakbuNbOS
 QAfPeYjGmYkGZnU233eGqviSZTZi5gy+/7gB6fa+cm78udahsQADCSQKi4maggXQOgJgGDiNRUV
 XcdmzKKJXR0Tb4eELLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220079
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

On 12/21/25 5:45 PM, Johan Hovold wrote:
> The hw clock gating register sequence consists of register value pairs
> that are written to the GPU during initialisation.
> 
> The a690 hwcg sequence has two GMU registers in it that used to amount
> to random writes in the GPU mapping, but since commit 188db3d7fe66
> ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> the updated offsets now lie outside the mapping. This in turn breaks
> boot of machines like the Lenovo ThinkPad X13s.
> 
> Note that the updates of these GMU registers is already taken care of
> properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> properties on a6xx too"), but for some reason these two entries were
> left in the table.

I am squinting *very* hard and I can not recall why I only removed one
of these entries.

> 
> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..4c2f739ee9b7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -501,8 +501,6 @@ static const struct adreno_reglist a690_hwcg[] = {
>  	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
>  	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
>  	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
