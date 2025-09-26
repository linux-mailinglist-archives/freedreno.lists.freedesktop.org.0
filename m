Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115ADBA5536
	for <lists+freedreno@lfdr.de>; Sat, 27 Sep 2025 00:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B17C10E31B;
	Fri, 26 Sep 2025 22:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cog++oYc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2C810E0FA
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 22:28:49 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58QEXO12016868
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 22:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=MRd4LCd4GH7g/51mFAw6JfnX
 VcEmlPTkPoanPe5h3Qs=; b=Cog++oYctCGSML4DQ9CepK3CbQKraJJREoPOW7L+
 P6nlebop8i2Gg+Z7NpvB9XoecTqbAR4SNPm07NSxFoMdIxzCl7TJ+LIekC7v1bZQ
 C7Xn3fy9Aol3FlBf49Rs2fcDIGMvXtoZslAd/y2ozIHeVkrUJQQac8+lDKktKw++
 VRgw0L96p3NZ9wm67DkAwhXpMmfIFbFaymnDt2BKk1Ke1K6YJC+1oP+J5sADDrth
 dVm+1s1mNdaQ8FvyqhV9/GwKiSQQoIqsRoIHAedZWFbOTgsX980W620J7wlezL1C
 RrXFAidsptbUW0z0H2hTj3ssLTq/IiejHp3vTDA/zZjEOQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0tvac4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 22:28:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4d9a3ca3ec8so49644391cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 15:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758925728; x=1759530528;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MRd4LCd4GH7g/51mFAw6JfnXVcEmlPTkPoanPe5h3Qs=;
 b=ZNIeJ1iV1QrPn+uYMX/C6rql7EbmIeT4WuERjead5MlkH1cCy1j9gPsVyiVBF25Kf4
 rPtEc3U6EbXt/n54aKQI8DdcprFyTTzs+yOnwUSElvGoyY8+wVFqGSMUMJXK1e5zpdpY
 xH0L3UbhHTdZc1m4aUS/Ekty6X4a4629XQmHfw2/6eQvecCg5aRdcH+f4gLRUnl/Ogaq
 +fsLt13k9R2C/lILvatY+pyC6fNsxuvbQ7hvXQKUc1n8HgQx27xvAJ8zWjxgSgU8Goew
 Si2kKrvs29TVSoNoIcRx0prUEwVOygZJHXU39zlpX+tdQ/1o/imtgsvGGRly10dDbPr+
 eyOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB7hwgU6462iysCZJSAELqmt1pGAKR0Mo9uXZXPjms/HA0jLIdBAx156/iC0Yft4UklBfYxn/dn40=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxnNIMcmRUH2h45IgewWeKN3Fn+N3M616tbaTjJMK/ZKO4dLnI8
 RzF4I9L8/Z8fFv/YTz/OYnpj/gEIr2j+vLsPLLP9Z4g/yCenicDbjUqzZT7OTnSd9AdVH7GhRBc
 9NqIR+mapEimRklpeo9k5tMbbn77oCg97kqbVX786POSRk7zgUxlQHLpZJ3vSSprcKGy/qD0=
X-Gm-Gg: ASbGncvwXIZb7MdtYHsFfeYVRCR2zgsQjc841omtmTMF2SHdIovlc0/OYp4rkiwrgmx
 63gbh4vTtMVA8Qn+eIrANVj9VXgySaGxUH47KDK2Pddb5UJc7KKZnhGYkBwlVXalJfNq7+y88qo
 F+VlZ85iAAHDDiQCNkeJU84GONxzn9Izc/3VNdN32ph497qFuarbfvpkiu+KvjapGuQ1z5gRPpF
 wCJVkthCLA0ow8uYVBO5WDMt3WeHtzt13zevrIxPRWGofYpAkHFBaawIuN2X2W+iAQvX1dr/sm7
 2K7i5/TLdTN9D2MjcOXHInO4PkkKDQ8KsY5lJawl2C+EwN9jbJJQtBOZ2woHbqGe7XKHwqr/sID
 3+wqOzGi6gIzyL1sSJGFWizGuZwLfLO4Pd+ZPvVMq/cCaBGzrPj4G
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id
 d75a77b69052e-4dae3c29955mr91598121cf.59.1758925728012; 
 Fri, 26 Sep 2025 15:28:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECT+nuGAx7AybGioU3MTy0w4rerMEkx4bs7/aNnHMDuso1+UFEquoAeyhJO8yc6dvhGeykNw==
X-Received: by 2002:a05:622a:a956:10b0:4b4:8dfb:33c3 with SMTP id
 d75a77b69052e-4dae3c29955mr91597971cf.59.1758925727541; 
 Fri, 26 Sep 2025 15:28:47 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58313430dd5sm2149171e87.24.2025.09.26.15.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Sep 2025 15:28:45 -0700 (PDT)
Date: Sat, 27 Sep 2025 01:28:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v7 12/14] phy: qcom: qmp-usbc: Add QCS615 USB/DP PHY
 config and DP mode support
Message-ID: <yuklvnhgq3q5ddeakv3pmt4iq7jaw6csccpzamxfgcdcwguy5g@t5or6bzrwwoc>
References: <20250926-add-displayport-support-for-qcs615-platform-v7-0-dc5edaac6c2b@oss.qualcomm.com>
 <20250926-add-displayport-support-for-qcs615-platform-v7-12-dc5edaac6c2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250926-add-displayport-support-for-qcs615-platform-v7-12-dc5edaac6c2b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I9Vohdgg c=1 sm=1 tr=0 ts=68d713a0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=hsSiBWVQevx2fRdbtS8A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: sXRtxnqP5wNM0KvrUkQctKN3QNU0bFCW
X-Proofpoint-ORIG-GUID: sXRtxnqP5wNM0KvrUkQctKN3QNU0bFCW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX+0g6Z04ffaXs
 GjGnbv1bgSTzuBY9SU+HYMnriBJZYuGezGM9c1S6bH35TmqSNhEseTgi8L/2ZjZ4iE222vGUIZK
 8b31d196J8F7NkrUURrC8M2388X+mNS3j5Cxg4N+Qa2cIG3K+NHKSIddqeqHjI+kTbZJjSZDrN1
 GV4+7vTmIIql6MVJKPoQCO4cFjgDMvsEtbvlNmYH+5TFdmDtG9YaUZGNkzST/+zgajWQ+Bu3U3C
 mVPQiXYUjUYbI+yt5t7dq4veubE7YKRpIUYXnIwezMJh/qAbUj7+NKk4oXnENMTIJ8FRWHKw245
 AdrR60sjdDckKqzOZRhHjZPjbndHsPHcNW/JjNFfhCigfDFoe9FBT/fjbMi4PZKkzsqZPDirnE3
 2VhIjzLtshE3YEuH023+R5NpcpYwxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_08,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On Fri, Sep 26, 2025 at 03:25:48PM +0800, Xiangxu Yin wrote:
> Add QCS615-specific configuration for USB/DP PHY, including DP init
> routines, voltage swing tables, and platform data. Add compatible
> "qcs615-qmp-usb3-dp-phy".
> 
> Note: SW_PORTSELECT handling for orientation flip is not implemented
> due to QCS615 fixed-orientation design and non-standard lane mapping.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 413 +++++++++++++++++++++++++++++++
>  1 file changed, 413 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
