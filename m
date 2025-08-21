Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78466B2F54D
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 12:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5245910E929;
	Thu, 21 Aug 2025 10:28:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CivwUtCh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A17810E92B
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 10:28:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L9b8kP015224
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 10:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Bo/sYYeMVH8ubDzUgHDxT88A
 ZENWIvmqdh74NivXn0w=; b=CivwUtChF8i1DNVsez1ALO1+qJB3ve2S7jUeT5r0
 LmxxdTJx0OVqCVRcTyLKGsbXHvHx6R9XKyQSmuQ28t5VE+9cvH9k5FaBInfMjnX0
 JjIqEP5+hxHNuYO66Vh+J3/M7t2XWQVpobj7hYSEoPV5z8PS7/352vy5bEOJckEr
 j0Z41snS1EXDZREWJ4+PF5WR73VUhgppFNzy7yR90sS6M+wancgB6Z5trIm9FjT/
 FjYX0qLcKjBMgVO2gVZStG8Ub/DbnXz4MhGXYFm7nOLgnVGPqaUKqIqE2zV/Zqlz
 fMtLIqeVo/HOMKQlH/lIya/tBWp37D+snFXNoibYywITOw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52951ak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 10:28:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70a88dbf013so19649936d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755772103; x=1756376903;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Bo/sYYeMVH8ubDzUgHDxT88AZENWIvmqdh74NivXn0w=;
 b=coSb9W0Qt3Chbfa5lcwqGsrnn32vzvDrG5UKp/e0Hw/mLus6q6RLG2S+Yjw0zlJNbj
 tYp0mnGRoiigf+yK1nUxHGkl4F3SEKPGm7og7TcqGcU3L7BZD/cIn5Sa+ltGIN1CZiaX
 m3OaINcqszB9/Mg5Nwq4G+BRrv37hFW4IBjE91N2zBLL/0BJVQTmKI1a7DBYhCUxBzEC
 qwsQ/uJGabMcvI0ETlqiGAvw66roLl4QGY6RR9hdkhSwNDMDzLdtZ9+Sx7CAMqhB+UzX
 yyDyY5SaDZ5lH6YIN2xAC65lDANhtySnlwEakSz0Nlt5Bki7CUYLGd2ZDmDOwkGClXAf
 oKUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMDLzFd8k74N1L/VRTNlAUoNNOUNJFnX3cZ5EFW66j9wkSW6Tq2TouHsn8folm7sRXAN5eUbd8ed8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyoc0nhboSQxmxje7U4xV97uybXjmXGp8K2HHwFfCZudHwhN/O4
 RTqWPxIVTOJleERobvZZXVDw6osLo96XcZtQ2Do/nQehHfv47hKQ8Sils481EogRZxTWI5qh+60
 UucVHl1DOy8J+K9gMMsJcXjynaUiTVAw4gb+RLz8VA/YGO4/m87tE/IN4MO2M/O5JtKUEwPc=
X-Gm-Gg: ASbGnculmFWeR8zDUqotv6zwcFgdxqz7siKgg3H3hd5ZgkRMGPGgmk8EWWkPDvaTwO4
 9egISELMn8k4CyBE5e15HzhGoYnrn1vss47LBxy9RwP2+FWj+X7zNlYk/v0lL0IbiC9AbVdp8aB
 nxF6x2IU9Ctp1intxb45UvHd06GNhQRrJtG/c70Zs/rSpzUZKB7x/xjj8TZmCdQ7D1RNkf/vNHp
 8dggr2+OUgCj/tlC9rAgM/O1ZyMgqsIoi705Dti4+cfUvebAeE61zzzmf04sFKG1oCh9jVvBRv1
 QLhRFx4Ss8xhgpvz3MLiFDD10WbC4lcr2tm6k9v6OXAKA27SgkM++21CjwQ+i92QMDRyUNJEK1L
 rAjxkSWCE9HDP+DnH7snwKEVBhYDHmdBJKNBC3UKdmbczg2yDQ0w4
X-Received: by 2002:a05:6214:21c2:b0:709:31f8:fd96 with SMTP id
 6a1803df08f44-70d88e96a7dmr16543806d6.20.1755772103358; 
 Thu, 21 Aug 2025 03:28:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwYF+lZ1f8liHpI39C8YmGl+9DTxpGYR/3aTWLPUKxMN0WxZXjU48KYaq6jDvJjEnbHvlfEw==
X-Received: by 2002:a05:6214:21c2:b0:709:31f8:fd96 with SMTP id
 6a1803df08f44-70d88e96a7dmr16543666d6.20.1755772102918; 
 Thu, 21 Aug 2025 03:28:22 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3cc9c7sm3038380e87.71.2025.08.21.03.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Aug 2025 03:28:22 -0700 (PDT)
Date: Thu, 21 Aug 2025 13:28:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a6f4c8 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=WnZbLXWYNgm-BG77tk8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: OnbnAx3d0jUzFeZMAAv36PAy0hxs6u_O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX69KtYf3BAHh7
 TMeupY8C+E3IkNkOVl9JYNraMNFiFFrx9OXCHER54aEMKb7K48uv8pitD6fFiQ3j3QwJsN3gKa6
 DzDyatIgRVKgA8FBQoAXMGT9MqnlQX03GKfuZQSms6k6WATujDCqcORHCXbMY/RxZ1PJ3KONcxs
 EJkZ4Ht6lahFEjlgYWqjHdAvoXnbOPwjkpNMosoGgI1O91s/RPDP9VguAW2gO6Yy3LiHx6jVXnY
 dJ5XP1FoYEBOiLTCNcnrcscVOwk3HEGNk1xmxC+bARNeDEfMgMND8iNyMtg0K8kzxGEBLtbz9TP
 IW5yq/DZt6Szf05rbgGDor7rnYeNFqziDlxjonNdCCnQBml7hdO83tzNP1BCG+FdhhdXzTBipoH
 OhpfB4x3L8njWQvY/RPfMf/Ntg9avg==
X-Proofpoint-GUID: OnbnAx3d0jUzFeZMAAv36PAy0hxs6u_O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-21_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> with same base offset as SM8650. It requires new compatible string
> because QCS8300 controller supports 4 MST streams. And 4 MST streams
> support will be enabled as part of MST feature support. Currently, using
> SM8650 data structure to enable SST on QCS8300 in the driver.

Bindings describe the hardware. There is no point in discussing the
driver here.

> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp
>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -179,6 +180,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> @@ -217,8 +219,9 @@ allOf:
>            compatible:
>              contains:
>                enum:
> -                # some of SA8775P DP controllers support 4 streams MST,
> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>                  # others just 2 streams MST

QCS8300 has only one DP. As such, it doesn't belong to this clause.

> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>        then:
>          properties:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
