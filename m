Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3C5D1EC04
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 13:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED20910E60A;
	Wed, 14 Jan 2026 12:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DlXtE8ES";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O6ofWseB";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2FEC10E5B6
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:27:55 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E66E5Q1872916
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=; b=DlXtE8EStOut9Tqq
 c6QVOvtjFtFDyKD4kg3CVxU6TGHu49ALAFtucCUicRJBunj3hpxh40abnfwalanS
 7ChVNHvpU+oZ9l+Ap2MfqeGrKttPrH9UN0UZs254Oi0YwZ4Ux5rOGltUKkFbG1Zl
 P5yAQJXUz2roItr5ZHuI97jv0fiX+4UL/ekYYZUGhyp8tT/LH5DEdqyv2ZrOXgfC
 ywAIkbnIYRqdt5QUHdLOOhh8EvQfpVy/v0/A55cgXVD6trFsmSqCUXFwPtCQl2iB
 z51RlXlXoiiydUhAsBSGyerhJ6kQlWQHB2Yc9y8tCU2YiJBRAIe1rL8y9qXykVmT
 BpJDWg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnu58t8bd-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:27:55 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-81e6ec1da28so3609492b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375674; x=1768980474;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
 b=O6ofWseBs9hCZ/Bz70k0L7+4bydvAR+XN4S+Y9VIKDZAL3+MOdrSonHdU2cqysjHY1
 JeXl6ibaZDGcqsm14/itrH0pMAQVk/DGQEOzpe+SR5O9ZzRnJrxmwTvCAH5Ir2f4j+mM
 YCWF5h/SBu+1AsoFsG0T0TJdg9t7XJmj3rpNXIcq/GMJqd0l8+s0Ls8bXLiDtbc40LIx
 8mvHtjQfHAkYLUgj7NipPFEbp6N2wEMrLr6kqzbU/SUfHCMWZE0tfFb40C5bhi7xN2WV
 j/5DogU9uU6tFObAfibOVKj93p4XMZ6a8F0s4o4h5UBpmVdDtyKgumlY0yBF0hysAI/3
 2p6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375674; x=1768980474;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y7k2tgjAg8hmeGu+ou2mei9nPjqC+aosoSBIaKA5fY8=;
 b=bzsO5Jcbknt1Iq6+eGh5X+LOBZiRNuYGNncWDSTnkXiM1CEz1SxNpGC7I/6apfGAUj
 /hQsLmDP7vnIyzlfucAzKOIiRatfZLtM3rAoHHIQA+vtBMuFw6g9QygWbh1375hCW82s
 psY4/Bx4b9Q49geeK4uI+lcJ4hS8g6XlNGg+hzuPVhdwSNfFu0IBI5Fb83tSi7ND1Ucf
 BzYT3mh4Gb5T6OimfzoYTaupdNJmgzqMy9CI6/3MUaC5UMMtLl6cn3UxTmO2Z0JlbRZj
 d4YhZFkiy7Qr+/MQ5zO5yWPj88VUGvS7G/+73pWuBF25LfSAvuBEBH2U48TNcPD+IifK
 CPBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrKXCvOIuxTrKAyV2CNKnz2vMzVEJ9giswqaKclUR/EcNfDxSJxPNGO0EkV5PxSl0ZvwQsqI4bKrU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz64JAsUNKqhtlDLdCp24yjmXdc+MHfk+7HkH5vm8JSMtkGk9Vj
 iE73KWCEvaGo6eFfq7AEBMXEExEambnkjEFjwjVRhn4SW2ySZZ4BuUPtWsRlHGrjhhcqab2m1S9
 +XqEtkD9WkvrXp/Y1vBw/gTEe5MfsKm5HNXH25ZMaP12LjM5X4omnqkeoDBG6HbNweEyLSFI=
X-Gm-Gg: AY/fxX6B8xficUF+vh6+clx4OLxMeEJBlGxvWzflw2F1mcMc6+S5B4x3xB4b8acccSP
 ervIQWFViP9kSAgs9MvX/OHluCPMrJ3jfrfgegeMEwJ6WdJMJZWjt8bBI7rY+TzFui5VkzyXY+q
 z+iwHIKcP+ljC1yeqapfj2gcNwwyOXPR5z73B83nvfnuElThcaudxFM7Fu1GzrDBht5iu3XeMjg
 5WwW56gGZE3XUNlstaap3gQ2TOnoiT6SrJvGBEsnjMsMpeEzTaTDdrX622hXa3twrWY7Uw8X7Sq
 keTG0FGqZFbqpKpSGhUOaV8yt5qQrW4DozRX2wl1+Dnejtw1GcNLW8Got7NdnYDPdFmrtdaF0JQ
 g1eMDqaGL03VyyOhCkbbbOkYph70aBlrMwzQd9wT/zqAu
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id
 d2e1a72fcca58-81f81fa1bd9mr1478048b3a.33.1768375674454; 
 Tue, 13 Jan 2026 23:27:54 -0800 (PST)
X-Received: by 2002:a05:6a00:1f12:b0:81f:52d9:5fe with SMTP id
 d2e1a72fcca58-81f81fa1bd9mr1478023b3a.33.1768375673926; 
 Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c4cbfe1ca24sm2855229a12.12.2026.01.13.23.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:27:53 -0800 (PST)
Message-ID: <a6e15ff8-d674-de9b-3892-5db3748f3bef@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:57:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 06/11] media: iris: don't specify ubwc_swizzle in the
 source code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20260113-iris-ubwc-v2-0-4346a6ef07a9@oss.qualcomm.com>
 <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-6-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX2GMak5/0gBb8
 Fjiz5J2Y3EIhTEDb34+mbUsuylO8y4Fjcji79t+ypBgnFMHmRxOvPI4Ykoe3o0ONb6++hQ2RfNb
 u3hiLju8EbXEihNz3bIJM+XmGFD0Dkn2+ZY3ZyH95sc+7QseDYD2MSO+sK6TRDs6uB9/NBIjQ5k
 I6dGUCSra5u+Rv2Z3DBt1lMSv7YrEOqCa72m426We0SkQYtDAILuaqU6nEcvuAWbAkrvYyRk7GV
 aymvIRrPECKmHRqOAA/3UYavKHL5tyMUEehl3BaZ2hj5jHpJBmg+YlHgwU3o+LW9CtwT2fF0ntD
 GZiQpBUNOQQzsqpZN6bDXJG4LUTBTSQVnAykHrN3qiKyypd2p1Qaonz3Qfd/s26O2o+VPvHzeLm
 7AUpCa8jwpsQ9EwHj8STcFnyd74wwu+yYhae3Zp/8DxwkHLaSHOp8G/IYxewsy2XsdoXCddHOvC
 rb5SvoyWII4viEAuCFQ==
X-Authority-Analysis: v=2.4 cv=BZnVE7t2 c=1 sm=1 tr=0 ts=6967457b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=rBqFcrSGyHFvDjdq3-MA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fxELnoO0i28jNJM8kp2VgyLDL_9aBRIF
X-Proofpoint-GUID: fxELnoO0i28jNJM8kp2VgyLDL_9aBRIF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140057
X-Mailman-Approved-At: Wed, 14 Jan 2026 12:29:35 +0000
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



On 1/13/2026 10:27 PM, Dmitry Baryshkov wrote:
> The UBWC swizzle is specified both in the Iris driver and in the
> platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 6 +++---
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 3 ---
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 3 ---
>  3 files changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index a4e60e9d32a4..a880751107c7 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -169,7 +169,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swzl_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL1,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -179,7 +179,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz2_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL2);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL2,
>  				    HFI_HOST_FLAGS_NONE,
> @@ -189,7 +189,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->bank_swz3_level;
> +	payload = !!(ubwc->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL3);
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_BANK_SWZL_LEVEL3,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8421711dbe60..9f9ee67e4732 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,9 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	bank_swzl_level;
> -	u32	bank_swz2_level;
> -	u32	bank_swz3_level;
>  	u32	bank_spreading;
>  };
>  
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5ae996d19ffd..0f06066d814a 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,9 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.bank_swzl_level = 0,
> -	.bank_swz2_level = 1,
> -	.bank_swz3_level = 1,
>  	.bank_spreading = 1,
>  };
>  
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
