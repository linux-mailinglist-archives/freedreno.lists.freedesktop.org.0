Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A54BB4459C
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 20:39:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240E610EAC0;
	Thu,  4 Sep 2025 18:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pUKuYwzv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7398010EAC0
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 18:39:17 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584ISiEq024267
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 18:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nn1s1cmBrSFFysEaJTYBo/i8fM15yQYFa7TnS6bqPa8=; b=pUKuYwzvgy5mPAG1
 g47p4h4g7JfiSoMpdvi8U/i/P8t1Fm2QeKguuxHSm1Ap9c5xRQTOaOTTK2WG/g89
 b6vgaT7PJDl9PQVv4hJV019kB5+94eAF8iWIO59/I6bLKac8RM76rGMPbvupprAe
 xDuRSeTTd4niCrn+FPuwv/sHsXKpxQgf10xgpdFICh90LUF3a+zcBNDTNirem8Yn
 /tL2NfQ8QllvIsjRO5vk7IW/fVzhSeJGA3SJO4j7AWHdQdyeIcK/GoNSJ+LYjHRB
 j+tlH23jH4nbX53XUUAET2u+kG62cjPkcVpU3OMbj9QHqEKyR6xWO3hYQpkOfqqO
 fcKS6Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2frcww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 18:39:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-244582bc5e4so17200625ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 11:39:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757011156; x=1757615956;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nn1s1cmBrSFFysEaJTYBo/i8fM15yQYFa7TnS6bqPa8=;
 b=Y4n29P6u5RtEoqt1JF+WxUejENmyisj9TF9TItEK45+q8QipVIRHINQr419kW7MJ18
 qIY01XYnrcYPXFy/LSuiTwUpLl67Y81nBQBsQds9sCeLn0Na1O9ztySKr0u5Yp2fpba6
 Iw9vV5qRxfanc1Qfbl1z85x5Z9WhkZyARcz+GiG66UfqxrnQ33QC9wTzlFj/KxKcjWeQ
 XZxlbvMeBKDxTSSGfVohdiCQdC5weR8KkYI9N8jGI206XNqPCOc5u0q3N9jHopEviL+3
 vyrirrElQNAK21P2T0Zbm7hE6siIsXWxjDZpmVtdOOfYZswSsfu7twvkpJoidi/kqTCA
 2kSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXOZdj0/Lozb9KaF35oPcxITsFMJTizIJaxCDs2PBlMG7x4Q9QT2CWY0o/JhyIB/rOO+k+2iRkjhI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx37EhAY/sH0i2DDdvwby5zBZ2y9bRSSYljgSzqQpT47ftQotdP
 pHv4R8idrL9HFREBFSchVniSsFmfQEwNhvVAP1OdLW9IVI5Q6ylALIRXj66boJIP5fEvjZio1CG
 Urn8tTYYIMVqW9K3GGT74FvPyVjbF57DBGgAWbwyAKMVRRdMj2DmOuQ7HKNcLocki0qxcBYk=
X-Gm-Gg: ASbGncvLJC+dUs4QoTe/vNrFI8bbc8+5lnWLDPttPRtrS6F8rW4NUk/RiYIk5hLIony
 +9fLmAP5Ve9WCXl2dkRzBanSVpYQZtVeEC+AB0342cWGKW9vHcGyed3H7m6ygD0Sr5ya+l02MZt
 RB3EVToQJzHUeltEtlp5iynV9mBm0YFZx519kQYfI5K1n+oN+sIqInDs9wr0nXgzqOde3l7Cf4V
 UXLxFYLF7sx8R0NR2Ky+3Jr6Be5i4m6INTaP6GwoJ8XYZagQ3607fD1DvOs5cbgn90mzOUCq0qF
 EfIUENScDf3m43vm/OPEcuXSamU1HqEpTi2XuYPUUxGDiEmdI4zwAPtkjRCPYusX5eS2gwcSbZS
 S7k/Tk+9m9FgYYfTg9KfnJQ==
X-Received: by 2002:a17:903:2343:b0:24c:9c5c:30b7 with SMTP id
 d9443c01a7336-24c9c5c318amr78060425ad.47.1757011155827; 
 Thu, 04 Sep 2025 11:39:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGt8vlrmccO/zKDOpTjvGT8zqU0R03/eoM8Qk0vuGXWCzN2nGB8EZel9xPgSfcY7c/FvHbGw==
X-Received: by 2002:a17:903:2343:b0:24c:9c5c:30b7 with SMTP id
 d9443c01a7336-24c9c5c318amr78060015ad.47.1757011155125; 
 Thu, 04 Sep 2025 11:39:15 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24c9304b7eesm50520415ad.102.2025.09.04.11.39.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 11:39:14 -0700 (PDT)
Message-ID: <d312c946-38e1-4ab1-b038-19239d10720a@oss.qualcomm.com>
Date: Thu, 4 Sep 2025 11:39:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
 <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX9ISliaV7XPL+
 x5+eEku4a5KaN2zLcesdhpHEk5p9ggxMqCxVcTiSddG7Zb/pg7bkOPv4pZ9KYGe2WhBOvCLXJIS
 9/olT61AZX8gQQu4bO0KGvzlJ0fuzPKjTmzscXmFnNP+hXP8ayYa4uW608bNTFCWBEZx6kUCy0Z
 oZAnxdTYKsGF5OtLj0wRoxcZHpcjsm94U1W7Je1Wt5fBMCe22DM3qQ8QzJA+uIgnJHzSq5UZirm
 8xuKRAHDv/4BF6Gie+arRKC/Z20DvEEm5YXIjckWDMil70cenbpZqOaCiqzdt6kW2Rv+UapQZia
 YZf6tgOBTsqDiUlS+w795HoF1EcrKYP9p6yfLlfesRfVlvE3Vw2GmJsCpeRas87IzI1BHLO5hvH
 D5KaCvSZ
X-Proofpoint-ORIG-GUID: w0riYjXZnsvWmJT9-FbgXQ8mceq2vNx4
X-Proofpoint-GUID: w0riYjXZnsvWmJT9-FbgXQ8mceq2vNx4
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68b9dcd4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=k66G2MeTsQAVc7QBSiAA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_06,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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



On 7/4/2025 7:47 PM, Dmitry Baryshkov wrote:
> Interleaved YUV formats use only one plane for all pixel data. Specify
> num_planes = 1 for those formats. This was left unnoticed since
> _dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

> ---
>   drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
> index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
>   		0, BPC8, BPC8, BPC8,
>   		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(UYVY,
>   		0, BPC8, BPC8, BPC8,
>   		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(YUYV,
>   		0, BPC8, BPC8, BPC8,
>   		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	INTERLEAVED_YUV_FMT(YVYU,
>   		0, BPC8, BPC8, BPC8,
>   		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
>   		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
> -		MDP_FETCH_LINEAR, 2),
> +		MDP_FETCH_LINEAR, 1),
>   
>   	/* 3 plane YUV */
>   	PLANAR_YUV_FMT(YUV420,
> 

