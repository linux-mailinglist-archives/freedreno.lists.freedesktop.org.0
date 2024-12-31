Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A35B9FEEB8
	for <lists+freedreno@lfdr.de>; Tue, 31 Dec 2024 11:32:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BF5210E632;
	Tue, 31 Dec 2024 10:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eRV3D+PJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEAF10E15A
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 10:32:54 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BV9WghA031798
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 10:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 YSJC+oAIYFHch5VxryaXW7jbaxZD9NOaWfHg11T19a0=; b=eRV3D+PJpj8fjCSy
 4aNxjO6gdNimMFRQClI4GqQiDZDfLWbWRmh5OedZm1oLQq2O/n4iRq42KeKiwucL
 /j/igHgVdWOsb/VqNKSKmdHaWxip6OoXFhZDeLXb5n/MzCtYK9TXl+GVpqz+rC+e
 zKR4gD6LK833S65OyH6bqRI8xNiHzfLjoiUZAhCzy3+nfofk+5RkweAn/gbQwl6e
 vAmYnsEbkQA3enoc5ZGShgD/py/eto+2IQJMiEyMtzm65r6v77dNRD4D0gwIJvQn
 SUFoTaV8bBrGUY1Ce6WtkwyMXuxDIjy4cy/n8FLRrRy2fsVgBoLOp+qpGLIuA/FX
 ERzVXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ve2vr40b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 10:32:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b70df784cdso55112985a.2
 for <freedreno@lists.freedesktop.org>; Tue, 31 Dec 2024 02:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735641172; x=1736245972;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YSJC+oAIYFHch5VxryaXW7jbaxZD9NOaWfHg11T19a0=;
 b=oQq2MbWJ7QdpeUFyGPMUdxNFgZuq8U7hZ/4KdQBobQr0eT1xByb31ZrD77ArC9Aqt6
 X1r6c//DKBx5jH9IP5si8ss06OcJ2oN+VrIEQ+psOdtUa1ZGNKyfUWw3WYjludZ23z1S
 WXA8JHKfu20GFsKPKlw1XRkmtVIxhSujjh4jfyaubMiicW7liopl5tMBzmbMEvgX7dOZ
 E6fCpXp/WM06DNM0Z+qouk709KS/iGkFfk88j2tm0OOOCVl94zP5ZX9k/jQgbAve2JPR
 03+P3TYclahmk8kAv4ElBvQ6naPQzihFPzphK4PuAClzkz8NORLPacitasp04tusFr6z
 zuSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWmhmeKUJbgYLzILldd7+GkEEF7zlNY2H+xnwhK1PYwMDQPqoMbvHjXEtl9At3KLJprH9QSOT8b9dA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywO6H0ycHUIYpkdJ+Ze0EwALHD6FEHo20UZyJIdLxQeEtADddE
 7FeORuS9l2moWnfB7CVXqPQ87pmZgK977zHjv1OvkS75aZw1hmOo7r/LBz+HuGQgIDLwYYdQE2s
 XqZU8fthkq/e5umfqgeVveDAZ8PM5FtoAGMzTp67WuxCV+V9CFyoSq74x6Tofgre1sws=
X-Gm-Gg: ASbGnctY6Ge30igJQz9rzcPC19js53z/TtekjyowZiivTk1xVM3T+BLv78XEyQ63mjM
 STMc7WDA8ZLUKsaGjZfQRZA8yAWhvWiw6HPnkmmvqKwWp8xFVl5e+EXpH7lzGtjc2to/mGjtfwL
 i09csJ/WAaZbou+SaZvlOieyfGg8BMLnO5B6KEnSaorpl4GBIVr1Gv0xp2zyVJmxf3BFykwNPCq
 M3dhLTChFsemZZI9VpvDa7v+ucMUM7KyJew+ARv2MIlOoFOnjegoEiR5CEQD1oPlu/inEz3Dhau
 U5vjeEmJECIkub0pVWMmZTlvsXXyo6eQiLE=
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id
 d75a77b69052e-46a4a8cdd7bmr241338491cf.4.1735641172149; 
 Tue, 31 Dec 2024 02:32:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHev8rES9N0OrYAIAyswBL66viX51APNE3D7v2N9ryEeR9n7vvKglxjk0UBQxLmkedJMPFHTQ==
X-Received: by 2002:a05:622a:15d4:b0:467:6283:3c99 with SMTP id
 d75a77b69052e-46a4a8cdd7bmr241338221cf.4.1735641171775; 
 Tue, 31 Dec 2024 02:32:51 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0e830af1sm1560481466b.14.2024.12.31.02.32.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Dec 2024 02:32:50 -0800 (PST)
Message-ID: <3f33a94e-3fb2-4df2-91f5-59a92f5094f0@oss.qualcomm.com>
Date: Tue, 31 Dec 2024 11:32:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/msm/adreno: Add module param to disable ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <20241231-gpu-acd-v3-3-3ba73660e9ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231-gpu-acd-v3-3-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1zxqOyDr02KyvRR2zJV4FUmESIOn8qJM
X-Proofpoint-GUID: 1zxqOyDr02KyvRR2zJV4FUmESIOn8qJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=870
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412310088
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

On 30.12.2024 10:11 PM, Akhil P Oommen wrote:
> Add a module param to disable ACD which will help to quickly rule it
> out for any GPU issues.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

Is that something useful during internal development, or do we
see ACD causing issues in the wild?

If the latter, would that be caused by e.g. outdated firmware?

Konrad
