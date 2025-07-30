Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D4B165F5
	for <lists+freedreno@lfdr.de>; Wed, 30 Jul 2025 20:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23AF10E222;
	Wed, 30 Jul 2025 18:04:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="p9IMoYYt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1266F10E222
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 18:04:51 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbVcP007263
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 18:04:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=I/8jBayyhvVLDAZPoDLRfHEl
 UvAYchL2u6ScDXnQkcQ=; b=p9IMoYYtbltFngmzBsxUuR//FzXgU6tAT0ENf7n9
 RMdxhSr+BHgJ6wfkZjLrkqZ41ENbDxo6AFcwcAXHb/18bDTKHsm2Mz5po1ry2zRN
 yItzjGckbaVR20805iPqgwoaFQDa+SbQn8Ms+ja3u1GxrIBRERUr9gMcQnh/I2te
 LIWAaYDGhBPZx+ee1U965UNkOrwbpxskiwVzi2E3ViDdM6vCLeB4WywwwB/OrgK2
 YjdgId6OzlrxwhosEdxmy/bxHzHr1jeyBOou7kkMCSi2OOJnOZx32uEhyj2TKoHh
 ehcnv7bnTpITx83ryUudM5Zw10g96LKDGS/OZUClemzYSw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 485v1xj8y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 18:04:50 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7e269587d8eso16100285a.3
 for <freedreno@lists.freedesktop.org>; Wed, 30 Jul 2025 11:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753898689; x=1754503489;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I/8jBayyhvVLDAZPoDLRfHElUvAYchL2u6ScDXnQkcQ=;
 b=KCxRa7Nn+4C1vJqTcbupaYgbmDvcKs1WMNw4DwBY8QXzwNtGiqm4j2uLA264sJUNRz
 AE56vu3+VSb3eyiswsS0eFDmzRTQdflX/VqS0pzmTwTXTscPVnhYXFu2cZyl0iExEDc4
 RXP+llORTS7G6w7OGlHE9NYGLQnP48JyFvCx5rQ3OAd31z9mSTZq3ITT/l1kzC+eysqS
 pwAvOiMybBtFEq771RVBBx+wS4kwyfFFpSY3hSRKtNf4RB61g77uKjXmTAtugR2lS8RN
 7iXq3YlhADrKv4FtTQ3KxLf1do6qa7G2Gs5nN95yxHqp4bQVNjku4HCCtFYgMrm/7lp6
 GcuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJICZKFp7Etwlt8S9igD9VF3SkaPIiQvx1AXsP+Ie7aQ5/LYxzKxjFf7qBsBYmJs2nfAYCY3hgNE0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWxg5HbXxCoMuQyb8u0bKdEQJF15fbgufMuIX+LFL4mHbYm5ZA
 w9Y5pk2Obcoo+eGU/lbl3jAdpAXxE52/pjyeEuZ+DYZyokYk0VLi7hq7e2wEfWMioNGxKI0Fieh
 UovNCV8xjdWEfrmT2SXTeE7AOgbxuArzYDbrCoGSV/h0uXe5ah6NXAMmgPwoxYa3GxPsDBfk=
X-Gm-Gg: ASbGncs23HaAlmqL6UVLcJ4oHl92KuPfJcwhoxKkfBCdZhtap81gciI8SHovFhK2Sw2
 nMM8zYCVuQ/0p0DRDf/F2bh925mNf+HXr/QeKoUPiGeaSVfQ4XrW9OdqXz31m29R7TNavMUCRT/
 kZxCd/o41/mqTKF3ukAOPzb8yePpLUlBwmnUjneBzhjev6GYl2UayXQ3Wl9U4kiA00c/2KLrCu7
 HIOdLxozn5RYp08TcSRLxJLB8aHGgwAzK8a9bkMB9Mk2Qb0nIKGO3hbFnmcvvbaU08JasQ2v+Sb
 2rTHCKE7A0GxomdClwDdsZOheXa83vP1ywlJkHuavh2VwsFADlG9490Fa82udCQ9F4G/9RV2Ios
 YlQJI1JkCwl8vpagomnUSOlzFm0+QbhqV0byHZ7Y+haSijWTImXMD
X-Received: by 2002:a05:620a:3954:b0:7e3:3288:8ec3 with SMTP id
 af79cd13be357-7e66f356727mr495183885a.32.1753898688691; 
 Wed, 30 Jul 2025 11:04:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkOwzT89t02FAAwhQoy8CKlO1y04DetSnNnh59BpmdEzw5MvIIAzdTos7aUbXT9mMSFhlv6A==
X-Received: by 2002:a05:620a:3954:b0:7e3:3288:8ec3 with SMTP id
 af79cd13be357-7e66f356727mr495176085a.32.1753898688034; 
 Wed, 30 Jul 2025 11:04:48 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55b6316d9bbsm2237982e87.9.2025.07.30.11.04.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jul 2025 11:04:47 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:04:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
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
Subject: Re: [PATCH v5 2/5] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
Message-ID: <yhgdibfxtv3w7t7strxd2ywy7gustrff5tbjtlpeh34m2bkhkm@xosfinmgbkui>
References: <20250730-mdssdt_qcs8300-v5-0-bc8ea35bbed6@quicinc.com>
 <20250730-mdssdt_qcs8300-v5-2-bc8ea35bbed6@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-mdssdt_qcs8300-v5-2-bc8ea35bbed6@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEzMSBTYWx0ZWRfX5JJUtN+UhnLT
 UKQbf0vWe04EZOqJyYCl1OGqI3eR1iIYoq08NH1WOXkbof2FNt6xrCeiJ/mc9R/LTzaGY1om9QH
 FOkMmdcxAnD5sWRvpJzQdxEki/uA9q0lpt6oWn9Pxl5WeoIhsZBzJMIzcZymjHFHwWVaUVJXyIk
 cVIuLWXDdfK+y11o/eTTIyKoMJlmcS4sbajQd+sV7SGdwUcr4IigVNQwJFbIemJwcD6Em1TpUL0
 6Cja+hpp9gRSMdlTPnQnbySrRPMBRJVxBi2MDI1hVkASljscL3kbJMrK26j+69AHWpt+U1mkqGn
 t50bwCFrML+NFHSOB5ZGbAi/tjWQ4YwYxVHD8tKUHIyAhyBOAPAsMh2wuA/p4Ehn+2EcEeVfCG9
 5cgz2YWM+HaEgAre3i4CMsmqkeAyKPIOFw8pEHQBxinIS2716LHJACx6QRX9FQjSzFoxRBZu
X-Authority-Analysis: v=2.4 cv=JKw7s9Kb c=1 sm=1 tr=0 ts=688a5ec2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=WvbujaHHVq_kfgFs6tQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: G8yBT9qnE5Ep_c5NjwwrClf5Q_Io2OVr
X-Proofpoint-GUID: G8yBT9qnE5Ep_c5NjwwrClf5Q_Io2OVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507300131
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

On Wed, Jul 30, 2025 at 05:42:27PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC, which uses the same DPU as the SA8775P. While
> DP0 supports 4 MST streams, DP1 has been removed at the silicon level,
> so SA8775P/SM8650 cannot be used as fallback compatibles.

"It uses the same DPU as SA8775P, but we can not use SA8775P's DP
compatible". There is some logic issue there. Please rewrite to speak
only about DP.

Moreover, removing of DP1 should not affect DP0 being compatible or
incompatible with other platforms.

> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 2893f097df826a5f941fbb754fb4a96a1e410a70..f5930f29c91ec95e9182c7b8ee83c0549c6657cc 100644
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
> @@ -186,6 +187,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,qcs8300-dp
>                - qcom,sa8775p-dp
>                - qcom,sc7280-dp
>                - qcom,sc8180x-dp
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
