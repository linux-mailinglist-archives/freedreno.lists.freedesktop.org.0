Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 368E0BC49B1
	for <lists+freedreno@lfdr.de>; Wed, 08 Oct 2025 13:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E2D110E0EE;
	Wed,  8 Oct 2025 11:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UProDiaF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DD610E0C2
 for <freedreno@lists.freedesktop.org>; Wed,  8 Oct 2025 11:46:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Twr028979
 for <freedreno@lists.freedesktop.org>; Wed, 8 Oct 2025 11:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=; b=UProDiaFd3+bNfr/
 JAMFmeTOf8+SkbvblGKTR06dC1qYCi72cCccPdz1X84A0oBNXWSbJ8NXXh02KB72
 WfE0bPkXgRm49IMMYEmrxBpBP+nVx6z3K2iO45mzz7Wwx+HukjK2twkuu8CIxbxw
 WTBE+B2H7tc839FrzveOhRa4zPiTRyyUbGlBqud1+orHif/6xN8ni/W5G0lZm5KT
 iPJ3GfxERsvCOkLRpg+Sp9XfAasDi0khKs3qMt1RI5Ihf6Oz+xK089HZffFb3er6
 qVOeaokX/617+OZxzQQ4C/tq7XTxpDaE/NiX0t7D/T5oLvwppVw3wlEzzeVVFp/N
 /D25Wg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49js9e2f5m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 11:46:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4dd729008d7so16755471cf.1
 for <freedreno@lists.freedesktop.org>; Wed, 08 Oct 2025 04:46:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759924017; x=1760528817;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zmZqI/hK2QIPAuDXDoC713x1X6hbDw/7hyjWJFFNTE0=;
 b=evMJb+DzW9vifWvqYQGTmmbZw1MLeToZQ/YTpDB6Zo2IfhKXM0ZRsZA+A454aAMcby
 uf0m5M7QPwObldasMr3HPoIchqLtBfPT8lI1zQyqAN4DLDanYJW3ywxx59J9hSeO3uCA
 aaUpDCb5b0D5R2ti5IcyID8iwZASS/ZkHZpTJxfJDlT6rm4i5hFUbIG9Icw6VlAXwjUY
 wbiKAFeIlGoVr4HPDX8dN7yxw/NI+S0YpgexaDKGxOEhCa5i5KSIhr+gtAtPQ6o77ZRK
 VDPRw7R0hxmt7D3j5+4qTrUJWVS2R7TA6MuJ5yidzlGLxcR0BsSPM8k4l4FMTEMPIE79
 9bHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhH9YSW6VngT1c6kuf3cXy0c2p26DL2CZbmYzfcL1TErz6IDgYhweu84B0qIfIgLmL8txR1afa3DE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDZ1t3vfUu3viGQOzoB+NGjl3lJjE59z5ZsEz9+5EAnloOjmYR
 nWR8KzN1B06y248lTNIMsXFKpjP+UapeFWrBV92q2QSuaeV2wUN6dexh4vBTmLs3kxVLEAP69hN
 wDmvyRljuWe+EbwZ3KQTapNTvD/upCk6gjajO2ERfPw0dhsYuJRx9U99lqT/pPf/qiFv6b/A=
X-Gm-Gg: ASbGncvUYg8UcqVzjNyjPedzqcyBT+KRpzy2ODi4MzKfqD6u6RsY0EGiPt3BSDtySUH
 iJOTFSrFbgKiJK7gjNy1sYdkCjhDMJjaxEjvQ5H4ZOXjtU0g4+qW06GWY4ywU4XAVtfFUO/EQtj
 Qvl/IOWoDkolhr/CU34DqdURt/wiMDnawUmncrJazZy40Khq8wrzvUkONodQ+fw+66pg9mgn4Tl
 7dwiLLqep4E50JYt8wTuNCOnEhQHWtsp1/q8mb3Q9cEYtJKymu30posXEPlL0CwkLvIqOxCqrRj
 hLUcUObTQCf/25GAn5jpE8rPMPkx7MxiZOijMfRbCKvH/g23lEF/45cxX1H8nTXXjGj5kkV5kyL
 /ybCIdqBwzxDaBv23pZqrzQ0d3fQ=
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4e6ead390dcmr28342131cf.12.1759924016859; 
 Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhzBijvONPiblMY5efLfCzWLUGbZqk/BjrQ0UR7ejEdPzLuUFe2mN6EtMi9WvZDTQu1j0KPg==
X-Received: by 2002:a05:622a:4c6:b0:4db:1bd:c21c with SMTP id
 d75a77b69052e-4e6ead390dcmr28341691cf.12.1759924016308; 
 Wed, 08 Oct 2025 04:46:56 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b4865a83f5fsm1649154166b.32.2025.10.08.04.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 04:46:55 -0700 (PDT)
Message-ID: <fd49f3db-560d-4633-ab59-fa80f9baf698@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 13:46:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/17] soc: qcom: ubwc: Add config for Kaanapali
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Jordan Crouse
 <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
 <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Hrl72kTS c=1 sm=1 tr=0 ts=68e64f32 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=WkYBtKvuumTgCfpkg3wA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: B6BC159ySF69bAECee35J016QAk4bwo1
X-Proofpoint-ORIG-GUID: B6BC159ySF69bAECee35J016QAk4bwo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwNCBTYWx0ZWRfX3eGjm8ZVv03N
 JZDM3rMGxZP41sjDgVXmEl7rcKTtw0cOLRgmuJX6B2L33Ab7wDpOeFTpb+76o+9fAB3ug9mA4u2
 C3tDd2qMzCTCPXPWPnrlcElBnXAl+mEp9zVtOfMGckoWlydl056tjr++8vLIRYndg82mk0eqMnk
 /MsdZUuQ/SNR6BNdAQrUswfmBD3FncdD4xjB5Y+GDc00bWqfcV/5r8AyJJ482ZCmBWFOaKX921r
 KCyBqVqn/HQDhI0T318LcBUZw5CgC8UUKL40HD2vLQqbx14Ve5+LGDsPnoGjMlIWQBrKnwwN3hI
 1bXK880hZ2F6ABoQ69n+e3sTgn0HFYSdDXy5Z8eQKl0d/ivfhW3ZeW+WC2lBTJZzh/Wm+auGXVE
 aSDHtY+vkRgTiJz5qbbo+SdSyylKHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040004
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

On 9/30/25 7:48 AM, Akhil P Oommen wrote:
> Add the ubwc configuration for Kaanapali chipset. This chipset brings
> support for UBWC v6 version. The rest of the configurations remains
> as usual.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
