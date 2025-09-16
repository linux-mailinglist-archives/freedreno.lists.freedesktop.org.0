Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDBDB59362
	for <lists+freedreno@lfdr.de>; Tue, 16 Sep 2025 12:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A52010E798;
	Tue, 16 Sep 2025 10:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oD6gwrt7";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 327BE10E798
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 10:22:46 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58G3pujc018557
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 10:22:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dsUOBXT5fPZdjovhyA0wRCif
 VQsPU7vYwfY5SFsZzbo=; b=oD6gwrt7ciUJllEv81O9W7uKYMyG/zXIQnn6C1OG
 cY40DALBKYR5oWNLzLIHdoRJaoio5HW2upCbuR9IQaVQB6FBE07CA7AL7JWS0xIP
 5FZM/24W6bQB4b6Qccb53Nmw0JxexMzmBSafkcOKvXaDOwJseDpFNb38qrvAtvtl
 6B3VwIAyPmIlsTBQU9StRYXs2ZcZoOcYtRWBPQppRv2KFGTeYelqvMYlfkXxWYRk
 vHFjJ/n2f5+dikPZdYooBZyeoZHas2qU8HU8V32XCGtjy3TzzDejvsLEidZnpUoE
 2wa9JQKkrNqLjLeZZX4orM6xbOo6pkkD4zRsoWBEZTP8WA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496da9cvh1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 10:22:45 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4b62de0167aso135715791cf.0
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 03:22:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758018164; x=1758622964;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dsUOBXT5fPZdjovhyA0wRCifVQsPU7vYwfY5SFsZzbo=;
 b=uaDInATQ05uRz/wnHJcmrMpzlf7Mx2nW+hiE5uwgZl8RTzxzRgELOtoQW9hUv3XfDF
 BLlsKFaBaZl4Gt5ywusPSj2a+hhCUOO9DrgEU9nb/m7DP8mJjktrEmPpq91lleQLVXhQ
 xzCfpKEugI2Rqid4fLxZywlKFxKF1cC2VDHTDFECSSR3Kd92IE9EYgPL9PrAlu4V6hIs
 op1vJrWQnzEv08m6f0Gu4+l2SWMcnkAUs0MCODgx/wZsgn9TDHOn2/fbCaY4pMmj0fJX
 oOFA1tuvXEQItk3m4QlvbXG8+Cku2fG1MjoT8BiQi0/apThParqfLWRLxwTQWhcOeCCx
 4PYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTS1zSQr+ZUJFFRC+VSLFimUrPnFv8FJCDM9wS5gBxPTpWtguNo3x6t3LBSLGwfrYM+VbxWRoeVDM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyujxNGRKI7Qpej1BqSOikLR59q14o/1mILm+lTEUo7NWvqoyEJ
 yh4Cxpe5kPniQ4rOvEcoKKBTExhflPxIbumFBzaq7jUQbSGp2LcZNHcpEePxr4GnnhcGCMqD5oZ
 oCoPt70cOzliJcdGBlvbwyvUoS00BrruzmxmyHjRf2nbTt4aDog6ehIfK/MiCibqmwLGw+4I=
X-Gm-Gg: ASbGncsR7sJo3thgKAWrBMbKbIDSsLmSZLsPKgUgqm77psq6ThiHZW9y9oI+8x6U8iY
 /VnpFTI7vM1rDBqPVjw/rvTHJd1ypAdjlpfXWoMKd5rZ7087jTWlWKKRd9yeO4r7ovS4iBH4sp2
 1XXbyImwc8rGD50UYFvP9UWIqUx2ae0+fb9GEvZx4gKi+M6hvDr6alxxILdN8f5ScYM0PHAvTIU
 48H+oBpLyH1kK9wiGUmAtjG9YeVH/bMKa/Bmq60z+kf8Arb3NwSuxpOSZI+JQ+vxyevQ8EL3U8S
 i9JfiFeZt0l8WRZEWWHYZzaU6rmRu2bHo4y5XRvQf/+u7zN9ep9pxmCUPMeVgdgR40TZkbO2Y8X
 aA0mkmyBaiV5tBpu2NgClGy7PbL+0kZcF6Fe7hD2to+F70Exnp5CG
X-Received: by 2002:ac8:7d0f:0:b0:4ab:7f61:4339 with SMTP id
 d75a77b69052e-4b77d043018mr173775331cf.31.1758018163948; 
 Tue, 16 Sep 2025 03:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmt1N76y524zCMYAdzsEX4rsQJe+HhKzBcwZrhZwRUGHsN/sSmGe8IqeLhMm02zuV2vMtz1w==
X-Received: by 2002:ac8:7d0f:0:b0:4ab:7f61:4339 with SMTP id
 d75a77b69052e-4b77d043018mr173774961cf.31.1758018163402; 
 Tue, 16 Sep 2025 03:22:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e65a31cf5sm4237309e87.137.2025.09.16.03.22.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 03:22:42 -0700 (PDT)
Date: Tue, 16 Sep 2025 13:22:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
Message-ID: <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=M+5NKzws c=1 sm=1 tr=0 ts=68c93a75 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=hSxh5nLx1FgLBnIhuNEA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: osey18nAIKsQM6ziH3PZc9-3umvtgTrf
X-Proofpoint-ORIG-GUID: osey18nAIKsQM6ziH3PZc9-3umvtgTrf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NiBTYWx0ZWRfXyzsHZl5nn4uV
 46xAldGhoeEmCQm10Qwx35ivKzN75TwFr8jkS6bEeHnSHbVNuuQOCmIvANBGSqp6LO6da6YqK5X
 9+esyHIXHOoHa7HXt9ALOwROtxeJoQO5V6aedbdSIjbzNp/77tm58FG7hAxygiyF44hctHXN28Z
 /OiHCgqUXD8MBmu6MomfAOXI/p1fqcy9471eoKn53nZnP6tktVyO0MJuyUwBgOqjTGdAJ56WvFn
 7HOyyGKIJTnX2XrLhPakygtiCK42v1FFU80Abp/ESPER2GnkDh0M3903UD6oTyopTjLjsHLm1Zm
 oEG6b8Mv7GPZ0VrGn5EA1Qg9G1rBuUzZ2ziIBcJi1+yKxcY4Fygx6A3B+g04kvI7bK//JaBqNQ1
 9RuJ/m7V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509150056
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

On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
> for consistency with existing bindings and to ensure correct matching and
> future clarity.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
> This series splits the SM6150 dp-controller definition from the
> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
> 
> The devicetree modification for DisplayPort on SM6150 will be provided
> in a future patch.
> ---
> Changes in v2:
> - Update commit message and binding with fallback configuration. [Dmitry]
> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -46,6 +46,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,sar2130p-dp
> +              - qcom,sm6150-dp


In the review to the previos iteration I think I was a bit explicit:
"qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
agree to it. Now you didn't implemet that. Why?

>                - qcom,sm7150-dp
>                - qcom,sm8150-dp
>                - qcom,sm8250-dp
> 
> ---
> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
> 
> Best regards,
> -- 
> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
