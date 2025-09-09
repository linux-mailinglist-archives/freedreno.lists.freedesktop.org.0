Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F112B4A6E6
	for <lists+freedreno@lfdr.de>; Tue,  9 Sep 2025 11:12:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18EA410E674;
	Tue,  9 Sep 2025 09:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j91VP4Gv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AD310E674
 for <freedreno@lists.freedesktop.org>; Tue,  9 Sep 2025 09:12:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5896SeDN007486
 for <freedreno@lists.freedesktop.org>; Tue, 9 Sep 2025 09:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7/LZ7jld6Mn4TzxL+e3wR4fKEsF+dhJ3GAlByrhuIjw=; b=j91VP4GvonjXVqJG
 g7UJdf4R4krV5SI1hisRHQTgpAYDp99pUNmaH0VbNzRwikm4gD+lpc/O97k/rzaZ
 ldmX0ZDowjWc8kfCWE2m6WJoUqn7gM8RWHgHbMlXcJ+ZoyJYcNUozb/gAWa3ys6E
 xQJA91IUsus+fR4iYRPl7qWpOpSfp6ut6oIJbGYYeopXtVI6IQjHVme9nJRTOck3
 Bc7TSKCQavDYO8j1+qu+zLdk0sHDEDq9C90RRR1XuXUW+yj2pZTx5rQypvKhiEPc
 fMH03JwEx6Q8l5+DjRi9+rhY6OUHB7Rl4JQZwS34qhVLbA8/NARnpTmQI/Golbfx
 TJDfeQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0qmu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 09:12:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4b6023952f6so11622011cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 09 Sep 2025 02:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757409131; x=1758013931;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7/LZ7jld6Mn4TzxL+e3wR4fKEsF+dhJ3GAlByrhuIjw=;
 b=DPV83mHbzBSMfoPmcylgOWLXf3gfJVq0Ib9xVP2MuH73YnTgbfZ7JSuG+3i7idc5on
 718zRzAif6jdvyjTI+w+vWq2aWA+Heh38piMtHYWGkgzBS/wDv46LRP4K687dyl+QNSt
 nH8DvyolaJGWAAxbAK8IQyRvNj89FnnSeJQv1pOEjVqHtcANVqvuDrThkKqdWYUYFvyb
 o/bw5sQUe6zU94f73uT5fth/tMN29Jmvg7waAuu5EUGjNJNE6KCZmhVDKCEZ1tjgjuO0
 oqWyFDqMeRRTfxe2lk9wH1xGcHLOKFGLgSyl5rqrw1jBvpKlFYEJAJJB0kVagrvG+eLh
 qZtA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtCcEfrw/SM6cqDXJk8+JxioaFuTHF18FGOPBgXP7yTswx5OKFtRDFU+syFP6T984Kixv6YvzPMHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQCgWSOMXg6eZwD8FJqg1q104AUtVejaMbQXUBASGSLp5FkyJE
 H3CFPD8dhrdJceXPkbHqye22Mc8VzyT04tAnL8oJO5b0bscfIaCb0JVnFdUIlRRBUHLJmIkSkST
 ZDcJqNHLR/gZ1QffKKrGUWx1gtq4I2s3/iIrKSrZJsWVcpFj+FEv2lCyN6OgolX+kDSCTf2A=
X-Gm-Gg: ASbGncszzbx7v+oLqsrtgsVlk6+rem1uAD1TpZ9AtUcIclA5j4E1VltwoDpoKV5Qwku
 ZlLamucouHtRdg7qQCIaXsdTuF0wga7eKvmxXIkqNhOUWlBRVQ2DMbs9Yq2O31CtNVs1ORdogLL
 izy7cHdX61T4GCi0kG4Se5PHgj+2PKLrTrVuKtwGNNoWj+ylvOKGpr6Bas05kNzIvMDWFiugJrM
 CP8EAkW5OxB6PCPlW2QAAJWuNXYA5E2fa17C/rv4nA/9Rm2015BpkoO7N07b8VfHvspJ29e/cBG
 4SRz3C0VoxQWOGXx/Ic2p696jBivzPxajqkH/CbIasSiPFIi5goD/dg/Qt0nfFvxS1Xz26BCUaL
 pzKRk5DcIdVEfmPI6EQLu7g==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b5f847af12mr81429411cf.6.1757409131407; 
 Tue, 09 Sep 2025 02:12:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT8WcnSygf6bNTgYYy0/PkzY2w1a4gXks9/FKqoCWfWHg07YtEpBTM6SSkzd5fxyaeTOsD6w==
X-Received: by 2002:a05:622a:199a:b0:4ab:6d02:c061 with SMTP id
 d75a77b69052e-4b5f847af12mr81429211cf.6.1757409130769; 
 Tue, 09 Sep 2025 02:12:10 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b047373afcesm1359797266b.57.2025.09.09.02.12.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Sep 2025 02:12:10 -0700 (PDT)
Message-ID: <25df0f78-68a0-4459-a5a1-eb035b0a5395@oss.qualcomm.com>
Date: Tue, 9 Sep 2025 11:12:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
 <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-3-761fa0a876bf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: h6SkPZ0LHpMl47g90YeZM3a1U8rthfgJ
X-Proofpoint-GUID: h6SkPZ0LHpMl47g90YeZM3a1U8rthfgJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfXxEFrSKqSH9vX
 BHQfAtElsSP7vwzMhStmd5Nxub5mRsYq8wbO3tSPcloS8rY0QMai/uOvn+yyYLjyMGvuTneQs95
 E2ikOXIWdFWm2nlHLA7DvCuHHctjOfb5tnpmZV5Qgxa+7YVZHKFHjCFCtzpKV1SUHDsvNxE5O19
 5MluNv8ScKNPuxM8SvkWk+IL+6NEZSxsRLRbAWYV+6hU/5G4efDsf3ww5tL8LTQR5aIN0ThXrsd
 XPjlwKYJdwyOEXj2t2yd44NJ+f5QXyFk8ObfJ3bxcDlzvuA5pfZlHyZFVDfAld5rtqvThhGdxrh
 y987ttYQ/QUkWOwpIrVQSBZ5sET30dd5SkWw+FC+rDoQwNUHbAx1Mf9yaABjHGLhnyTGky8lN5z
 L2CTslak
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68bfef6c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=bBjZtXtOduL1R7AEkPMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
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

On 9/8/25 9:39 PM, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. Also, add the speedbin
> qfprom node and wire it up with GPU node.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

None of my comments on v4 were addressed (we agreed to drop the
GMU MMIO range one but others still stand)

https://lore.kernel.org/all/f11b778d-eba1-4712-81c7-b83f2cb38b46@oss.qualcomm.com/

Konrad
