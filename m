Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5071BB2D9E8
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 12:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2933D10E6E8;
	Wed, 20 Aug 2025 10:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="m04ZDh9m";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D53A10E6E8
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 10:18:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA64uu006121
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 10:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=RMmIf6OvZrK65C2lJ9Pmjnze
 nmAYNUQwMUXR7Q7PPco=; b=m04ZDh9m3eZZiWHDtRw+bhpEsiBl3XlWz+Yc9AOI
 gHgXA+fqa8B1WbSIincNp6cSJOpfOMfWNNeETEgTS9HKHuZRTzUmxmb/OzkyMP9k
 opd6Qz2SGN1A2t9iHN8DKTqa/T6mXIK/P6/mxC03PJ+R5fnmGQjP6fFgFenI1Gtj
 8IkAuR9N4dHdQX4tyyNg0SlWajKunB4eLhw609Cbvw50G0NqHdLEAmNQoluZ7aV7
 D6xVni2lWpctfrfXLiFV7woLvwdcFJRye/COQZjEuZhqtd7fFffcpMqxqLNt/0v1
 oZAzzT7VTEQLP7wPHJ9g5aWfB/0yyYq5TGfP3zqV9otVHQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291b8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 10:18:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4b109be41a1so276540081cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 03:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755685106; x=1756289906;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RMmIf6OvZrK65C2lJ9PmjnzenmAYNUQwMUXR7Q7PPco=;
 b=YgK4iJL+oNNboeAZJ936rcs0Oe3OM1GhPUMUECC5JtjJq1TZRsMHIpbgDDzTXRxif6
 l5Com7lU9nJH4ITPk3kBP9ncthrwDmkbWtKOe6z9ayN07KnduqnxLqwIQ3H1qsQ66aW+
 PDjfjQh+R+nq3l+3cJYHX1+ezNELA1ppz2WOtO6VxANbUwtJOq8rF6wYCv5Q0MBZzQWA
 8R2VP1mNVC3GAtwNXqxqLrjNSav4cJYkI5hpK40QFNEdq5v3J3AU140/5QkYfjkvkixF
 styFNvly1Y+ZIx+nfx+VYmF03o4wA5HubJEjeymaejRiKn5kS+79is5770JcwDLX9lK8
 gPlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8pyqbsGwNzC9U37Xov5QnKr9WQt0JMlrxMKYp/4OF3TO2Syi7iihC2jlh4lDdfmDS+gKusOOgOts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNmOfZwZfNVK09PSrwucoZHmC/UFuTgHLkXYQ3HJECyj14bYI5
 jVIARgZfOVr4kBMaLFyS3oxBkOMRtsJ4keqAHFPJTEZQ5uxKKktcziHsnIMctKAaesahf0Ah2gi
 X/0GQwixpDy4HQQVfdtn9ffATxo+xluwgLH9VtZa9KQokIb7FWl4Zrec4SPyGsw+G6qUCDYU=
X-Gm-Gg: ASbGnct/g9n6UnHK/qIFuXjpyWyseCe0u2+XAvkABJ3B9cbjoen6JvffGHSiDCzCuwg
 GE1NxPM7Q4RxpQ+Xd8UcrcM3sqX68seBjDwAqCvqYPVUHE22cpmWOezymlfIQMlHfhnaWEhzSpi
 npN2ucXSek/zsgBWGbF8TrTWd/CSl6ChYSiFSSh5l2JzrIZFmhAuqomq97Xuxs9nouAkknMFqY1
 G8mP57NRxgAptipZPeQt2B4IRXiapkAO8RBraqy60pRgDIyQErVQ8J578NtKJti6m095f/nV4ib
 9Ah1U5vqhQpK5vYB7MifKJNZF7cn9/7/j79+HYtd5Fle8XLws/oAd2ClsSXk0lh4BznAkmoaAI0
 jNfGd4WQ5tVvL4OdFCww2Jlk1CSLp8vkHkmgsyp+7g6MPMFrKMqa6
X-Received: by 2002:ac8:7c52:0:b0:4b0:677f:db03 with SMTP id
 d75a77b69052e-4b291a450cbmr19243011cf.15.1755685106419; 
 Wed, 20 Aug 2025 03:18:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2AOZHGENtzCbjXG8zdnjHcyu3nc3kzJVHOmLOa0gbBzdcDRDqks1SlZYpXJ4L372H7WS/sw==
X-Received: by 2002:ac8:7c52:0:b0:4b0:677f:db03 with SMTP id
 d75a77b69052e-4b291a450cbmr19242671cf.15.1755685105881; 
 Wed, 20 Aug 2025 03:18:25 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e02c31498sm623244e87.12.2025.08.20.03.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 03:18:25 -0700 (PDT)
Date: Wed, 20 Aug 2025 13:18:23 +0300
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
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 01/14] dt-bindings: display/msm: dp-controller: Add
 sm6150
Message-ID: <75ra2ofecqu6tid6kr4hnyuztpl6jjaq2ksyquafyajhq2sa4d@4tkggrdqky7y>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-1-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a5a0f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=6LesCdOPl9v1yPo426oA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: oH10OhgmpnH9nup423B_yyai5PEnrWK6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXyVfXQJccGouN
 uZ+3GqFAwUT/wYOqw/39mYqcrS6X1JuYDWx+Ilgp9WqaDv3WPGlanUk2qwcOdAODB1VKdY4kxCw
 Hhj3UtNdkQJ2QJPpVCpLKzUU2r4bys+4jI7+wSlpxL33ZazBbZBnfYIOTgJe779VseENF9IGFXs
 2uYpupa3uWbGcq4t9wDqoZgKhnbJYBnPHqHHZW1I68ntUDJLg5ix9p08WU3wrtBQ+4zJiGZr+ki
 0TmRu9XDJ0OVWOnUI0Uz6ob5KMW4AFUw9CgLaKypALefJNxwjXl8HBPzQVE2rulGwpBjPbOmhQh
 eOoLntD0uNhWteBe2O4TyFFup1RJLlVq4nvCHkPX4s/OvhQF7ozVWI6DSvV9VuSpLXIYkkBSG47
 I3z0ogP9rliRPOAIoEUgtMRahBsFKA==
X-Proofpoint-GUID: oH10OhgmpnH9nup423B_yyai5PEnrWK6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
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

On Wed, Aug 20, 2025 at 05:34:43PM +0800, Xiangxu Yin wrote:
> Add DisplayPort controller for Qualcomm SM6150 SoC.
> While SM6150 currently shares the same configuration as SC7180,
> its hardware capabilities differ. Explicitly listing it ensures clarity
> and avoids potential issues if SC7180 support evolves in the future.

I assume, it has no MST support. Am I right?

> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> index 9923b065323bbab99de5079b674a0317f3074373..996d0132e084d401db85014a1a4e445d00d62ed8 100644
> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
> @@ -27,6 +27,7 @@ properties:
>            - qcom,sc8280xp-dp
>            - qcom,sc8280xp-edp
>            - qcom,sdm845-dp
> +          - qcom,sm6150-dp
>            - qcom,sm8350-dp
>            - qcom,sm8650-dp
>        - items:
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
