Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24190A0095A
	for <lists+freedreno@lfdr.de>; Fri,  3 Jan 2025 13:39:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA2310E434;
	Fri,  3 Jan 2025 12:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cJ6t4GHI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88BEB10E434
 for <freedreno@lists.freedesktop.org>; Fri,  3 Jan 2025 12:39:43 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5033qSVb015576
 for <freedreno@lists.freedesktop.org>; Fri, 3 Jan 2025 12:39:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lZwRh4PseLrHdLpqPBaflijRPt0Pr7IOxsOt0iWXhpA=; b=cJ6t4GHI6o5SsFAB
 OBjd647yfxLWmY4GJSY2O2f8qhUwSfZbY3ruB4AVdGlNPvsoBhppAywvPQpDZaSI
 CqSpjYTJScad1Sp7Mz5iXOfFgvgRPj4sEm0xfwu0wsXshr9xkLSgg64Zw1KK64Lj
 11ALx/y/01RtDaO7cDYBr9+Iz9SGdjcryeLbbc6zrgatqQuQsuacbT2MN3Aextji
 W4YRs1WWNYaZkA0QEvkAL3rRLiLCgE1N6sYY6q/uJh6LudBuRSsWqZCujNggP7NB
 VFzRNcOfBSj3c7quArXxaKT0Bp5zX5ISVCyxtobAyZWqkz2IpftwlxnttwteFRjr
 CJlqUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43x8c0h2bh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jan 2025 12:39:41 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7b700506e64so27631985a.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 Jan 2025 04:39:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735907980; x=1736512780;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lZwRh4PseLrHdLpqPBaflijRPt0Pr7IOxsOt0iWXhpA=;
 b=oiUO14qUMvSWuyKpTNtwAJAhLbKG28kmO+ok6aEr1xF+YSj3NRIXbre6nEhhvkr9GM
 mO+dgwUf/85QjhrW6mZdGQZqgy9hi7cmdhX6RyKJVxdQq2yMd5Hl56v3YNW2HEBrM88Q
 4XbIPOF/VHtwuDTdrUqRPk4DT9cSgS0Y5dEBYvkatQOmlSdlITeeGtA5/I3Mkqvf2QdQ
 U1uuKSqeoiFppawLQpeIqjNAgZ3qLyZa8rPQUck+FQ5FjvdugOp71nNyg2rA3aIHElHn
 c52Z3splK+sEJyAOVtQHJQ6EbBUQ/MVN9h3cCoiBSNQTHk7BbqV0p1EAG4QoOOZw+n1a
 48fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEPdlhZnovklvLkdZHU2i5hCMwnZhHyU4m9vkc8ecbz363lsl3X94hnHE/UnpLSi/LLp7JSW9IUog=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHfUlLYtQU/Lr9BhX7I2tABwY99Rh+owrfFfCHJwjIQrsyTV+J
 1krDKQwntSk0ETjW3EWkg+StR3aEq4NsRzZUwPJgpIYC1HitCia3Y8LYsYGQ7FmJ8idx3uPnIJV
 J0Vo3/7cJ6aIzvYU78RLf1udSrW5Cev/2hqMwn1xAPhQuwCFIQqIpdhsYK4aF+9OSVHY=
X-Gm-Gg: ASbGnculMq50pr6jhkQOtZ11yz7NpDRyFzVp/aHhUFpOoQYbqrCWkjlaHcKbqRbd8vr
 rIw1G5/DKmC7zQaCtXIbcxh7FszUTZBr7bk94srrPCpJjYKD2tBLQdqOy37i+bNXjIAfQNEAw0d
 1pCYzcNRSG55n9UXTAVqvtKXfrcC9h+pQBH5sOeuQ4Lfg5zaOY8SXfGds1+LcXGJKfgVJcGbnGs
 6ryPsQuz9s1NE2z//2o9PdSLoLGgFK8bs9IORJchO6iQDz2FgmiVA92/S/VsVtGJpErMGHhpWtc
 V7JL3kwPyDMQGxSqrztDkQo5MQ9eeZhLEx8=
X-Received: by 2002:ac8:7fc1:0:b0:462:b46b:8bf8 with SMTP id
 d75a77b69052e-46a4a9b7558mr309385411cf.14.1735907979737; 
 Fri, 03 Jan 2025 04:39:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9T35sLA9E07WaPbgvB2yIVdP5SW11rIxHrqYYRBRo/hP/Iuy8WbY9t+3R/LoFsXxymado1w==
X-Received: by 2002:ac8:7fc1:0:b0:462:b46b:8bf8 with SMTP id
 d75a77b69052e-46a4a9b7558mr309385091cf.14.1735907979439; 
 Fri, 03 Jan 2025 04:39:39 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aac0efe41a6sm1914071966b.102.2025.01.03.04.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jan 2025 04:39:39 -0800 (PST)
Message-ID: <da74c183-9f4a-4b11-b747-35fc21252a4d@oss.qualcomm.com>
Date: Fri, 3 Jan 2025 13:39:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] drm/msm: a6x: Rework qmp_get() error handling
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
 <20241231-gpu-acd-v3-2-3ba73660e9ca@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241231-gpu-acd-v3-2-3ba73660e9ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: E73_MxP1u5j83jJCvgD-pHK42LE2na0x
X-Proofpoint-ORIG-GUID: E73_MxP1u5j83jJCvgD-pHK42LE2na0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 adultscore=0 mlxlogscore=845 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501030111
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
> Fix the following for qmp_get() errors:
> 
> 1. Correctly handle probe defer for A6x GPUs
> 2. Ignore other errors because those are okay when GPU ACD is
> not required. They are checked again during gpu acd probe.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

I think this looks right

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
