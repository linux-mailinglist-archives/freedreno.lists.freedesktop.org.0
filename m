Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BBCD12267
	for <lists+freedreno@lfdr.de>; Mon, 12 Jan 2026 12:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240DF10E0DE;
	Mon, 12 Jan 2026 11:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="O41eejZR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUh0Hck3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C59410E0DE
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:02 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60CB5fXQ2822278
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=; b=O41eejZRHpAWdZ2l
 PNKFKurHrJh3SZCZmFjIu61O9IHVBoqQoULJ3GNgPi6ckTZqoZXR7qOvo9K3ob/r
 GhmbbNrrJby6gbn7Pv4c08c3crkKvnqeBwgeAdPcHzHUvJV3UWSYvXIvGX5yuOPz
 yw/veTUK+ISK8OS/QZBd6FgMVuIE++YzJuwPNRtthTOnqu1lOjmk/hbEeGHwHb1+
 KR25XPxLbeaBJiIIfvqPEtl1sO2DpArY9ko/451iYhyp+27nGNkgRErVb7NoxW49
 70G3LKnr9oYp+oUvu0OKaHa7bQl3BYGyV1f34ILMJKYoHPzQM61P0HcMv4ZYCMx0
 k6d68g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmysag027-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 11:06:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4f3564e2321so11803301cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 12 Jan 2026 03:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768215961; x=1768820761;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
 b=jUh0Hck3/rvhzCfgNalAKKrrS6TE8Zd3rRAHLRTFUXgMkGWodrPGvYHwsalkcSBGL7
 BLfUEfMvDJM96iqTU/1UoY9EBAuUgPfWFWrKV+WEeKfyZDOiW9qIVVvO0s5j2Ngx2QF5
 28zuykBseQPllTstd9YPa33R1OXTlFrmvw1NQujDOHsSOQPaCLKkOgwFyWZHJgeDMAAv
 JFhIbz9UZ5Fk5up43+sJadlI9V8TAk2XOKhvlyKXH6RiDbao0gZzQykWXLhnw5y40Nit
 2Kzb+58NAwqwxMlDtgUuVA0/o84FJWcAUEHIcD+vukyg+8U7jLiGIPggIa/0t8mBV8i9
 I1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768215961; x=1768820761;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CWPzQZzX3ElW2Gtvw0e+5qAqtv4K5X2Kt31bDWFr/r8=;
 b=X7cHaJ8VJCD56GWGFWsKzVeCAVbFW168vwX5HYLDK/N7MijWI2EIidlrkVUna65DBW
 BLiQn0i4jHPQnJ3OII0t2Rbm5hBFv8VB9l0naec2dO9tIWtsfPvZhcbKgWJWFGYZiK2N
 Y3zIYx0DOGNWWsMpUnCPDdJNMwnApw77elxX8U8PkZhyRzq9vAeGlOZbI8l6lO0MMP2b
 dWSgJ+x2LIZT4lSZE7itM/0hOjSUnxuhL7ULBDw7exRIzLRikFb6Qd4vC3vnuMqZCP3y
 7nkccHEfsBdmIsIo0Ihd/48GkaMy5oyIwwEvvZFrphFdw1SJuQ5N+20M2V0sfa+iWqkz
 Vksw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXb28I5Kw01krU2zCDF1gJmLMlpNLyfLMwQm8J+sUuQQZWdIwTFak1nr5CoSFqU4egEKUJe8bC5JkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzifMNuh7GNaavg54Ua6sqYI0d5zIV2k06fjH055s5lmfQy6ybo
 b3cqvepOgpJgyW85SHdCvA6D9+S3DoKr1eDUhHjiYCnvcJ15RcZzQ8yehH7rtK285Ickf+1GjAa
 FfaEc8t9VJlNel2F4hyccMdqeK8ep2CyJANTZ65SrVbhfAMqCt1Sajb0US3yJY3ghFUDWqQE=
X-Gm-Gg: AY/fxX4ZHBVJcJUY6XUN0EsAdYHAqqSBQIXo/E4sb7m8AmtWpdvRF4duGFqNDqnu8lw
 vhmv9Q9fjPZwK42zvCyvaHiiLMdtxnByrtgskc15R9aFyP6KzWjSJDqRc1rs4gxlpK9UCWj552L
 HHwj4U+mM2G/5EC6jVPtdtyxXWalKRkV4qXYDVMlyt46QmfiNqOnpEwSgyzsisZTfM3+TvCi4q8
 VbopHFp+QGx97x/403dJn+t+YA6CWVlDrY/4ao2+gGNcfbOavkCx1TUVry8nlQeJz+9qOihg44u
 vwwztE8y6jBeXwCImPXNvWM6d7T3WL+EKorP9tCA98CcLuoZadLE4OGThj3c8IhubFU3D2JqvdX
 xxw6MLxXPmTrIe1C4mHDO0udFh0hjmJpKAIF+dTqa9He/kmSbCL1RJSioMwUCaGj6saw=
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ffb4a8df70mr193903131cf.11.1768215960644; 
 Mon, 12 Jan 2026 03:06:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHNv1v7wEqgWI3tjOCT1nA3PXnJ9lceXAcF2SXq40DOYlfVDQzD03ft0+q3tMM/DtBiVV4WlA==
X-Received: by 2002:a05:622a:4cd:b0:4ee:1063:d0f3 with SMTP id
 d75a77b69052e-4ffb4a8df70mr193902881cf.11.1768215960265; 
 Mon, 12 Jan 2026 03:06:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b871f50cdc4sm209534566b.20.2026.01.12.03.05.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jan 2026 03:05:59 -0800 (PST)
Message-ID: <9b91ee50-9166-46f4-83f0-c7a46bc0ca06@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 12:05:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/11] media: iris: don't specify max_channels in the
 source code
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
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20260110-iris-ubwc-v1-0-dd70494dcd7b@oss.qualcomm.com>
 <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260110-iris-ubwc-v1-8-dd70494dcd7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=auO/yCZV c=1 sm=1 tr=0 ts=6964d599 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Z5E5LkF8W0bl65O362YA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: nmtM66l9grc7YuhFDrRNRpZgJClKyel0
X-Proofpoint-ORIG-GUID: nmtM66l9grc7YuhFDrRNRpZgJClKyel0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDA4NyBTYWx0ZWRfXy7YBFNW83rl6
 dTNgYk80i23X1oxW/95L472cFDFje/I71Tjzx5ClRbTb+5f6/IPWJvgaJeExcg2HTTFP8V9w+Lk
 PeBaEQWMc5ZGy7QcRTpKFXg9ioKkhbunFP/XOn15gVWxGg59s3yiUP12KqrBKyoELwZYDmThheM
 2N1VSR6dIGBFm29pT3R2LYiXeDjUvuP+1jcYSDEZij/c3nm6txm9ZpERVyBIgpTN6V6yMkEb6PW
 GjxfRYetoZ3hoM1OnGNGj6gaNgIhQDNG/AJ9XbZcNjWP16EdBaNlmIVPzrz07Qbl3tCVutJPiFA
 dAbaI24qS2s47pIVcQ0yyfr5UT6ExkdDLeNeZ2oT+AWhnHWCto8r+hP379vvmSFnIx1uL3t+4Zh
 RSPO436vzjoWDrfcfu+e+vT1t3mqz/V7nUujCsNu2Zsqw9ugfh+ZTUZG+iWyZkJAdkC+bHssleV
 zWRhGHk5ewyiqtxxJNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601120087
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

On 1/10/26 8:38 PM, Dmitry Baryshkov wrote:
> The UBWC max_channels spreading is specified in the Iris driver, but it
> also can be calculated from the platform UBWC config. Use the platform
> UBWC configuration instead of specifying it directly in the source.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 9945c939cd29..91dbea4c6664 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -139,7 +139,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->max_channels;
> +	payload = ubwc->macrotile_mode ? 8 : 4;

With the hope that this never changes from a boolean

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

