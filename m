Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55038D1EBFB
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 13:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB55E10E605;
	Wed, 14 Jan 2026 12:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JvpIPEWP";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMnMV6TZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA5810E574
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:26:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E66Ssd2632980
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:26:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dBtKhiSX+0Upq4Tgz55RdSfcY3zlhvYInSL7xhV1iQ4=; b=JvpIPEWPmKIbbjYP
 dMCqvPHtQxPB5m+DnH6d47iHnP7rXqa3S+0H8aF3sgJSArdc4BMR78dIVHwMvv0G
 j8CFPX4ylKHv+fucr32NkfgSw//a9ciHgPSVCD2bbcE17TCab8+yGDh+G9pmZ35p
 +oN6RrQbjtzJu1lecBzc2S4Zk9cxt74hBV3dRrf8bR5gwSHYp1n1QJF8IayAgQPw
 U3CM0JiS1Y3xRR6OkAFh+cxme84ddfRnk0YhU25fR1PtOtqm43yvG9aDCNt7QvXC
 rPCbtCBKzFk9yVPSjxRf/EhnQy6a8S2rDdO1pU6v1imGpk/BbCXAAdVhq5AMp6CC
 G+AZDQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnuk929f5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:26:57 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-81e7fd70908so8395842b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 23:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375617; x=1768980417;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dBtKhiSX+0Upq4Tgz55RdSfcY3zlhvYInSL7xhV1iQ4=;
 b=fMnMV6TZJihQgYaRRnTIOcaupDJ4LCw1KxxgC2DwoifOuyOg9r3O8Xe0bBmJXXSIbU
 WgJK3+0pdF3jdWJVwHq6hwTUdtloTg/5PCeI3PI/BaT4QOg5ZJNv6UmOx3RCl1K31itb
 Ztk/1pRl3C/JrgQ9WKCWVcBgkHYKGdtCTiFKxrApYCvzh9IEjzisPKMBcEwA/K7BIAAr
 wrlKiltpYXmnVqD3XkM9C9wCHOwbOqX+6Bnd7PEJUUVdmJzSfZDIhwxxbHvpm5BLHCdO
 SiL5N/ZhaYsiaqkD9tE7AxZxwqAGJAFG3DPDqUDgDPm/uNgiWxjxpNvSxAyj2tmQZCB5
 aG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375617; x=1768980417;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dBtKhiSX+0Upq4Tgz55RdSfcY3zlhvYInSL7xhV1iQ4=;
 b=DmPigmRtKRKEhy+DC4pt11OmfldGBTHkmk/PUW6n1JUh/s6S69/C7F8++/8cL2lJZZ
 yBlbYugRGgnc6MGoNdJCqKs9E6WF+G7lrZWeH1ne84zJJFTR/laV/Vfz1Q5ylmX3SVuO
 kI+h8tbcjXCWEfqmWrVlqczul0WGpB93jB0usEcFPP6hLETtOa4sfOW0Wtma5E+sYAl/
 W4Qiciq27Xwx1VwQ5ZE2v5EYNZSrutXC1DX3EiCVlM5sNkRBs3zzes1Sgl9wz0OsQVzP
 i8fAbw6td7mIZtBeLyo2iHFtllDuvP0B7AK3MZDoG47EV2Iqa2myURqb1K06pZ7G9FPV
 QEPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVJOpVbk0wdaZtskRq3cX65SfE5pWKrliPB/zKTxMxxXnlRJigRnM1u5cYovEGd41IK+oMlAlHyB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPRfnexqeAU2zGNruvloeYYiWbT1n3Bl9E42apJmpuO1VmkcBX
 YYzwAhd8fwP0kQasYCvgNiVilZfS5bLymd/P7HDW7jD1+8j1I/TPS4R/JzgL5j/vfU+AD+8seLh
 RtlyaSa2PblID/LKHJHQZQry2SAA4wNNwjAXW8b882q2B7WD8dBqAxSb266P66aKHbO3wFHY=
X-Gm-Gg: AY/fxX68ZNllmbQuLf1lRGlcfxEAdfpjgzyIq2kd8405kt++Ri6dSbT0DTapkBJUyxL
 OKdVOR0LQaVuAkH6gqPJmhpNVyzFrz5OitJQIboWQvtUXp6l9uKqJWbkQKqMSsAcGoQ7RmQ2Fig
 Bygkz8CvkMaGi3+wJekWIas6bThxgtyHJGBx0jpDGK23TQsM/7IscFmhsTYJFVN53wz4+Yyyhpk
 bugprxUSEUnz5UGmVuGRpFShpLC/K83Tslxbttv5wrHGor1oqIrxlYfnmsqXt5ks4g2wbZg9oH+
 bTIwDG2jhNkpXRcWbw7q89/rsiRztLXmHbYAOkq1Z6tIslAysl91ChD2sR2blWcyyB1TBsRan0J
 20R03/rhAwjkQOnAQ8yOMV99NcD7RwbUOjcamSS1kYxJO
X-Received: by 2002:a05:6a00:909d:b0:7e8:4433:8fb0 with SMTP id
 d2e1a72fcca58-81f83d5e569mr1170859b3a.56.1768375616691; 
 Tue, 13 Jan 2026 23:26:56 -0800 (PST)
X-Received: by 2002:a05:6a00:909d:b0:7e8:4433:8fb0 with SMTP id
 d2e1a72fcca58-81f83d5e569mr1170836b3a.56.1768375616238; 
 Tue, 13 Jan 2026 23:26:56 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f87aa4f97sm250194b3a.69.2026.01.13.23.26.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:26:55 -0800 (PST)
Message-ID: <57f3bfed-61e2-3e6e-c7f1-8f1ad69fea94@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:56:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 05/11] media: iris: don't specify highest_bank_bit in
 the source code
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
 <20260113-iris-ubwc-v2-5-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-5-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ebQwvrEH c=1 sm=1 tr=0 ts=69674541 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yL4243FK61EKG2Nsi2QA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uQWPv06HgCqk8Aj_HWIeH2eWGpvBaJJ4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX2pFaJ7PwkxfY
 mSaEz0nr/ANjoRRWnM2j7wl34ZCzM1XsJhv67ZMnnEmMfB7uv3s0GB9TOrgkznudl2vlWlxlHzf
 /B5WVsjnz5PtfZvBZgA2C+82eyt8sgfmHDyNCpahKWw+q6x63nPkW0GvUjY6ovG6lRIvMvR5h4M
 4/nsTt5XU5hckjKA/Ntzzf2Hg9x6YvKtSkfw0asu0MArxx/M+Za94+NPM7QHL/uFwQJDnNmAecY
 5cBoWaei6BmBsVuePs5CAyBosxlI1kq0nz4pDroftIKj/BaSNroF3hy1B2vKBAJHUwWkdW5wT0s
 0WQK3jgVCdB080TA30LlMYXellxkARA+e/x9XSVcPVr/rxXKY4kNJrLCePG8djaBhAXbA5yBVNI
 w2IkjVV3z2oF1QpBauIp9GNUvDVk4p6MSlMoeSQeedqYFhwd8PE4hm/CbwkXnOG3BgmaN5WqFCo
 9Nab0tq8pXdnUoPeddQ==
X-Proofpoint-GUID: uQWPv06HgCqk8Aj_HWIeH2eWGpvBaJJ4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140057
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
> The highest_bank_bit param is specified both in the Iris driver and in
> the platform UBWC config. Use the platform UBWC configuration instead of
> specifying it directly in the source.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 2 +-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index 878e61aa77c3..a4e60e9d32a4 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -159,7 +159,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->highest_bank_bit;
> +	payload = ubwc->highest_bank_bit;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_HBB,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 3c5f3f68b722..8421711dbe60 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	highest_bank_bit;
>  	u32	bank_swzl_level;
>  	u32	bank_swz2_level;
>  	u32	bank_swz3_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c70cfc2fc553..5ae996d19ffd 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.highest_bank_bit = 16,
>  	.bank_swzl_level = 0,
>  	.bank_swz2_level = 1,
>  	.bank_swz3_level = 1,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
