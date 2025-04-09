Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D89A82973
	for <lists+freedreno@lfdr.de>; Wed,  9 Apr 2025 17:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C9710E924;
	Wed,  9 Apr 2025 15:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EfpnjdFK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12F410E91E
 for <freedreno@lists.freedesktop.org>; Wed,  9 Apr 2025 15:09:02 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5398MJBB002911
 for <freedreno@lists.freedesktop.org>; Wed, 9 Apr 2025 15:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ZM49O2ioHcxPJFgz0BW7OWFv9D0F8HSwleBnH7gV14s=; b=EfpnjdFKzGCqHJEN
 Ma/mOBmSYSbE/oWDxhUGfjgKLsaLrT7haeMHc6DuaLFAaUTf1Rgmfr4kGnwJMNZp
 iIQxKlLT0tzeg8Qton673zuoj8X8AsnHcbwsDyXDdQG68/zAkephLqY/V1Yur2g+
 y1TBsGfnEznmvp/YydzaD0uxRqkpIiG7OG+qX/SPY3rXuoWCFbzky0bfRQBW8pfJ
 AJH327Xmon8PrmBGBoK0rLCOKaa9NDumDOv2TLVL8ipaiJQsWiWfx34CwiAvAgE2
 BPCcRA2Cbq9Bc/G7a4L00twnwaVQ93L2sLu4SQ2I0XSxMO67tiUMtBMC6PyuSJET
 0MTMeg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twc1knw2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 15:09:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c76062c513so170821885a.3
 for <freedreno@lists.freedesktop.org>; Wed, 09 Apr 2025 08:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744211341; x=1744816141;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZM49O2ioHcxPJFgz0BW7OWFv9D0F8HSwleBnH7gV14s=;
 b=JpzH8CAjyPFYE9GluvHoOTfRjLYVLIUMtQ0UIqgrT7XhMZ9TNQ72wjEbIATK0rklk3
 UmNmiO3t7eSYcrfGLfyrs5Ab1EwfsracaPGWoQW1rj0CdGz6rMjD1a5vOUlzOBMp1utm
 Mzrk8oBocOq12+f4aYligsJm+WyHRKg2WV1tUh/5jjGROpIVLO/AbDjoE/khNfckaAYS
 3/Xvr7odjoQThnPwjfNdb/CVQ7ldLsNX0yJ2RxC4Mw8dny2gPeXpYYWtSnPZi/J2/WMb
 NjHisVRnXkacvk+Hio2bejMtdUw2fkE5W88UGRxVhE4EQskxQfrNArvXnabc3kL+JkxB
 S2HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkZyuaPJ/qYbpEciwkXw8jZINH0CqkSn3kts2Ls/aVPv99MWSwPeMS+81qUDTo2rfLCRjNrYMctFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ62jov6RLGSEEbvteAu3xQd2p09QpRJnDsvPaOfYX85oUfqrv
 5D1Mttlx0Zrn9r/Ody1IQuY1U+0n5MsqgL5E0JRrmOy7Jyst1ExIhbCZJeBeY0bdcclNs1nxyLQ
 8pPazfHcm9GZCdcCX/+Yc2grVCeIkWkQ4iMrj2F9qNyr16gToUSpDHOIRRIJl9lsmRJ0=
X-Gm-Gg: ASbGncvHe2aEvMc+KL+egYHKm6+0Lr25kzLxcwIgZwmfJSeNRAkmJTY5HJVLoqcI/bS
 551tEq1wgiS1kcJu+cXn0b46McHfrY8+/jd75VtVJMObqMDo0CU9oilzhODzHuPfYf3lofBHxL0
 40dD/Px79anycUvTPvtYj6ZUtXWeK0CENuF3Th+KUCdVK42g8WBPFkeY3Fi0Tgzh6ixl81382rd
 td0j5ReFYAivXndJCaZAAZDYU2mf+6nxUz88GGQMnTTX24oMHZvQW1vNrpumDPlSQsuqftFrU+G
 VxmL+WJBoP8aWMUmMtFyrPtuzIFUwnVs+kgnoYtOm12Inf8B6TblwDf0VlI3GjubMw==
X-Received: by 2002:a05:620a:2805:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c79cbd8ad2mr156918385a.4.1744211340654; 
 Wed, 09 Apr 2025 08:09:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKqxp7rcrINyn8M6wMLr3P4dzZIUo2PduztsqFYTGLMrH5xZk1qXZ1BhuOXgUr9MLv4mhnXA==
X-Received: by 2002:a05:620a:2805:b0:7c0:bb63:536c with SMTP id
 af79cd13be357-7c79cbd8ad2mr156916885a.4.1744211340304; 
 Wed, 09 Apr 2025 08:09:00 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-acaa1cb425csm110988066b.104.2025.04.09.08.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Apr 2025 08:08:59 -0700 (PDT)
Message-ID: <0d1aaba8-7736-497e-8424-84489c637914@oss.qualcomm.com>
Date: Wed, 9 Apr 2025 17:08:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
To: Anthony Ruhier <aruhier@mailbox.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Maya Matuszczyk <maccraft123mc@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
 <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <dj256lrkc4s5ylqkqdrak6a6p3v62ckkd3orsg7ykz2w6ugllg@rbfkojacklvx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jTP_uXvnx14xtz5n-pyhOLPuKTqwtf69
X-Authority-Analysis: v=2.4 cv=KtdN2XWN c=1 sm=1 tr=0 ts=67f68d8d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=vjlbkFh1sCUApBijkyAA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jTP_uXvnx14xtz5n-pyhOLPuKTqwtf69
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_05,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=906 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504090095
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

On 3/18/25 2:12 PM, Anthony Ruhier wrote:
> Using this patch serie on 6.14-rc (tested over multiple RCs, up to rc7) on a
> Yoga Slim 7x (x1e80100), I often get a video output freeze a few seconds after
> my wayland compositor loads. I can still ssh into the laptop. I get these
> kernel errors in loop:
> 
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1: hangcheck detected gpu lockup rb 0!
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     completed fence: 777
> 	msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 67.5.12.1:     submitted fence: 778
> 
> Rob Clark recommended to me to remove the higher GPU frequencies added by this
> patch (1.25Ghz and 1.175 Ghz). The lockups happen then less often, but are
> still present. It is easily reproducible.
> 
> A way to mitigate the problem is by constantly moving my cursor during a few
> seconds after my wayland session starts, then no freeze happens. Reverting this
> patch serie fixes the problem.

What firmware files are you using? ZAP surely comes from the Windows
package, but what about GMU and SQE? Linux-firmware?

Specifically, please provide the GMU version which is printed to dmesg
on first GPU open

Konrad
