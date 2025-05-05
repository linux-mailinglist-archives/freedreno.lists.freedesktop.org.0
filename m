Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314EAA95BE
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 16:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EF710E3FA;
	Mon,  5 May 2025 14:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UR96SL6e";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD59F10E3FA
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 14:26:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545C6jaM008231
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 14:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=; b=UR96SL6e5gPFzkXA
 odKlmcPqeKK41JVxUf82jk//dsmtkYSa5HknVSNgzHAOjwsMkfXcZLC87mqYYI7b
 fKFwJhpAWdHtpEWLgBXi+6uSOYndtTRgIvYSR/MNzvDmUYhC6EZkhWjchi4GXnul
 azXI2GoGYe8SpUEE3e1T8tuCeZahsR/vzglHnO+TcoJxQpax8BPjaQUkCO07zZsQ
 OQ3cdGKI1orl3EqwA+Mw9+a4nR+ZQhZ0vpspTeWdR5+CGl444OKWsaZQQS7LVpNS
 FRGFUJft8cqpRT2YQrGA1iDA9E2hGvBVjhPxJ3yJ4F+wp9kICXpUQJ1tsKyT3OuX
 0XSOIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfm6f1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 14:26:26 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c791987cf6so909047685a.0
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 07:26:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746455185; x=1747059985;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUuUX8bIcyPlPuoPDbT04z3jokr92aiRh0rQ0I5EFxU=;
 b=uinycPOqxKYiJRPjSz9+gJS0/bCri6BYSsocVm5+ud/aSQZwhPFEDCFbfZWCY8IEqP
 GIPG27wqoUARaLId1oGBK+z/NrBmqBxVDVFlRg9j/9/kSP492jM/olB1zNL29CoZubbW
 Vm8q7uHB595Zn9SdDBkL05tyF/MwZCn2tq0fQiYPNiRxUVNB6OMyjvCMs3fjnZl9cr4d
 2RXpoy1cHNRqTpYS6sJqr1cRBP10EnmUFpfseEzRrxOLV8eoEPDVjLuBRvUwC2SyURD+
 eiYlIBayA/7E0JNH0ndmpz+1i6ExAuVa2WKnNcXP534WuEJ4wCLYFKosvxE4X+BhOel8
 Q5pQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFlnusRfHpxLFJEngUF5g1ymf76ludDqvTx1Fl3RSWNRixnaVeScR8Ap7dzUe+I0Nj5aUCE+7+1Qc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZZc0oY8j1jRpc4fFYaKKlBhqOKf605FYfGZkog1RC6cVbyyeL
 zq1q1hF8sLGEdOOEUPRtl20UnCQZyzgBvq0SEo+znu5odAcTrfaTniz05qnKACc/pfmD8Y5tRhs
 +0W6AaZhUBPBW+ucF++xpt4hWU9NLGlZa9V8YgPp3FEJegjlXkTQCwUnEUJRq0/8iO6U=
X-Gm-Gg: ASbGncvRLIVD3ZRgfd3uItWyVu71WyuIiBYABpbguTWcjy6d4hDRuIU7K7y+S9BFlYJ
 Xen6sibCWFMTPsl1WmfW2idQgaWzNvzSPfhFEOlm7a5l0lggeprZMLS++7txolOS+ZkbSEsd3Xy
 rnwUh5HZ26TEK3ALfWR2oK2cMMzJ0JRfCct3OGyYWu8Z/gVd82Wmj3dnGwaQOCKqO5ElFVYsU2U
 ZpOPFNs+js25eZBMkbgPg04iUTRl7HnDRIC0ZWjvSO6hQewp+Lm/DpkMrv+0xRehpnkrqapA/oU
 EXwwyF8o+IELMWS6R3c1kGg7zPDOcYaz0N1pWZF+HrmVaqV5o+xd5Z0noehOSO5JiM0TaRpVaaZ
 PsjuPSVurQkY9G25ojtz4TmgR
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cae3af02b7mr1068082285a.43.1746455185089; 
 Mon, 05 May 2025 07:26:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH96RuYp8rf3yGAy4C3TKAyGKugvGUg3+4xADJwkHYt/kyUMmED6s/qSvsMF10QY2xjxR0J+g==
X-Received: by 2002:a05:620a:4711:b0:7c5:5768:40b9 with SMTP id
 af79cd13be357-7cae3af02b7mr1068079385a.43.1746455184728; 
 Mon, 05 May 2025 07:26:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f17fbsm1726765e87.170.2025.05.05.07.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 May 2025 07:26:24 -0700 (PDT)
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
Subject: Re: (subset) [PATCH v6 00/11] Add DSI display support for SA8775P
 target
Date: Mon,  5 May 2025 17:26:23 +0300
Message-Id: <174645517266.1455227.14417676448478997955.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
References: <20250505094245.2660750-1-quic_amakhija@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 161CBKP_HPKUECwKcs3G3tNMcXbkMw-U
X-Proofpoint-GUID: 161CBKP_HPKUECwKcs3G3tNMcXbkMw-U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzOCBTYWx0ZWRfXyk3HqzNHmaU6
 ZooBnhS+bSbXw5ZkvwIwy+IZ9ugPe9uPZ9wroqoWQecfqsRG/qPWeJrhzo5jw9VO1ulWbISu8GD
 RtHinEl6L9PPckyyLh+QmfDFVMGp9OOPPy7XhftYFwTTmqRAx1dOfNkWJp8w5gMWYhdfA8zDZlt
 9ct1h2cR2ZO1LHFOkjHnqq1fTLFUAJeHck5hRnS4K+aDtfjA6DsCIgm3qS+g8gYM85K7S1h/viB
 a4pgglJnpm168aAaI589CHY+DmlTi5DqjO3dUUOoVk+W5omW+x9SWvv4VEVfaSd18fAJdZk/2Bt
 MShLo9RVN2BIvDEK0/gxiOwjevRdHSqBH1Y7gQrE3NabOSWvngMKZyCt6IsNXoQLy9vw4tAJPyX
 gGOr+6ZqGs7qFZSUv90hA+r6GwogUSOJV9lc/vYHuM/lzwVjauryiuSgkbm8INDXwYZiG/oo
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6818ca92 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=-3-qUcdfqlWSZcId2SUA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050138
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


On Mon, 05 May 2025 15:12:39 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[08/11] drm/bridge: anx7625: enable HPD interrupts
        commit: ca8a78cdceb48ad3b753f836068611265840ef22
[09/11] drm/bridge: anx7625: fix drm_bridge ops flags to support hot-plugging
        commit: 71867e8d88fc7f94c2e47b3cfd676710c120cbe3
[10/11] drm/bridge: anx7625: fix anx7625_sink_detect() to return correct hpd status
        commit: 366ca0bcc953a4a8a9c9ce2133e6843730210049
[11/11] drm/bridge: anx7625: change the gpiod_set_value API
        commit: 50935044e58e563cdcfd556d62f27bc8744dd64e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
