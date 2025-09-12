Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 308ADB54B53
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 13:46:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BFF10EC1D;
	Fri, 12 Sep 2025 11:46:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLd+2XvC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EADA010EC1D
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDKR015054
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=9R/kPch3W5Cml6FifUegM7lF
 XoROZHqulO4RRRDKQxA=; b=FLd+2XvCvSN+zewfv4IgufacPZN8XrDTtIGPVMb6
 L+NKOG2DDaKsU3DaTzamqqlGdcZnuEAUkMVzfkttkTIo0o5gEsCm1fv6hiP3xvWh
 W2ViqQ1sNFI6A+wtPdDEaj1oC6rVZrmfDJYWLr02dhmqiNuIO6inWeIi9pH74azs
 eFDUpEEAuTJWBfY6R4iO6IKbwPUpILpPOoN5s+/7kh4LvPfiCF15IZFTrPdGmYjZ
 XSWzcLL5Qp+XNlwjOmQhtJfPVaQrQlPbNN7RJ104Z8gAQjTnOq1MYmqK/TwFpp/Z
 lJjDAN1B20YuM6UkW+B2CcHfaJyKKS3C2UEOtQfZt4iQTQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapusdh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 11:46:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b5ee6cd9a3so39125351cf.2
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 04:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757677569; x=1758282369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9R/kPch3W5Cml6FifUegM7lFXoROZHqulO4RRRDKQxA=;
 b=NkjDssy2tefbEE2WMH5prGtPWaPr7/EhhZXE9dOUU76r9SQecXjpyaPia4SfMqulb3
 E5Icf2ROXWIF3/AJ6+Eze79lmSBi46lZEJpRoyN6kXhaTEhgmz0+x3QLX8dUMIKXmbUK
 M/tu0HhR5sn79TDIUYkNR0t17vDpj5vPr0t998k49Lem9ugkcR+D0nRpZAZ8eamjTiWz
 pOqESjx0J+kVmVeu+S7ulRhFyXmowUlvEgbCnoq7ejecxRw0hYa8+tvitypaK3EbkJsw
 3ZCiOnlxCwzmsr15rNbrhNvEtEQY7MYJsJsNDnxBtKiptxqbIm5Ra044FnRvnKdnzQtt
 osxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrPTYWlxu2T+7FeGoIC/B2tQQ7Yt/sK1u4TzfSFCeCgjpEXGB3WnMHFAuzF0GTedGt2AaBcdu4vFI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcY86MD05HYedRN8VfvLbtsajx7jqQ+yuEgSBdS6rZ7IOagH/Y
 MrzxwTOWe2bs3lve4AIMsRGe2csEm/gXQkkvlU1vJ13oJjIVQ94YebV1gVu6D3XRZGfOmYbAiwV
 yiMXF3A5yBOScu7pNg4VLuZ2LHOZnYDzI4KfyXF/1d4Tw4kENxA6R05J+Z0FFisBwWHwl0L4=
X-Gm-Gg: ASbGncvyeDqsUkfwWpE0VfD0ZD2wdxMYp3SRD3TmWyyzU9AlPPRFRMaCAi5bxfALWH/
 W2u3Q87CP7klfOFFlWgrswGZk1ZyMtJTbA8Vbnnl6z/6twJandgg4dULtAwgomRJwgbsllsv0C4
 Gr5JDpRX746af1orhDLaFXTKmx36yqBxw3opAZaBzXPbPxSY7ZDP6Ermt/EHLzKFOsx9WgKZf4r
 OOz2EzX7yFn+01OWzYY/3pzGJfx3HAlv3SmEQ5TXRkZNkH4OawULXDredgAtGoQ9LixNyNcz0gy
 NP4ENbpzYWqIWq4KMWSGEiQLyPzvgRqaabxTg0pWvA7oZFiA2gbcvkjZx06SLpm7gQVv0FSfCHj
 //Muk/QlnvC9cRT6cPKp3fu/ve0bIr+DPxtIUUX9FdkvlXMgFdHU5
X-Received: by 2002:a05:622a:3cd:b0:4b5:e606:dc14 with SMTP id
 d75a77b69052e-4b77d17bbe0mr26549721cf.72.1757677569050; 
 Fri, 12 Sep 2025 04:46:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdVs3SKgOxiIfzvO/EkGuSuQowx0IqMmkOv8Q4BBfV0cg+8bLLR4jRDO1o8cJV0pjYZeiqPg==
X-Received: by 2002:a05:622a:3cd:b0:4b5:e606:dc14 with SMTP id
 d75a77b69052e-4b77d17bbe0mr26549321cf.72.1757677568463; 
 Fri, 12 Sep 2025 04:46:08 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63d43sm1104326e87.91.2025.09.12.04.46.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 04:46:07 -0700 (PDT)
Date: Fri, 12 Sep 2025 14:46:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH 1/2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <sx64y6vfov4yag46erckpbl7avwmqlsqt3siebckn76m6jqxjh@f5lueyih6n3q>
References: <20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com>
 <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-add-dp-controller-support-for-sm6150-v1-1-02b34b7b719d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c40802 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EjQU334iH38qswJM8_UA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: dHM3R9rF-orIzvYpsgttK8LwLo73J-Yu
X-Proofpoint-ORIG-GUID: dHM3R9rF-orIzvYpsgttK8LwLo73J-Yu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX0zQifoz/T5oC
 9OYoelee2U1jeheH1tBlG46sxEw6wFpM/lIAGStUNYikpCjGW12WrfIQOjOTKAG/95x7OnNU+Zo
 U1aizo1Uq1cFvkO1G2kuEcfBUQ9kiHQw8L3wrWHGB9Wls11GFp78P2AkVqPgAOj5R/bYeAQlvDM
 +5VfOxTCtdCYacj8g95tFjrJPK5vOTRkTKe+QtJZPydXj6TV25BG0rp+bcCYr0NcQzXQliuORME
 V/yS1Z9animynPgSsRgMg0XIV6LIkZOe9cCFlB1SznKyIbJDgTNdgLzmNxZGhQu+cNwl97+uSjY
 ygdDamSBKDj98XvRUoalq5d1VbbFjuiX9PgGQQv4j9Vk8+YIF6MfEzMrZI/1PCC/lR1S+UN2t1f
 QN17ywsf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

On Fri, Sep 12, 2025 at 07:39:16PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller for Qualcomm SM6150 SoC.
> SM6150 shares the same configuration as SM8350, its hardware capabilities
> differ about HBR3. Explicitly listing it ensures clarity and avoids
> potential issues if SM8350 support evolves in the future.

The controller is exactly the same as the one present on SM8150. HBR3 is
a property of the PHY.

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..2bebc182ffe348fd37c215a6bf0becea11e5ac15 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> +              - qcom,sm6150-dp
>                - qcom,sm7150-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
> @@ -261,6 +262,7 @@ allOf:
>              enum:
>                - qcom,sc8180x-dp
>                - qcom,sdm845-dp
> +              - qcom,sm6150-dp
>                - qcom,sm8350-dp
>                - qcom,sm8650-dp
>      then:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
