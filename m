Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E4B8AF6E
	for <lists+freedreno@lfdr.de>; Fri, 19 Sep 2025 20:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9C5610E060;
	Fri, 19 Sep 2025 18:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/PK5xiK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9ED410EA6E
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:43:03 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58JF3MLU018235
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=iDUVT1j3d1+CSBXfFOTmyvH1
 fdhZ2PGbb9X8k35Q3Ls=; b=K/PK5xiKgRdHln+rXzsf7M3F+hfCe70jVbWY+97H
 vb8vd4bOKlTFixKmvI69F2HTXw9VGxrQBm46A6YdcUnOoU/SxCmibMOx3jPVlOdW
 EN443q8AcfUV/InJZoSJ279xcEKACXMiBb9dq946wlZRV3RynEUHF3+IQJgtNm5A
 xLR9ytZdCiRF2T8hgyeB9H1YY1+F1PO4SQYthEXMuZX0w58qwerZlXGec1hl44nC
 FkkhWac4GEz4e31yLaU+3N1wBViYWHKzovqtTJBvA/fVLo6XGJPLwLAi3qD+MNwq
 5+1T6yT6KtUTFgjiJg0XWSgIuHSLxemc+SaAdWnrcJdS7w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwkfhu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 18:43:03 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-78f6250f0cdso38970546d6.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Sep 2025 11:43:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758307382; x=1758912182;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iDUVT1j3d1+CSBXfFOTmyvH1fdhZ2PGbb9X8k35Q3Ls=;
 b=qz9Cw1ku6nOueWSWo/m0kuxdlVt+nW1Gv6i5dQhuEtWLRHxTl9To/RHF5Vc3h6G+D3
 uJsSU4RJqnpYHMBSV8sdRdeCPzO15DIVemyYSkyVUyteL5HemSMXgzOYLpEcUGFJUbS4
 36XmbVPqkJrn09KJfnAjihv5H7qLWv4Ky+mltmeWxvke7pSw6/kPHtUUaTK2Cl6j9j7M
 EN7qhX5/ceQRcZTvak1rrxoUAIE1H6j9Ps0IHRv4CH5IWar9nxx7QYfiP4e5aNcjWDab
 fpzmD4Ts3q2f6fr6bCGswKvhC7E9xjVsfKU6J2EXztPGLmGKVikXI2Gi0bdM5Jxsctn+
 bSXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMb8k6lfW4peH6s9wZoP8lc7cMudd0j03e7lNM5wZdXFzlq4siVyUhWG2FinB/XU2dkQuTKqd3G2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz79x6zMYIPjSLHM8Yma+1Z+/U3FxM3J7EhyPq8JtIIl/0Ck3L+
 u1IArnu8wPKHgB9rmuOQiXUW3JDx/aRgRYAJ/anUVP0+iJCpDHrNbLTmeu/2tfJKHK3i1Yxwbfo
 +GUA9n+6jLPf4gqJYIuO8dsI6meaAouB/UHx6/oqxL1OBGGyKqC8wW55H6i+KrU6H6fasRvc=
X-Gm-Gg: ASbGnctFf24ImZzxcSRtevk+vMe8/OxtP6eeYHV6e2rKMtGUTXwfROa/Ky0Id0WXQoX
 XbFkyqtJJ/NVQPFSO28mXU6WUWZbVdxmgQ2hvT57FY+jYvkitC2RFIUdG2vwecCMRD8MAvho6jc
 cHMYwB7fFxOfQY+SA8HzhFV8wgq7bTkRmmzzp7clL+Ze8/aHqbMfp+uL4Z1Mfl3AnYeog87xBBH
 8L8i75C7ymymSnC6u61bi8NANJ6RmOMLKshdrf2ot6BPmZIyxNaSqtuQITZCIN89vlwnBD6YhkL
 OLhrsB36soV/qV/RXzRN4KlpJoKiR+oQuyZXnCoWQaEBi+lx0cocmHrmme28ObIApUmNErl2fVM
 msn+ZplVbUdTXYAWNRxsWDEBLoqX3UW1LMcqFkRdLizgiC/7OXjwE
X-Received: by 2002:a05:6214:620d:b0:79e:88e2:1e60 with SMTP id
 6a1803df08f44-79e88f16526mr13039956d6.29.1758307381868; 
 Fri, 19 Sep 2025 11:43:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBKob9aSVicKYLHzXQPUikT9E64t9XkAJpeGDW6LHYdfXs9n7cQ4eZ9GnUtn4na0s2vbgtzw==
X-Received: by 2002:a05:6214:620d:b0:79e:88e2:1e60 with SMTP id
 6a1803df08f44-79e88f16526mr13039536d6.29.1758307381248; 
 Fri, 19 Sep 2025 11:43:01 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-578a5f447f3sm1549103e87.13.2025.09.19.11.43.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Sep 2025 11:43:00 -0700 (PDT)
Date: Fri, 19 Sep 2025 21:42:58 +0300
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
Subject: Re: [PATCH v5 09/14] phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP
 switchable Type-C PHYs
Message-ID: <zhqm6bqnlx3cu2rlv2wdhbhnuwc35jtia72tjotchyq3utla7x@45ws52wsii3w>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-9-eae6681f4002@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68cda437 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gZRqL4tbKlavufozYNMA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2YX46z4nY7pL
 C4RRwCjefpCiv2DHrZMaVOyeJJeEq1hETGZUAgTNEUQAdziSdrNtiGuP30ZzjyHMOfX7VpCEVzQ
 JUQLhbndDfGbjVGlEB4qRU+Zmq+Si21BAjlxOODRAsDZUHbHLQIagXEyTirZD9mJR0gl24n11A0
 hQd9Wy0zSFmYDRXK3ivrdko9GCMw39LabWg+InAPiNePmaihWHqs96Jgh3e19hI8tY0NQkV5T8W
 fJTXajZy3ncouxk+iiDvNEdiHKdOsRBnguZcvP4plnLbqPdFUChu3mAxEmspk/07T753Sgyv2dB
 rtzyRPty8HODgLQPfrrrvMMhQUOhiD5+OiWW2HMkDUGgp7Fasfd440Athvhgnr0JzlyiSqkgD/3
 Txrszg69
X-Proofpoint-GUID: l-4snaf0zvMv-MuCcBQJcn0N6Ow-R9tm
X-Proofpoint-ORIG-GUID: l-4snaf0zvMv-MuCcBQJcn0N6Ow-R9tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_02,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
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

On Fri, Sep 19, 2025 at 10:24:26PM +0800, Xiangxu Yin wrote:
> Define qmp_usbc_dp_phy_ops struct to support DP mode on USB/DP
> switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 194 ++++++++++++++++++++++++++++++-
>  1 file changed, 193 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
