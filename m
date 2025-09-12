Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA712B5487A
	for <lists+freedreno@lfdr.de>; Fri, 12 Sep 2025 11:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C1710EBF3;
	Fri, 12 Sep 2025 09:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QHzpERss";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFD0110EBF3
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 09:56:45 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fO85010914
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 09:56:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=OD9Udd7rbiexckZHIpahTYqB
 LCmCWRywICtA7wRkc1o=; b=QHzpERssArGdpxOQxFRxqzVwLfUS1u4bDarSxvg9
 e8jIYhrccYF7cecxuM0xPfW4v0nx8yrzK9OWVW57dfQgyvi2gMY6IvGw1DPxZfj8
 9MA05eP12GFFEe4N+yFUTnbPASptLC+grOZPNEhbM5mkOsIHcQbPVw/r6YZc5JhI
 XF7BGfqr6yghI1d+z9x9bXKUx/rUifwwBStb3cECb2UJb9D/4syH/gAB/lKvpEUT
 4X7Hn2D4viFh9INnrBXQPhkzG57ts9lJY3/zXxI36dFQicdshP3vAH4WwpCUURY/
 +YtFtceIBMW5bW6p9EZUuX50eUgVdySpPTPElq78/fMxGg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4max1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 09:56:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b345aff439so49481881cf.0
 for <freedreno@lists.freedesktop.org>; Fri, 12 Sep 2025 02:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757671004; x=1758275804;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OD9Udd7rbiexckZHIpahTYqBLCmCWRywICtA7wRkc1o=;
 b=sCIsOVF5iaKXTVM2oz3EZqGYVZJL4BgiZIz5TloOEN905oE0k1dU3pnOGlSPyjKKQd
 909Aul5AFBqSAVf6pSv4+LIkKiUWx1vCiPevwPi5OpGK1v2F2wg89hVk150e6727RlNA
 f5NaCI6w/J3m2o8UMHja4diAX2VKwBSGPoEY03cymFcM62mshAXRatFH4EgpRn6/bqFq
 Q733R/sDcg9aW4Pc+i6cEnfJkiLMQ4A2hWL02/H1WfMFkzdjWw6XToTU3fnMAT8GZ2dp
 G6vV31snUSMov8RI6TOQRY/AYYuQi9g6Mi7yNOLsfxcHheqKHBSNsDM5etxM6CCNDo9v
 poWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQjgkEheJ8V8cAEnrnpZ9u4C9ajBY5uHYrKDMo+kKdQQg+Ci8JWE8y8aqQAQXfqa7kew+1YnyNLcc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwnkjXUfpa2/Lqcu+WhfR4DBE3mfuVYxgqLScwpVMOquia20r1T
 GHUKnKgNf7flcnKj40UWTao0ynGiPcmpl/Mf6Volzw8rR1zKAko3NwRUFpW940wTnDtW8TjIiw1
 MxmjAQ3v1OYTrgjPPkWmfaFAZIW8o2OZAbtUPq0qYIUI9w6D0ME5C05jVvW/rrA9toassES0=
X-Gm-Gg: ASbGncuU46406Fd5laBsAYEuXOWfQevWHQHMRIy1bjmHWpXr5OBxYECfC9iIYSXZmHW
 g44Tm5goUe8kZar7bqrIP2C5QxhkKtavDqbrs1l6cFFua7oMvlq6eg1O+OFMyupx+9XzDIyHm7q
 Ds3vYJ/Oo7QZOhMlQ50U146z2Xp2XNl6ggXtUom7LHpIx5De322Yff2wJQRrUBGJ+P6uj846Euo
 5JV1iO/tJGoQvhFTl4VyLvzpG+1j3nx357XhAVnmyp2Rv60+rpEXy1xIe/pab2kyBMt7jmNKuLL
 y6kb1o0CXnMtiXSOyLrvjWFKnkZQAb19+7pYf0FGumEbYuGZPzeVMIohLa9aM3HIhhM7qQxa1Ng
 FtBIAihbfjiuoG3Ng/sZFVUblpDfF+RMuO1wZodNgLQgjqnbUMFgX
X-Received: by 2002:a05:622a:289:b0:4b3:f3b:6b14 with SMTP id
 d75a77b69052e-4b77d1d50b7mr29032731cf.79.1757671003817; 
 Fri, 12 Sep 2025 02:56:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrg+eZkUE6kJIyOVqREfUPXquzVktUgoDHxmRV3RNRm2kAXVXWPWukFFYePEL33rxXTVJhig==
X-Received: by 2002:a05:622a:289:b0:4b3:f3b:6b14 with SMTP id
 d75a77b69052e-4b77d1d50b7mr29032261cf.79.1757671003214; 
 Fri, 12 Sep 2025 02:56:43 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-56e63c63e3csm1057056e87.83.2025.09.12.02.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Sep 2025 02:56:42 -0700 (PDT)
Date: Fri, 12 Sep 2025 12:56:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v4 06/13] phy: qcom: qmp-usbc: Move reset config into PHY
 cfg
Message-ID: <ejwrkogssqdzxraacvxdbasxg2ud4t53rb6da2g4vdryyjuzoi@evdibveq7w46>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250911-add-displayport-support-for-qcs615-platform-v4-6-2702bdda14ed@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfXxQCHYoVRx9Xh
 DGDPCKEVWbf/Pkq65tZljIN58h8BAa/Au/3/dHdAPlbS4ml8plUggkdcAh1/kKwKOVSMYtYsxn+
 9NrnfOvha+eyM6iVOSQV+6XxabebUV+i40Fvv2LweupmG/f8JFjeyy/UvBcJtW478YSi1acFSkH
 EmoJVXGRX+skl4/Fn4mps1dvf1Gc5BgRqOKW3mE0iV+oFQvNcQHZTFTr/rQ23bw2Wl0pK1oWVtb
 L8ZJ7D4ejnMS9u0AKPHaLvoV1Cyujhv+oqnPre7/2GkgVO1VvCUsqUNP9Fl0qdcTB1mbtXV3pyY
 KN0P2nN3Hw2D5xQmGT8pwZJqFNIAuUjWBaaXuArFcDzmHujpD/PJ90IlGYYEECS1WZHqdG2+SNw
 vG8EKMDY
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c3ee5d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kgVMhnFeOIEbK27hWpcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KYSrAS_9brHeXPgZ9-f7j4kTxInbM0TE
X-Proofpoint-ORIG-GUID: KYSrAS_9brHeXPgZ9-f7j4kTxInbM0TE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_03,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038
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

On Thu, Sep 11, 2025 at 10:55:03PM +0800, Xiangxu Yin wrote:
> Move reset configuration to be managed via qmp_phy_cfg instead of
> hardcoded lists. This enables per-PHY customization and simplifies
> initialization logic for USB-only and USB/DP switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 56 ++++++++++++++++++--------------
>  1 file changed, 31 insertions(+), 25 deletions(-)
> 
> @@ -1147,11 +1159,6 @@ static int qmp_usbc_parse_dt_legacy(struct qmp_usbc *qmp, struct device_node *np
>  
>  	qmp->num_clks = ret;
>  
> -	ret = qmp_usbc_reset_init(qmp, usb3phy_legacy_reset_l,
> -				 ARRAY_SIZE(usb3phy_legacy_reset_l));

You can not do this, it will break compatibility with the historical
DTS. Legacy code should continue using the old list of resets.

> -	if (ret)
> -		return ret;
> -
>  	return 0;
>  }
>  

-- 
With best wishes
Dmitry
