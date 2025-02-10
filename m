Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAC8A2F396
	for <lists+freedreno@lfdr.de>; Mon, 10 Feb 2025 17:32:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF26610E5B8;
	Mon, 10 Feb 2025 16:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cn0JoMwZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309F510E5B4
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:25 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9VoUL008261
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=; b=Cn0JoMwZEOyoPkef
 61kkoxfOO8ACryC6Dz0YVUUIuK/gbvwFhhTs6OuNOwazixlUJJCm+GW+Sgz4Bdev
 NI4OlSvfNmM0ilNyUagm/sBmSUnPrAb2ze7+t2hxVxFxsFLWp67rrppA5TtYa+aD
 5PwSa/SmbQLC67e45REnAoXtBBJnbXEXdLOMDqG2xYNI3I9pxn/ERV9iHyhF33yf
 qba+zQ/kZxr0L9AGSZw+SE8XImfJZ9wqxIHz0+dgB/B191xN9/fUGG/3dTC+9tVF
 zTjQcFrEL0y7wmafcq9tspH64NgPEzOok3vR9QuYI1kla+ullsQK0Hb1f3Ro0tYN
 uOaC9A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qewh14a7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 16:32:24 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4718adef552so2349671cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 10 Feb 2025 08:32:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739205143; x=1739809943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PllHdGFA8xSW0690rPMUrAEqzelfEIRuIJxgSYa+UlQ=;
 b=WisPGqszouzly5k0hTip9F9sWh9c9CVzodn2oPtLAv0zYhtGpUaHvf80PxpVeYv/5F
 FOKfc43XmW1Xy7h8hY2AnttqD03iQtvJoSwYMbTg9rquFsz+P35DmbU08dW/mtj9Qe3T
 F9Tqh1Ku2Gd7ngvWEdt2sJcmfHTUcBKL4+abBrGilpUyTsneq/mcHiUYkKxe3KeulEva
 ZMvsHbykbcmbQkfRw+xIifIWQhfbQTM0Ee9kP0/CqfuiPUb7bkQx2NDagAtOAP/cOT/n
 RVdOR6F7i6BJqo9KUwmt/fUczIORm1lJ9oAQ6w63ER5avgZrDC53/S8S74b7aMgv60pF
 xkaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV/dwQRJG+QjzBUJ8Gz1m5XKdfwniiVxhWeOB0Yi0UnvgVBZNlT0rzX9uUFJTDH+DcwQv9zspWsvo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5NgMT2QzStngKdiqko1jcBs6++304audvQNp68pJjJtzR4LvE
 zV/GIRBowABlJnvvxTkqyxz5vQ7oP8fkKxe8C5JSvvih7HOJRKWEui7Lng6Jyh9WmNeRTbvmkDJ
 TCVv4RAxwOUdKbMy5BpLxlxQRXccSj6Mn1CQPbsBPY5G9WnrUshRC5ZQ34H/j54ySils=
X-Gm-Gg: ASbGncvqwVHvsTtcXMCyy4OQlGkejEcI80EVti/AUQoTWcaK2bLN4rnpDeKNxkadP7T
 fPxDZwrv6vleI59nsxogwNsPUi/TTfXAcVWJ/68lvSyycOg0cRO+LUPNbfPKlEMnE4pTGUbo8OP
 rBxmx6qFX4DJhCpWm9vEcs8qgJAzUt093TqjzowimQamR16JKYu9+pUZ4CY+If4VghEgNx6euCV
 DB007vWzCVbbnV45G8eQhhHVE9c8zWtjJWKLCjTXURBMqFODta7IqoohoXagHUGhhS/GrWrWCaE
 YzBv4udKkeUzBirKg3jCEXQa/I1SmWI/kbeC2JIYJd1sy/KSHwhpzWkn3X4=
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id
 d75a77b69052e-4719a289dbfmr10935701cf.12.1739205143352; 
 Mon, 10 Feb 2025 08:32:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5IbZNKFe36TXsRdBve9RfSnI6zfiiQRD265XZv9cUtcHZVy3F19fELt4eG6KVJYmaMFNtpQ==
X-Received: by 2002:ac8:7fc3:0:b0:471:9a28:9cd9 with SMTP id
 d75a77b69052e-4719a289dbfmr10935441cf.12.1739205142905; 
 Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5dcf9f6fa21sm8114981a12.68.2025.02.10.08.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 10 Feb 2025 08:32:22 -0800 (PST)
Message-ID: <1ffe8c68-3668-413a-a289-51a0b6bbc8ca@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-4-54c96a9d2b7f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RQv1Q6vP17Ec0kOMZXV2KMajyXtPQDTE
X-Proofpoint-GUID: RQv1Q6vP17Ec0kOMZXV2KMajyXtPQDTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_09,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100136
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

On 10.02.2025 10:32 AM, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.
> 
> Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
