Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 978EDB95C0F
	for <lists+freedreno@lfdr.de>; Tue, 23 Sep 2025 13:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F7A110E600;
	Tue, 23 Sep 2025 11:57:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XGiS6zrP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B3010E447
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:55:40 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58M7GPWJ029201
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B064ovUC9zRSjoxUhu48/j44RavwR26F+CFaXe00C2I=; b=XGiS6zrP4UeJuJ2D
 vb6MLe2HlJcyeGuKLxxoVEnAy+Ih85ct1tGcjc3qgLCI3l38a9ZWpys7K0GrOtYa
 MWzru86L96mIXLNGVfs8CACGiF6pzaZOBj4NTGLhjUwkFfw7lDdUtJZ232H6q/UJ
 aGxz9jvQ8bD1sZuUttyfhy5oV+X9/kWEV06mfnwg+BPpPyx3jrRZBhdKm8BIpwx4
 bJTQIBjdTdXY/FpWTsHcoSkqF+z7V1drVd/AzYONs87U2mxdn4bq4ntCZh6CO0Y7
 16xJlWQnDaEoQVq6WMX6k7GxME5aJlVZR4R5sgJeZ7C2jr9bz6MwDPRnM+LJWNkM
 rykXcg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hyemvxw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 11:55:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-797ab35807eso16541096d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Sep 2025 04:55:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758542139; x=1759146939;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B064ovUC9zRSjoxUhu48/j44RavwR26F+CFaXe00C2I=;
 b=dzavYxXy6fCTKTCopUDTOxmboMJ0QrrNBu0I+sn9xc/m2sZ5+TjkOBZHuPfa/A6A35
 Q1AE4I+USR2hjfpjfy2+FGe3ZbZuJl4twnhQmwUoaPWS0rqAQZC6IhDdB44Nw1YxT42O
 +U20CGruEe3XNCfrQ5uWJz39wSM1+ylsBe2gR6QP1Wp1QeXYopR5EYUYXZZVf9DEDjnG
 f3YQAilH1ogG8xS5MMjI88rJSYQeTzMj3nVKG3U6+WQtVMiankeRmA4jP/oYzRsXCOmQ
 2+H5Aj8ZP1tytUEOMvnqi9gyI0nWCWfrRUwevGmRN+WYE1U4V1fLd/5YOSgjPCG4OV4p
 16Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeJvLLpSWvwIpSMfeR9Fad+avfx6yKe/xyxjXP2pUljnCS1FHgn1Zpx5pKDQ98/tBnzjP8cWwP6IY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp9iBIfy7cWawJJWOn4Im41FSB8Tl4BN5vPiqQvCgb6Ppy/yak
 PS5+Iwdi+PGMoskMM7U1ChKNUqCAvMLj1tpDdr5oQbgyayTv9OynCWnNaZP+YkF2gAUaBbs9KjW
 8OfXHjWone4wm3sh0MyHGMln1/tt+I6aiyzNB9+P+mTBBGypSMPA2ujjs3yG7++87SJspzrk=
X-Gm-Gg: ASbGncuCvU7zsH9nXZdS1EU2KCFAGW/lGqN303Tal1ZE9QBLas5ZyGNFg/dgejk5IcD
 XPilYGm7wc2mlZAWA1nb6HohHcnq6lqdBlf47lrk/Xoer9T/JrLjMlE6NKcwCcl8xFFCK8GWLGz
 fgZpaWqoR6JpQxZgwj2B5LP8XCicpgRxdP/iKW8VMZB9lT85Pd7HTaJbLy5gXmUUDF+YGPh/+2r
 I52IgBMmgveoXdhrzJAgK/DQgQRJn4TRwr2xspWTLk9NK9CrZkXJB5roIhZN3Nn0jipECd3LAqN
 y140YeY+c3Yy0+uxJiHeR/Q9oG+8jEiUfpfkdn76vvyHcKeWZ12nXqJG/hOwCorYZpY=
X-Received: by 2002:a05:6214:d66:b0:78d:ae5d:961e with SMTP id
 6a1803df08f44-7991aee9f65mr144999656d6.44.1758542138772; 
 Mon, 22 Sep 2025 04:55:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrx2lQ8bUfjHVQDGTjtp+MxJxXk7lSkdCbj3n4NA6HStBZYgiH6151jpAgDfcIO+25QIVapQ==
X-Received: by 2002:a05:6214:d66:b0:78d:ae5d:961e with SMTP id
 6a1803df08f44-7991aee9f65mr144999136d6.44.1758542138177; 
 Mon, 22 Sep 2025 04:55:38 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-3ee0fbd5d65sm19081222f8f.46.2025.09.22.04.55.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Sep 2025 04:55:37 -0700 (PDT)
Message-ID: <8ff537c9-efa0-4aeb-987d-150bef8b7c00@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 12:55:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7bpJywBsUKWRlRTpvacw0a8wFBvVHrth
X-Authority-Analysis: v=2.4 cv=YMOfyQGx c=1 sm=1 tr=0 ts=68d1393c cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=NhMKqwY3GOx2pceMi_EA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwNCBTYWx0ZWRfX7QeUM1tRMCOi
 duSG2p+d/nvIxMcmHMKbubD7fECA1IAn+HWPqhJdx5c6HjJ60D2RvhuQ3c9k3fDChzMtq/MF+XR
 OREJSzH8DwMROZpuA1v4NRZBkTgzDsaFheXBtMQvXtEXc0ypzR66zCs4Z06iqaX8BeLCkbRuTgp
 EjL6vLkZjF1YKnAVktNGl3bDXZxlrAEYe2+qCW2ZvcLEtkEq6bptActvj2cGFXJjBIQW0+Pdc4E
 1ZDZF1OwWZRs5DW69JggWDuOTO+WNIAZOFLg+wPhFlB9UBZOBTIVbJjqUIaE54vWx33G67S/i0g
 iDTvnmmz8MpWdZgUpGBdrIKrZK4A+itQHY7Y23U+NddB5bdQ2uBjOYsJ3IeiYy9VQQ8TF0kifUY
 HP4lFu/O
X-Proofpoint-ORIG-GUID: 7bpJywBsUKWRlRTpvacw0a8wFBvVHrth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200004
X-Mailman-Approved-At: Tue, 23 Sep 2025 11:57:16 +0000
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

Hi Bjorn,

On 9/10/25 12:25 PM, Akhil P Oommen wrote:
> Document compatible string for the QFPROM on Lemans platform.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

In case you plan to pick this up.


Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini

>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -39,6 +39,7 @@ properties:
>            - qcom,qcs404-qfprom
>            - qcom,qcs615-qfprom
>            - qcom,qcs8300-qfprom
> +          - qcom,sa8775p-qfprom 
>            - qcom,sar2130p-qfprom
>            - qcom,sc7180-qfprom
>            - qcom,sc7280-qfprom
> 

