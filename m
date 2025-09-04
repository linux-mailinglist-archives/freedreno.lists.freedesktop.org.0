Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 232E8B43D80
	for <lists+freedreno@lfdr.de>; Thu,  4 Sep 2025 15:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC55E10EA4D;
	Thu,  4 Sep 2025 13:43:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SfLBNwul";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AAD10EA69
 for <freedreno@lists.freedesktop.org>; Thu,  4 Sep 2025 13:43:57 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5849X7pj013476
 for <freedreno@lists.freedesktop.org>; Thu, 4 Sep 2025 13:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2glEwf25BhBn22EfU2RgmB2K
 pr+UPvjpjFbd0WLfYLk=; b=SfLBNwulePti93rH0/aneWsCdnYXKsLO6rjNRc3a
 l296k5oxt2aEN724wrVb3e3YyMKdw7rqbuEmEyaDn4kIitFBuv5DNIbjywYVoTOi
 o6Kt/Ev5RGQtuLn5rTcIoG3AJZCWWP9f/HSfWlu+TAI8xxTyaAKEdejbi17hNp7h
 dguK3cZNUKWyfbE58+O60e7x6ghUMes7H9Eg3Bj7iWx95qJ+eS9UkUnPa1g72+AD
 FyCh5Is+I5tB3OPZ0q1zQtbCtALUCL2ITkPlyLuvkslaOYnlkSjDvzQYRF2j4G8t
 xD6e8XawIvSEig2bPgVjks3vMZ1PyYNc+0gXlGIiSFJB0w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wybhww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 13:43:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b47b4d296eso21964071cf.1
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 06:43:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756993436; x=1757598236;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2glEwf25BhBn22EfU2RgmB2Kpr+UPvjpjFbd0WLfYLk=;
 b=lNiyfk0GcwDpNMVxFmTpxRZUMcOBAxKXDXNhMOfR9k+RatVgockisfgfELDUcZIbmN
 Q1vCewZOgmAaJW+GkhVt8qTRYr4yChQxDiDV7GAVvLM2x1qQ8e8/nNEzsATcK2BXE+D7
 5HSs6OYobmDdbOG7EKZoUGpjaRaoW70ooYQ8c2spefjhxg6MSgpDYdOJVJ5RHa2GwU9M
 gmfL1OVT4ki9DA3aGCuLHr6VhTDv+Ntx7+KMBvTEZPfF37wqodMLWbBfHVBomukDEC2N
 zJptJXoHJbki/51gl4+ybUGyQmWkaiSVQZtBLJ8cMX1Hz/BfcOWm62Y3EuNBY+9zSZvw
 qo8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFAfnbm2wXLl31TmpNbq3BppsWBX5EUgq/xFNhd6Vut28WIfy6eNlQR79NhMsROVWzSZhy+w9Ac54=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwrwPP+zAmphgdg/DmHOwjf+ucPKGxtu4XFqtfXnOTwlELx2b2r
 I0orD8SStRSgtp4aU49q644MtzqL53x3ivn2MoXTohmwsixb3KnSwubbYHvcFfHe9kvPfrbbM/g
 AZIlNZEj0I5UyHs7V/Sgno9LXBBHm9atSGBN8m9OzVN6sE5RzVqK0GnaCduWhgK1bVyY6dKs=
X-Gm-Gg: ASbGnctt8TGzmEWpCC7CN1qdSWfudk0aVVJ1l3oC3Fi5jrrrDvc9OAJCfHh54h2CdCM
 Hul3x7NOLWaIXjp48ib6iIZ2hOGUsQ2p8jLzFXn/HA2RPr4570T8uX0Mx6wop2hJtSPpTHNnfL0
 U3wtTVEC2M8C86YAVGxpX9vFGGmE2Ce3fvYJoJzdu5Uk/B9q58X35n9ZF/sH6rTy2H8QDRTNId4
 LsSsXV82cwRxWnB08QVE0TiziQfQFo59VD47sFEweGpDZuNn0h3juWvZSXgJa5w4BvimMz4Yggn
 fz6W8+fh8/Oqr1ATN9gsMeifHgXEGAB3B2yFwtxOMsWeMfUBTb7lyLklhUOhHIJz6EFrptxRV2R
 gzk1B09OmBbk3URtF5eewxtcQRaBs/eSSXbwSPTFSKOAzWPOjEbhG
X-Received: by 2002:a05:622a:8c9:b0:4b2:a8d9:8683 with SMTP id
 d75a77b69052e-4b31dcd66e8mr252982911cf.53.1756993435566; 
 Thu, 04 Sep 2025 06:43:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH390JIg6ufBo3mdh8M7wnVIbtdqeUgFOXqUz/fvQ0dn7b22yTZGY91BOUB7sk585pcqQx+eA==
X-Received: by 2002:a05:622a:8c9:b0:4b2:a8d9:8683 with SMTP id
 d75a77b69052e-4b31dcd66e8mr252982531cf.53.1756993434991; 
 Thu, 04 Sep 2025 06:43:54 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608ace81a7sm1199096e87.74.2025.09.04.06.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 06:43:54 -0700 (PDT)
Date: Thu, 4 Sep 2025 16:43:52 +0300
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
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller:
 document QCS8300 compatible
Message-ID: <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68b9979c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=EGIftIUl1-O6pfvt0j4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: D2WeF7TZIQ7KImkpx0kpflMSCtDYz15c
X-Proofpoint-ORIG-GUID: D2WeF7TZIQ7KImkpx0kpflMSCtDYz15c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfXy6vybMr3TkQQ
 3prgw1rAUL1WDMzQFuMbJnl9TwsJOly3dlnxQJ/5OUwmzFjA5J4oL5KRYU+iS/NI6EqBQ1IMSBz
 5iHDbb19IaXjDMOhO1IXvoRllMGA7guZpY9MxSHb0bZvThlHtcdv/QZgLRKYF4Xb/x1TgSxcnwo
 +xwSQhg7Rw8/ExxVes/pig4vIsWF7DoFEixsmEYldVXSHc5/1Lsh7dBk375aEqMQ9m0Nki/vSJH
 S4CFlEN7VGNWGjJQASglwCEvihFiV4GUXrKuIlrkAzEGgkRvAyZXVprfTYboO9oBdxCAN7IhSGv
 Yz45u8U5ShgYfI9Xz+3BE/H/6p7qhXDPeHAeqqi9T9Mesy6JoL4NG36XbP6Z52ufMgy7grKp6F7
 6//KwCZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101
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

On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm QCS8300 SoC.
> 
> The Qualcomm QCS8300 platform comes with one DisplayPort controller
> that supports 4 MST streams.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -18,6 +18,7 @@ properties:
>    compatible:
>      oneOf:
>        - enum:
> +          - qcom,qcs8300-dp

Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
new one?

>            - qcom,sa8775p-dp
>            - qcom,sc7180-dp
>            - qcom,sc7280-dp
> @@ -195,6 +196,7 @@ allOf:
>            compatible:
>              contains:
>                enum:
> +                - qcom,qcs8300-dp
>                  - qcom,sa8775p-dp
>                  - qcom,x1e80100-dp
>        then:
> @@ -295,6 +297,26 @@ allOf:
>            minItems: 6
>            maxItems: 8
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              # QCS8300 only has one DP controller that supports 4
> +              # streams MST.
> +              - qcom,qcs8300-dp
> +    then:
> +      properties:
> +        reg:
> +          minItems: 9
> +          maxItems: 9
> +        clocks:
> +          minItems: 8
> +          maxItems: 8
> +        clocks-names:
> +          minItems: 8
> +          maxItems: 8
> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
