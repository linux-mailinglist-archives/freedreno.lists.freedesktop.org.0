Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01696D1EC03
	for <lists+freedreno@lfdr.de>; Wed, 14 Jan 2026 13:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E442810E608;
	Wed, 14 Jan 2026 12:29:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPOUIh8J";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hvPZ0Xfh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9729410E158
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:25:23 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60E66CXo2138994
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=; b=JPOUIh8JL8AIh38F
 T6ly9WdUMZhwcvqIYAb9kr4uOa00UrRr5rCUHqI1syDsVZ83hrMB8+8/5IMMmBHL
 AnzjE6Ydpi9a2XHXn3zIJFtUpWTmAkWbFa8uvL7dd1wWJlPkuMtwDNUNiEgftKG5
 9PXGO4FnXwmUShAbB5lT98RD3vy0GmtBXtebUTDLxbrOxCqjwykMLkU28nrzKY9H
 InrAWgCv+Qzh87QAUMHpxJLNQ69xKm0i4RBrxIkrehE7lMFT2+VxwMv0kf2Yjnmq
 xQF5Iq4V8T8LV5mS9BCnWtFCQIyzUrZs26XwrA3FkvrLpmdjkPNZiDK2mh+Vo/j9
 QcZtMw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnm0duw0y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 07:25:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-81dd077ca65so4034132b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 23:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768375522; x=1768980322;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=;
 b=hvPZ0XfhLt2ysG3gqYbDeYQUGt+zC6Pbv138X2ISpkr1QbWEfZcsmUWoKtxunaArH9
 sJPvZWbYZI+sDJJiun5kibtEBpCjHsawsj//zR22zTF45BwDOFPix1jPNtsbwVywhQeG
 PiKIJKR2gSunYCh+zvy2XTrqkUCjQPUfnl36qBQRrYpFH2TRmRE69MuML/VF9Qia4kHO
 gv8ToJ7E3HdZsgC8I7+Iy4kn6FNLLuxTX+BVnFz3cLgBzG6ArgU1rIZK1c2hW7RADuli
 CDOM0KFGnR3wuftszPqDm2+ig6RXiGp8VaemQg49h6KMXt5Qq4PZ97gSFPNAFd+uo9i1
 gq0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768375522; x=1768980322;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EIKvwWZ09qPpnnCXZJpVZUB+Qv3PCgdJBJ893R52Bxs=;
 b=UTr1T6BOoztlQ1nNAWQ24TC4fx3enJXqtzYMkbfAGoyl1JL3BOICz+C1CXu5mSTXqW
 JA2PfTj9005FvPQLk9eo00s6JZPkxq+zHPOqxqk+MSBSryNdFnJFTn0ojr9ovPIk4xeG
 RREGFprFM2/pWW9tbtN24f8E5JGn/XWrfss+CpyPvNWJFRjmlLdIKntna1URwmp17Ufc
 CZeDVPaEJy04A1i+TLorCi28yj0bS4BLH42hbP4PeGBOQ5cbpw8N7SAhTWa7xCQoeluX
 fWHcApQD2v1zrz8lsokDR09vPfI276btU7GRRXNfF5cIxWEocK26RfjmZGSiqRgYXJNb
 b39A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhTPmL9s4hbixgHKgHRM2LOCrYv0liHDHb+yFfd2hc+P52PuwZen7eshYKHpXI7Lr/CSZsdAc7a9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWQJAeO5wP02cJ8uksvICjUp7hYOlfTt7GccF5U7ryaQVdrKMD
 iwaJynEMFTwzMhlsUaoFAo5jd13EcOsiX/YnbHu2BG9GeR6N/4jdKl3Glfqkz5M/BWu0/40vaIt
 YTYasmo8K1HLH2Ei6i/jicMl/aFbVDcnKeVaC7XDHcbivgFbEf3wBCycaxhubMp07gVOUDF4=
X-Gm-Gg: AY/fxX5Wkf0x37m/Mp4wCljONazhxBzcSger8wmA4N7R1WH3ibRNXNEbxD+OMX1jXqF
 zMai4ly3mic1g9/7sRH/iBCltFn1DwL2Px5M5nmnlrmnLMLpq5KWdtA/km4GGBPoG0x8gGMc9Ex
 ofrw9cpBoWXHtyunHmZEPkWhYoxGfaS5R2DK8PD2n+G7uvgG5zile/xhbo0Cc2S/hgmv6wdBzV8
 WQ9QBYiqJ1fs7p6bu3yigmKEIbNiMhxzwJVBHf2KxUln8hvHHLXY9kpIWFhL0ZTPwSQOqQAB4vA
 ph5Nirsr8zkwMe5BYjCgDywkAOHm2OYRLsxIkUP6glfvZ3WClrl5Z5xwidj6XxagUNRE/rs4r2x
 32+nvHrcg7qXnJ/m2h2oF3OAGY+O5RykEimw2K0IrVYvc
X-Received: by 2002:a05:6a00:368c:b0:81e:f623:ba04 with SMTP id
 d2e1a72fcca58-81f81cc85ecmr1637013b3a.13.1768375521487; 
 Tue, 13 Jan 2026 23:25:21 -0800 (PST)
X-Received: by 2002:a05:6a00:368c:b0:81e:f623:ba04 with SMTP id
 d2e1a72fcca58-81f81cc85ecmr1636982b3a.13.1768375521017; 
 Tue, 13 Jan 2026 23:25:21 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81f87aa4f97sm245432b3a.69.2026.01.13.23.25.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 23:25:20 -0800 (PST)
Message-ID: <bc537a18-04ab-0ea7-3600-2a35418e6a05@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 12:55:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 04/11] media: iris: don't specify min_acc_length in the
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
 <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260113-iris-ubwc-v2-4-4346a6ef07a9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BYXVE7t2 c=1 sm=1 tr=0 ts=696744e2 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=52UxMbdsJFNFq4lwM_0A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: pimJYoZfNp6ikZjL4JPcTbzBahswiqmW
X-Proofpoint-GUID: pimJYoZfNp6ikZjL4JPcTbzBahswiqmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA1NyBTYWx0ZWRfX285XhhtZO191
 M1P0ptSQIQPplr4kkEzuM9k37GuIL9/xbveYnIFETEHaIEsrV44E/dAdoK4x1677602MHdMPV0m
 ZrEu+l7OSwKBEgrOolcnQk0snEH0PFtBlc04aiVyB06+25nyjEirliXXPDSnBLtjr2+rwuLwahc
 wZtwUCLWKhoXchMEYOSoW/1dn65iUE7BgbZZCi0X7BIbeEahf9e4YAXG/GouFBSTsxzO/Xh/ckB
 loz+iUPgXPv2nnVK51+l1OTloGs/eQ+BVuBm095cv5vmObL7uUKRNYaYlyWFGAGlN0KSwTm4O+X
 fuk59gQEkPoWeVW5Z2cONFm4Kk4br6FUsLxF7S65tIQT9vP/HhkC0wUPjxlCwyiRlZvHMjEvul3
 uo6AOXpN14bUr0hxoX/WhZlYK2xLwjEkEiB/hs41xFeC+PwmTa1PcGoeIQcmlrEoU4RxKTqDk2h
 /yuIVw0dHOrFTNYNCeQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_02,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 suspectscore=0
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
> The min_acc length can be calculated from the platform UBWC
> configuration. Use the freshly introduced helper and calculate min_acc
> length based on the platform UBWC configuration instead of specifying it
> directly in the source.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c | 5 ++++-
>  drivers/media/platform/qcom/iris/iris_platform_common.h | 1 -
>  drivers/media/platform/qcom/iris/iris_platform_gen2.c   | 1 -
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> index d77fa29f44fc..878e61aa77c3 100644
> --- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> +++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_packet.c
> @@ -3,6 +3,8 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
> +
>  #include "iris_hfi_common.h"
>  #include "iris_hfi_gen2.h"
>  #include "iris_hfi_gen2_packet.h"
> @@ -120,6 +122,7 @@ static void iris_hfi_gen2_create_packet(struct iris_hfi_header *hdr, u32 pkt_typ
>  
>  void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_header *hdr)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = core->ubwc_cfg;
>  	u32 payload = 0;
>  
>  	iris_hfi_gen2_create_header(hdr, 0, core->header_id++);
> @@ -146,7 +149,7 @@ void iris_hfi_gen2_packet_sys_init(struct iris_core *core, struct iris_hfi_heade
>  				    &payload,
>  				    sizeof(u32));
>  
> -	payload = core->iris_platform_data->ubwc_config->mal_length;
> +	payload = qcom_ubwc_min_acc_length_64b(ubwc) ? 64 : 32;
>  	iris_hfi_gen2_create_packet(hdr,
>  				    HFI_PROP_UBWC_MAL_LENGTH,
>  				    HFI_HOST_FLAGS_NONE,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 8d8cdb56a3c7..3c5f3f68b722 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -73,7 +73,6 @@ struct tz_cp_config {
>  
>  struct ubwc_config_data {
>  	u32	max_channels;
> -	u32	mal_length;
>  	u32	highest_bank_bit;
>  	u32	bank_swzl_level;
>  	u32	bank_swz2_level;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index c1989240c248..c70cfc2fc553 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -633,7 +633,6 @@ static const struct platform_clk_data sm8550_clk_table[] = {
>  
>  static struct ubwc_config_data ubwc_config_sm8550 = {
>  	.max_channels = 8,
> -	.mal_length = 32,
>  	.highest_bank_bit = 16,
>  	.bank_swzl_level = 0,
>  	.bank_swz2_level = 1,
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita
