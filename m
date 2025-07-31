Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91635B16F55
	for <lists+freedreno@lfdr.de>; Thu, 31 Jul 2025 12:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0C310E769;
	Thu, 31 Jul 2025 10:19:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ptXNcbtm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB8510E769
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 10:19:39 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56V9fNlH026574
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 10:19:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gqP/D2mc8RmNlu9TpE5LUCbh7vx3tqZxEc4lxFUC8fM=; b=ptXNcbtm+uFqCgIr
 KbwxU6cwl7758BB/NFhsiopEmc1Tl8rGk3fQDYNV3ifl+UskRiMaJDv/i9nCmrUH
 rWmYZungI+4tH7ewQmuw3+ZHfsG9VxGjJsXWDkJ6SqhG/QyPJALZANk3ueBQwFqW
 Hjo4pfYOkMtEcIX6oOYSI2jlBUZdppqlhk00o3UlJVSqyZ7zwmx+UV1mQwMa7DrE
 8ihsj0DXQ1QuQ7tPEAaW3gVQwBJSZVn9CcH4+ARBxaNCP6mGWkW5khE58h1u3ln2
 h4WZsd88a88L6WL4wGSNEeHrNmoq/boYX+0VLCROGlMfEiH42uZFo27iTeBFnqoU
 mpPxmg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484p1aq7w0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 10:19:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7e686981baaso2836685a.0
 for <freedreno@lists.freedesktop.org>; Thu, 31 Jul 2025 03:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753957178; x=1754561978;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gqP/D2mc8RmNlu9TpE5LUCbh7vx3tqZxEc4lxFUC8fM=;
 b=C3ShR4MtpYr96zG7ESYKit663NRP23VyvEg75oW/7WbIt4a51DHpnZUEg2OpUv4+Zo
 SglpeaKEGBGMMRMEZ7ddIu96MXmd1xfFOrdFB+0NVJrTHH6z/wUrN6jLyF232HPA265+
 ywQ3LgQTxLwLfl9nIxwP4rtCK+Kc6GVDcpm1Ipp618aBePgKuP7H4mrV3uP3qrhIwWfG
 rGeXDR1lPSUVt0QJ8ItGf36/tPbK/y+GlyKvb4QZZ16rQ4KZ33JA9jzzzyLEAWe4p7sm
 eValygHLhdwZrVvTNbIBUhEGcdrb+fpXWi2lKOv1C1HgdB3VKHxl7/Zgp85Om9DRigR2
 cJ0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxJILwVnk+bpk3qRcPvShLhozAlKf5JPQEIn9u/e4wWQp+bsySuxZ4uapu7f1uaDpHNQCxweCjrsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgM31j32KdeRBq4igbIijuN0rW5hg3z7VAAZw7m3HWkaWJUTDw
 63m/rlcHYSGpEWAUZOXax8xrHFItmusnfbpM/+TR9kUU2r3NH5N4iEOGZdv+unjv/wmod0vIpuS
 pz0iTmmm92tr45MhhDcIW5tGwQmZwhg0g/DTdF8FoLcl5jpdrNyn6HSPcvRrKRWcToncFxzX3zz
 Y3Ipc=
X-Gm-Gg: ASbGncsIy8isFN1Cf8OedC7YWfwEmjQlkfC9ZiyoqU9Q6G11GpE3B3wgvPb5tG0VHu1
 aLAQU2UECj/fQlekdj69tjjUU61t+Mr0+uhTcM2PyK6WRobxGp6+Uz7zybhOIt+9F2gUzmRAMzM
 1JsgTFevzDU4B7sShoUsidVjh0QHOOt0verz1PW4jh93Ft5gjZWkARZTsK81R8BJfuJi8WWIsBC
 NaIxQO8/5cuKxWJXQ7evp9u0lRacBZw7/KqpT1V23yEKCCAFKLIwT/D7XJaTZNBh39GE9+aERjI
 MHwdulvnk/9QFfdekKfWWRAEPjRQY+IRSrSoOmznx8HOnXRCgIDD00RxUSRIH3DdkkGrlYE2O//
 A5sHYzp/eL8+KbGcF6Q==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id
 af79cd13be357-7e66f372189mr499710785a.13.1753957177815; 
 Thu, 31 Jul 2025 03:19:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGxnVmrpW4543srRHthGrkNrWHw3gNj9WsEk2mKRTDtWtwh5cLKN5XiE5eDu2MaiRmkZuh3Fw==
X-Received: by 2002:a05:620a:3908:b0:7d4:5cdc:81e2 with SMTP id
 af79cd13be357-7e66f372189mr499707385a.13.1753957177212; 
 Thu, 31 Jul 2025 03:19:37 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a2436c2sm84867466b.141.2025.07.31.03.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 03:19:36 -0700 (PDT)
Message-ID: <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
Date: Thu, 31 Jul 2025 12:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rGStGSxPEMT4BluUjS06vhvX0O6e9C8Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMxMDA2OCBTYWx0ZWRfXwN+5LYEmRbf0
 KCbt4A9pu7LASlgGISaS/tyv8ybjks7y7/aDkWkQS2n8U7Jpm/K8ff+SPxwZnlGQ86y1CQl8vW2
 TCV0aexKAbVn8fELnH0U3bbP08dyCS0P/LNHvyf/9USqU+OlvW1TG0heRl94f6/7dF1lxbl/AsC
 F8pKs5pT3wJ41zsfcIbRWc4b/Tfrmu5oa9obmc0Xa3pH7t8aURiOOx8mZOjaiVn/1jO6rXkOQQG
 FsVoOeZjgsJqaGB/Hwjmzq+25Fn4ThH/NyRq8pL+GBRIsZrOTLkvCfMuQYg3KtRFaVeO9w4Y0yv
 GsqH5zuh7aVasX4EA38tanYIop6iytEIHuhRbKV/VL16JVSfHLXyunXlSSkreMbgTCtS2mi5nJb
 1MOxSkIxbyMzsPulB+0GhSdRTSwyqqm3ljnJ7AtpEc/2+nrKPUbJY/8h9RwR7tX79KcNkhxh
X-Proofpoint-GUID: rGStGSxPEMT4BluUjS06vhvX0O6e9C8Q
X-Authority-Analysis: v=2.4 cv=KtNN2XWN c=1 sm=1 tr=0 ts=688b433a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1B6o04Z4kyHWbw-D5gsA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-31_01,2025-07-31_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0
 mlxscore=0 malwarescore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507310068
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

On 7/25/25 10:35 AM, Neil Armstrong wrote:
> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
> the Frequency and Power Domain level, but by default we leave the
> OPP core scale the interconnect ddr path.
> 
> Declare the Bus Control Modules (BCMs) and the corresponding parameters
> in the GPU info struct to allow the GMU to vote for the bandwidth.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Changes in v2:
> - Used proper ACV perfmode bit/freq
> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>  			.pwrup_reglist = &a7xx_pwrup_reglist,
>  			.gmu_chipid = 0x7050001,
>  			.gmu_cgc_mode = 0x00020202,
> +			.bcms = (const struct a6xx_bcm[]) {
> +				{ .name = "SH0", .buswidth = 16 },
> +				{ .name = "MC0", .buswidth = 4 },
> +				{
> +					.name = "ACV",
> +					.fixed = true,
> +					.perfmode = BIT(3),
> +					.perfmode_bw = 16500000,

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
