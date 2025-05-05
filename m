Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8258AA96C4
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 17:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB910E330;
	Mon,  5 May 2025 15:01:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lJZJdjQT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C01B310E310
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 15:01:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545CQCeX005822
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 15:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=ajIwN9ybFynnOoUBfqw560tK
 D3pLVfHj6Y3hXWa2aUA=; b=lJZJdjQT+SGbsmSHoVruH15IgghckrcmGxAU5AGx
 YvsS+TbzRMNfC26GffQYr4lBRj/6zBlGZAXvjtaeWVogMI1XclocAIR7MtGzgfni
 5PloLC8gH4kQnVEPkn/D028O/PfvRIMLp2z/utOYhOZXLQpdkRDJyIP6ThpiZ+HE
 gZDekTShyXdJK4JTMTfFZ3qEWJTq/U94VICWKpRLPm+hwgJEOOOb6Qmh2hssIPxB
 Xp89nV0ROUut3A9JYQ+H3vbo9a6+tp64ElUTTemxnycaS2CEjlE9Ctj87q72bojV
 9y8cIG9BXTMVXxpEyISgyEj0NguSwl20L27V9KdVpE4txQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46e0xstw7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 15:01:19 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id
 46e09a7af769-7300b3f221bso3778620a34.3
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 08:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746457278; x=1747062078;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ajIwN9ybFynnOoUBfqw560tKD3pLVfHj6Y3hXWa2aUA=;
 b=dUDYaqxGsw0o94tKmHsJDtihxFNhtPUlM/jBKVzYp8FDqVuZMX9/GZXt0LMIIK/0FZ
 x3Y2Akphyqw4clqob66khTJSg59RJWQWUxWYsQdoezLNLQKOoB8wzvJmGNVH+vm8TbY8
 XOnNzKns7nLM7kzlCnDLLD12JDO+A6Hj9mgdriyyKA4MtZGFgIROLoqBLDp3qCYJj3BA
 iTaGF2glGjeSMj/V6INO1rHT5TWGh2TVtua31Xldp8s+NbPq9k+zkIz5czfdFHVMD7tx
 VTADWpccrytjkthAkitWVPCLQSld4jYL3EXKeULk0hQzYcNz3nj3Y3okg5o+oKqDFmFy
 0Zhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVagepqqOa20QpVjKf8GEPBNEA8UN7yZDLe/kz7OaNZUL5l1dnRgY+MyIMuKZ+QNpU7EY2wnO9sS5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPvK64QQERv/BAFa6DSA/UajG3ush4PabgADOoBINQDljXjfzQ
 ZcmxqawdcP5LL+rdRW2hjPHYdSP0kFAWLcq1YP6wh3NeCObztwtCWloB/GsZa6p8UaxQ52jKzQ9
 CdCWXX+s+OkIdHxyDg1SNaZC5zgIfPYz/855fDiouQS/zaQg0/ElhN2bU6VTLsBcpq8Q=
X-Gm-Gg: ASbGncv/OBtxV2ydIH7yVRpjhXQ2JdDQUWmkjdEf/J7dJXGPjIe9VHRGJE6WuYEjCSP
 Lj0k+b7lFAXEqY6be/o4r2LY7rXKlKMVKox6u44E156Swun1HxWHNwfbkKC/92GXjbY9W9O9Dfu
 oScxYVLTGOgLFrxkXKqmwQsqQElxdpz7whH9nkVqxAruIOiluhAOPfSp57f0xscAp/Sx+4Ks5R3
 ZuB02FkzQqNmhVeg6adNlZ+YfUL2x66/VuAni66KPI8kKQGMooHdgYU8xwISg7r3BB7nDTjwSKL
 AJxjCb+BNQYwuMnhzbsx8Pqnptk6EpafQo5QOYh8l0/1hQNMQYW0DHHuQgKqNrMBPrliCOONiV0
 =
X-Received: by 2002:a05:6830:6b04:b0:731:cb3d:67db with SMTP id
 46e09a7af769-731e560184fmr6735239a34.16.1746457278352; 
 Mon, 05 May 2025 08:01:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl5sM6QT1am070BqEbNtN/0tNEpvKAt2e2B2h/I/PNOETxxTlIHhgZfMD5SpwtZsT4oyPj5g==
X-Received: by 2002:a05:6830:6b04:b0:731:cb3d:67db with SMTP id
 46e09a7af769-731e560184fmr6735162a34.16.1746457277726; 
 Mon, 05 May 2025 08:01:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94befe3sm1749608e87.53.2025.05.05.08.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 08:01:16 -0700 (PDT)
Date: Mon, 5 May 2025 18:01:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Bjorn Andersson <andersson@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 09/10] iommu/arm-smmu-qcom: Add SAR2130P MDSS compatible
Message-ID: <liflz2mkkc7jiwtiynim2g2oxewdckbxo7y3m7tevbncqizfjf@ethwzfe3ft5b>
References: <20250418-sar2130p-display-v5-0-442c905cb3a4@oss.qualcomm.com>
 <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-sar2130p-display-v5-9-442c905cb3a4@oss.qualcomm.com>
X-Proofpoint-GUID: pkL8hYHLXDZNkhKgynFoi-ezOJhh9w2d
X-Proofpoint-ORIG-GUID: pkL8hYHLXDZNkhKgynFoi-ezOJhh9w2d
X-Authority-Analysis: v=2.4 cv=bdprUPPB c=1 sm=1 tr=0 ts=6818d2bf cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=bEtjVc3RIV5_29FDWJ8A:9
 a=CjuIK1q_8ugA:10 a=eYe2g0i6gJ5uXG_o6N4q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDE0NCBTYWx0ZWRfX1djuW3pR8VTt
 5N0ZOSGc9izQJ0/O34JXqISSbrvmZpOMfKgDDJyJXod1URF9Hx3NyBl1W3NolnA+PpfgKIqDJr8
 hFvr7bZbEuqxCpLXYhf92VBER+JA9QEUWCJ1yprDZZFxG3boQ2MBy9MUYlu/pceG+z+T796eLuL
 FhGQksa6pSQANbusRXAYZPjb2WO5h0j7b4nv/xssrOvr0dgbGSnIc0f+t0p2OpeTRvTpJl9be0O
 KYD9HAmqJeZ/sTLGAZuQO7ZS/T/t68I0RxhGlkGSkB3vZHJAOW76tZvcFG6oA0DZwjNgQNqo9SO
 8HCziFpnab28H01d0uUMbxozwklIGn4UpPg/QGL7nhQxQ6aZp+9gWaW/OvYlxpDpJ8UFSgbAkKH
 GFzIXWZkM9xxlDh1HWzUB+vhQ7HKqp83lBThGkgSa0POeIW/lQfrt1PwkvHAnxrG9sr/98D4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 impostorscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050144
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

On Fri, Apr 18, 2025 at 10:50:04AM +0300, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add the SAR2130P compatible to clients compatible list, the device
> require identity domain.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
>  1 file changed, 1 insertion(+)

Will, Robin, with the rest of the patches being now a part of msm-next,
could you please pick this one too?

> 
> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> index 59d02687280e8d37b5e944619fcfe4ebd1bd6926..ecc4a1bc9477b766f317a58ef8b5dbcfe448afa9 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -356,6 +356,7 @@ static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
>  	{ .compatible = "qcom,mdp4" },
>  	{ .compatible = "qcom,mdss" },
>  	{ .compatible = "qcom,qcm2290-mdss" },
> +	{ .compatible = "qcom,sar2130p-mdss" },
>  	{ .compatible = "qcom,sc7180-mdss" },
>  	{ .compatible = "qcom,sc7180-mss-pil" },
>  	{ .compatible = "qcom,sc7280-mdss" },
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
