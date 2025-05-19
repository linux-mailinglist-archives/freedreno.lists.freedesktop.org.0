Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16785ABBBA8
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 12:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C18B10E3CF;
	Mon, 19 May 2025 10:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZM0tL4dc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52F3D10E3F1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:59:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dkfi002941
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:59:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=ZM0tL4dceR9ZCazG
 sqyUNVptegjhUqnFXtVaK7AwTemiMq+jJw+hd/XdGG0puVGEWs1zMuzPD3ev6BEx
 rNhnRh2j2Fo2r2aLqlVHHU3jsC2WNTDQeJUh9m2RKioDejVLpC7UKoZHKtA9N7SS
 KLRt1qH30eHLUloaKE+FbvolX6Wd508DVmPkjqWveb+Cxf5ocZGat0B4lM8imiav
 1mJ+L9tdn7qbaZcnvsyaR9dMOFSH+y5dpjTpJh6fofFzyLdyvCEw428UfabjSBUU
 KQ+gwoSwxDMQCNjP12/IJP2f7KpF7QLYuFMEBJAzfsj6VnJ2TBRYffQZVdRBvjYw
 xfkTQw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgdrm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 10:59:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8df69db27so7024376d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 03:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747652340; x=1748257140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
 b=ueniVx2BD03bu+txta/KGZsUCD02OeHL6WixElhXC/xhMkX/xOjAr+Tcna1BlKLniT
 GwHfin9JWwU1IE515aIAVV5SOfVbrjPupfXvjwddftuV4tkDjwDoS4/J5VC95cuC6pPP
 CJ1a3dhUCg4a466sviff71wowZtJIQ01nB82tWMWgHySksWVxz/wM+LurZUzTsjDbKrV
 zA0PsVcb+GB4zb69PzI+5rgUA+n5f9V1xrz+R3EIT0CeuhrOkj5RNtgEXWJe+Quv0YWZ
 VRvN3pK8y6/Pr9PDQJQxkKzX7UA3kxhE7NS7rHvg1A5gqaDffmeGPLNxfdHmXj9dH9mv
 agMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzacPY4uk70RbnA6OcQsOhrLU5EoiunLi1vyezCSbbRPxwn3cudsSlcB0K47kY9zO7dSKv6OmO0BQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzujv+PvkT+CWx8EPBL1DeVXIAa10h8i7RADcjl7avE5dTouj2c
 s4TXuUbXRdrj5VjCTmtFinYqvSS5v13hYF4fNo+sVjUaRDUVfbak9DPVsOZWkf4naneVQmppjO8
 8rUmG/4xsKXWAqnUP76Pk7UYhHatjW7hsvWiZ/8HUXtcqJBgx388ePhRzOg5GMQV31IQs2KM=
X-Gm-Gg: ASbGncsUeHHyD9i9Opzak7KNGH+Y+qzZgR33i8i63/0s6XZxcmliTuJaBS/jARHs4Jb
 96av7SYSSA8VTadNfY3eCPZIGHNkIfEzLorm7FB1iCdpOyMjnMKxaDhkwRsURxUasUghcXLuj8O
 j2d/OlvDe+UtLCm4UJt+9X0KwjCro6g/aSv21vVf6HB8bXwwhLlYBVMhw/jipx8+RwaH8HLge+Q
 Vfun2WviPIa0TYpaJBNErgGJQXxKBFR/VX1+eX+olCB6PSniEculFYCPBqEZYSOAHzT2jogcoMd
 Faui3VnvTgmiVK5GPf561tPXXO/23fDtCCt3hsS7u8S0aD0IeC6hgWalE/pNj+GR96VbL/0qZir
 MpuBg1piL5wyaO+ZJH/aF5SZ5
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id
 6a1803df08f44-6f8b2b4c46fmr199871566d6.0.1747652340181; 
 Mon, 19 May 2025 03:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk/hpb7Fq8p+Ry8/zX3FWlj3myX25sykGI8jSsQ75/MuBj4A+SB9ODTHYvgX68XGn+AB8INA==
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id
 6a1803df08f44-6f8b2b4c46fmr199871226d6.0.1747652339748; 
 Mon, 19 May 2025 03:58:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 03:58:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
 quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
 quic_jesszhan@quicinc.com
Subject: Re: [PATCH v5 00/11] Add DSI display support for SA8775P target
Date: Mon, 19 May 2025 13:58:41 +0300
Message-Id: <174637445757.1385605.6744814496349716759.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b0ef4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 3dGRaJeQYRIY91TXm6Ra-cQMFQgMuv09
X-Proofpoint-GUID: 3dGRaJeQYRIY91TXm6Ra-cQMFQgMuv09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXwnyLMnwBbwyR
 nrnk6vgsBFavxVTEUDD8X0FLxK4JNyLB/hWDkR70sgWpmUYdADp2/eKA/PHCIznjYFN7rWSqtpV
 bygu294J3W8vlpSgupy9hPYqdQqAnXPh/JSCr7Gu/67og4pg+OIrGm632IFw2LAhWui046xNWDD
 7vqLD8LHETPqsbFuMCniZimE9m2uT81ddn4iqtO7xiKJ4g2/BXE2xz8um781O2aiq5GGtHuDzGc
 FxUi/vSW+eFMncpicdGa/zVUlW7GUm6DMRcmCXoA0Bsfkx0bQEcRX1wcYMrVw/8nybUoEBNnHJn
 PIkeILeDD9MVLXHFa3sCTjkEQpyGM+7WOMwnsvtTGnJf9Wk4TfdtFnYqJOK6QtlU0I/nEOzoj5f
 X2eY9/rpdSq1vyMHFo00DpQE0aVe/ET+5VU4/8G45VSVe99r90YGTvNzFXQKeLv20N/IhV26
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=953
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104
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


On Thu, 24 Apr 2025 11:54:20 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[01/11] dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/850e13b65e3c
[02/11] dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a0195b94cbc
[03/11] dt-bindings: display: msm: document DSI controller and phy on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6f2524f4d5e
[04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3979192fac5
[05/11] drm/msm/dsi: add DSI support for SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/249a965c3759

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
