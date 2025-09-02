Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D99B40095
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 14:30:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF76F10E6A4;
	Tue,  2 Sep 2025 12:30:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="X2pz/o2K";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62A5710E6A4
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 12:30:54 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AoSWT013626
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 12:30:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 BNWoXsVDFnok4UFE+T0JM3TKXHmHj1QrThTVFrNIAkA=; b=X2pz/o2KGIh9+Ffk
 JkvjpBU4/98fgg347M2ChiWgeISMl1m7Z6VQoXYRnp2Ktj3oG8Ci/KOXqrs7bXqp
 kOkwdFX90MjzqHGFGfn7M+Nn00zesmVj1qNejtLuZFoadckRsurdpS4xTcEbadsJ
 JSkokdDfOhK6CRYNVRo4Khygg8EuZ1eztFrGLGthoipZPEAhvyN2awLdSoqD668b
 hiCV06UNzrzajK6Quj2iMaV+c5n0dkdJgm118ZHQsrGQpr1VaMB+F4tyippbwuCG
 thHJcTcB/vS8rMzMZWerk2aWCXgbfEyoILbK6mPqsIw9i1vlbxQ4pIXNFA+eqZKJ
 vI4EnQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uq0efw8v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 12:30:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b3d3fc4657so95741cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 05:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816252; x=1757421052;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BNWoXsVDFnok4UFE+T0JM3TKXHmHj1QrThTVFrNIAkA=;
 b=DC7R/5J93m8TVkAqIl5cxmI2LzcYhhZK3T0sN01Y5b3pLxdNljttKl3Bpb3xbADvgq
 p6NQG4obS9lPasr0uWifsTsoLUkCA3kOv76bp4i2lMm3IjdJ3XFFxMmppsk/M6/TE1H2
 VnDDH0S10YjksCYmXGhsgRiYN07XrMdE77RY8QGr9rxn9mOgrYhDlfQ5F+pqXq486PMN
 dKqugZswGe6TwMNUWqfNz6qmK1wAvP4LHeF7J+Ql+u2YoPnEE8TjsG0a1BIOABMto1z5
 g6NFIuMSkN9xPeua4D09z3l0Z8u/8EdL9lkNBppPC1M48AWXh7j3f+RAuffoUq7uezb6
 ppIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgbHOTzk/mTF1Ud5fy+XYNT7AWZ+MWG+L1wpem6c8cz9AGvCz6pWTQsGfBhrph6mmEH+TKc3Yyjsw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YweYH2WOSIdoknzFlzeg6FgtRoUcIMB7bCoyvzL05TrtN6qNGYX
 F+PQbqC8EkQIUPQzxeCph83b3Tj8DOKAMLQmZH0+RTghU51WkPlIJRc2V7eFRT+L2qENn7YV/LO
 Qlwm13isMRXv/Vp6ZO6Ept0FMJbeJP04oSotia1kbZGOgDgxIwn72pWd4ST19xYeReW4SEec=
X-Gm-Gg: ASbGncvVFHtvklqRQdbyZUtJ3JOy3CBCJgv9uyfich5lCLf+138rMHS+hTrE5XmfjNg
 VAz8Ax7ni7sS9h+JY+3KI68cWjHPc+gJQ6DuKY7ttWArjz8r5r79vxu+3VTRCNr5hmqqfnIH/6r
 N29X2BUL8GC0ZWIpNG8GRI7n6vS7nhD7X0cECEM1E5XjIwmdtdf32diU5FyOezihf14Pe3e+CcG
 lXtV5mYM5vQZlfwf8CbS1eTSdr4Qps+iJZgiEzlm3bITwyL0Ni0gO9Nj4KrBnlnjxOkW4OwrYLA
 DKYBKGBAeLr02uRHhwnJs09sJnR2XYtunBa6crWk9vHvZ8y/AbsMrFSn/EsLABtQ1hPs57R8CTj
 cBiJ25cfOZXcoJAQLr/K9Rw==
X-Received: by 2002:a05:622a:54b:b0:4b3:45a:2b3d with SMTP id
 d75a77b69052e-4b30e9a845dmr104245371cf.12.1756816252056; 
 Tue, 02 Sep 2025 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlVMbYgx8dc1lkUCensrY9s8XZ1S7XpWw87suZcVbaJfnjs0OW6CdvMWyEtq87QwjeBLmlGg==
X-Received: by 2002:a05:622a:54b:b0:4b3:45a:2b3d with SMTP id
 d75a77b69052e-4b30e9a845dmr104244851cf.12.1756816251241; 
 Tue, 02 Sep 2025 05:30:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b0424cc1698sm544146166b.21.2025.09.02.05.30.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:30:50 -0700 (PDT)
Message-ID: <a701e4f9-57b7-46cc-b42f-f1a4a902fbbb@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/msm/adreno: Add a modparam to skip GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-3-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fHpAXZ_L5TpzzA_iW24JW-wt5rtYnaN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwNCBTYWx0ZWRfX+8X3fdNkedwW
 bftLHtzm0aQJIFOgSlSTROFcXIhjFa5k4o1Y3fYrKWfvm+7YCd3/ayeV/N6KPz+qHQbLCyt/oXz
 k252TSg1gUswFq6/24csnDwUnh2tXN4hN58snXxh9r5gMM2HwSf6VSWW/iI2/gLYrwK4NJcooNx
 rr/EY5/2tAQiXvDz3pw6GXaUms7a8bHoWT9kPR+UKZfOzh3BokIRYs2qeCkPhTtzL3/z40FTiHJ
 2et+6HocOpoal9HTpj/aVmngNYBtsBNLH1pcxwbKDespPd+bTFI1KujKUjz4rJBdtlT900l5k1S
 X7EHGmGKAr1vzkH0agl+SIFqHh2JkrERFffX4NccNSHPfdLS11hsgOX1ixJhyA8lyp6PdWQjeZF
 JHspZInj
X-Proofpoint-ORIG-GUID: fHpAXZ_L5TpzzA_iW24JW-wt5rtYnaN8
X-Authority-Analysis: v=2.4 cv=ea09f6EH c=1 sm=1 tr=0 ts=68b6e37d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=kokVE_FroeQZl1yzAO8A:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300004
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

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> During bringup of a new GPU support, it is convenient to have knob to
> quickly disable GPU, but keep the display support. This helps to
> fallback to 'kms_swrast' in case of bootup issues due to GPU. Add a
> modparam to support this.

I'm not entirely opposed, but slapping a // in front of the compatible
in the dt works just as well

Konrad
