Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CD9A33391
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 00:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6322610E2DA;
	Wed, 12 Feb 2025 23:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYnMGUNl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0907010E280
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 23:42:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CL8NTK014045
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 23:42:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KSm1Wh4boltPJscGteudVGzud4m6a9zHZcX6TdAxYAk=; b=bYnMGUNlpjFydcu+
 hSacCR2pty43ivLXkV+zJn8PIspcR0a1msqiNfwdkFffTmjqlxnVBOGLefV7DhQH
 dq5WmRCyebm7ZGE0/74t/AeRwZYy7MHQPRwEvqnooV/KW9IG6FRa+3D2OHpoteMg
 evg36haJt9JVFCLQDHHMG8e52stqvWgcVjgSv8y5gWAP8pempl0x5Xs6CqGg4Zf+
 YwZDN4s3zMoD/Pb3+xRn0WmTPub2MFoRS5DqXwb5qSGiB+n6XrysBTH8S4s12PIC
 1vJbt2kcC9c2w00lAOyZNZb6b4cnDlkjW4j8Wp35vslvqrl6Ejq9VZFwd6qKR3fv
 LNvyNQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44rsd7swv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 23:42:01 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-471bf97d78fso525771cf.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Feb 2025 15:42:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739403720; x=1740008520;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KSm1Wh4boltPJscGteudVGzud4m6a9zHZcX6TdAxYAk=;
 b=BJWC9TwHVDWH3XN1Y4UjAUrnXVVO49IK6Kh1Xsa/2d+QNky85ZOpj3CAHiu2dtqy6W
 Yfn/VUI2tJZ1FCdAId6jRd/RTbVjI8oPKMX/64UVyi7RtHjbj5xNz93WDqjF3mVpBBwL
 hUcZXVIXSvNC5UGQNoK+5ekFgluTfHFNgNIcryrF5Apk5ssH6+0DnL7TKjEvSMvu8wo7
 MvvDxYjxy0cXedxKXv24vTocL8V+9IkzHNR0gePaXaB2Q/Zz7AnA5Le22njAbbDQ6nk1
 rQwQB9/717p6vFxnQ17E1BMYPrSFgKeaMiVPmX4iuEWvoKAqB+LOIpw9+G2MtiWHf8PL
 RzOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ5COs/zC8Dx+6kxZ5Ybx/v/yBVqwfNHGYl0utVs/OZ0HTGDyvq0FUinxQ1Vs4SroFzCsBl/afQnI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzgb3aXgXNejegl3Auc0D/1tnqVngzw6mxeBq/uzZoMh4Nr9Fa+
 5Bm/84x5fxgwqTRmCU2HeDXBq6jvQgoBnUAF/OANBiksE2bQrOrwIGqEIC6jUQtyoEnuCH8+B1g
 bDK5U5KtDoOHPVWAPwLyfu8o+PdKISo4wIoAfutVY07ZZc6Sk0Z2g9WtziRHfZYgIM5Q=
X-Gm-Gg: ASbGncu4tzg6uJUGW22WBTgQss6RQrJEeCbumofRTxIkpXltUKX1iEQiW9Wn4cH0B27
 BfLY70naTlqalBwK0siuh8O3DrFgH9VzuaiJ99VIjRZltdgbG39hnRNgIpoUuuPKuDStm7qgIfK
 PAmR4BOMf06XDFOVSUZyuZ1q38OEpYzcxbcm/LuHxK1Kqw26vIdk8NQCrfFEeY6iCblA6WcPj8V
 rUb1bjAlx6sXwD4xa7UrMADseqHpxch7ixiT5jceJzX63gyBDJDT7F2CvH+nA7WoLs2gP8VHW4v
 pXmkuYETC7bjkwxF0ZLQyBquTrVVsrv0bNO4gi+phQMwv69CiNQ5MvrrtuQ=
X-Received: by 2002:ad4:452a:0:b0:6e6:5d69:ec2f with SMTP id
 6a1803df08f44-6e65d69ecbdmr1695386d6.8.1739403720085; 
 Wed, 12 Feb 2025 15:42:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCEcBxmtmcHlTzFNoW46Xr2T8lcEbl+S4lmcASGxCetdh2aIQm3gF77JovXY1V0uJjnJAe8w==
X-Received: by 2002:ad4:452a:0:b0:6e6:5d69:ec2f with SMTP id
 6a1803df08f44-6e65d69ecbdmr1695246d6.8.1739403719675; 
 Wed, 12 Feb 2025 15:41:59 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53376769sm13987766b.96.2025.02.12.15.41.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2025 15:41:59 -0800 (PST)
Message-ID: <9c188b0a-5137-4f8d-b8c7-2eb31c5b8424@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 00:41:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: qcs8300: Add support for stream 1
 clk for DP MST
To: Yongxing Mou <quic_yongmou@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250212-mst_qcs8300-v1-4-38a8aa08394b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Esy_Si-Sq7DQNUpyMDEA-WMPCZIWpGXY
X-Proofpoint-GUID: Esy_Si-Sq7DQNUpyMDEA-WMPCZIWpGXY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 mlxlogscore=755 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502120167
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

On 12.02.2025 8:12 AM, Yongxing Mou wrote:
> Add 2 streams MST support for qcs8300. Compatile with qcs8300 dp
> controller driver and populate the stream clock for qcs8300 DP0
> controller in MST mode.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---

Please add all required resources for quad-MST operation

Konrad
