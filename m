Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018BFB0D596
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 11:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE4310E63E;
	Tue, 22 Jul 2025 09:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfCiDfZv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FA310E63A
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 09:16:13 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M3tNrC015772
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 09:16:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vj2qVmbFMaIyCB4fFcjZkvN3Nf3AmYPVWBGkIQJ88BQ=; b=hfCiDfZvIX5K1oa8
 ZKGwkG+iLpv25X/t+UGqea2KZQr1b1s+QNuuYavYNmOzcUWtA0ldyS+kVEo+JzVC
 uODsV03E18gS7vRZV2+Dl1QFWP8S8czhRHiyattAwdYqpDvFIgtIjdPaW2tSOso3
 ZVoDUNOTvWvRxIFC31Koif+uPiwSgBGVfa2b1aYY71OVnxEBa21lygIS2xH2n3R+
 xIrkwmTUh+Rneaae0QBuP49qwsEAKXUQ3QMCYBIzeD0SW5dlJ1dYVhl8xN7Jhl/j
 my6GdB3BuL5q/Xkjiw5bC9c4S01ykE6k2LPajI8P3xM/V/jCaQuYx5jIi91On/r5
 BWTC4g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480451gqak-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 09:16:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7e269587d8eso918878585a.3
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 02:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753175772; x=1753780572;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vj2qVmbFMaIyCB4fFcjZkvN3Nf3AmYPVWBGkIQJ88BQ=;
 b=e5lRko1mUyF1d80LSZGY1/ip/nrO+tXJxMcNcNEWMAkOtkGiUP5CHvyBz/lugRzEwk
 BBLlu0rC4LNx1l5JfdlgF5SnX19JiOYv2zu5+ZriAU79Dr2xUbTXixHaOKf3fNQ56kx+
 4SDY4EJvqLgD7aNwA02RkWtEzZFyICDxTYGhGagLd2hAKK3tcnpSGNIHatAYr4I/sNCG
 /QlI1leumOJQZY6BNC3mrfcQfqJFgaCv6P1nQMTb0PVGh3wioLS9eSQXkS4EXW8diRee
 aLzz68QJTEA6M1SwuuSCXQukv+yXLYHkSEch8FdE6tuS2ceqEEWmjIJj1MPuJ8CcfqhO
 jBVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFEMoug9RPZv2N879boNaQQA0sBezZ25nrmTB4Fk4NWZx1Wgw0KN8UEfeyU0QcxWxj6uVgFVH9+gY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzux6kon60Xw73B07V/Khy1etUXzcWBOASGjwoGBgrVwdV4qEWX
 Y2yNKFR9rhecKyC0nspD/ryzzCOFLOGIFxEtmvh3HVfputzRktCstnE7yBL+UtYwh0gANuOfMlo
 bq4ccS1JikZLHGiM0hu2CYol2V1iC82y4SzVP/QQAYeLbX6h3NyPqB7G7GTtjeHO7cp0ymfM=
X-Gm-Gg: ASbGncssBYW9LB3pVfCam+aSbFOs3eeHM5bViARMPN+SJBhNB3VC/XYbb1QtpwUxd38
 LtCtpvwEg13Ya90RYS6isz8pTanjiFfA2uuEaVsr5vD5LjR03twmntvXUhGA1LB4eOM1kbgUD7U
 rwVJtuaN21ZPlnU1VYRCWI7YkjvLzFUYNtfgreFv087I29Xo5tixnic2AKqPi7TiBi5AXE3Mp+2
 HNO05rHyk1i36e4CBTsyA3qo+2L8VzlvTUFmcO6PUZGnWtDBUVFVIjQHrGv5jNXI37ivPF+/aEZ
 rqTwUi6Lyu4l45TGVD350uWOjgWDkXFE0ueDawtb7IzZLZxdsIqS6zW//D1ivPwpY30NgpKhXSr
 v3gWrjgkNDO9kyxqcjnd3zZwSLMtCqiJwGIGgu7A6q5s=
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id
 af79cd13be357-7e34d8bfd12mr2927132185a.3.1753175771809; 
 Tue, 22 Jul 2025 02:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSkMXJjSdY+QbXyPowudZre6Wg+1jtRGLZBt4d77vKPTpJ93H01at3Dm6Ol/RmdyOnjJl5Ew==
X-Received: by 2002:a05:620a:6284:b0:7d4:4d55:98fb with SMTP id
 af79cd13be357-7e34d8bfd12mr2927127885a.3.1753175771347; 
 Tue, 22 Jul 2025 02:16:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0c3:3a00::55f?
 (2001-14ba-a0c3-3a00--55f.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::55f])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55a31d91034sm1867648e87.144.2025.07.22.02.16.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 02:16:10 -0700 (PDT)
Message-ID: <5ec480ac-ee60-473d-83e6-c2f25d3d30d8@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 12:16:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/13] dt-bindings: display/msm: Document DP on QCS615
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 konrad.dybcio@oss.qualcomm.com, fange.zhang@oss.qualcomm.com,
 quic_lliu6@quicinc.com, quic_yongmou@quicinc.com
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
 <20250722-add-displayport-support-for-qcs615-platform-v2-1-42b4037171f8@oss.qualcomm.com>
 <e15df8ba-f058-4eb2-919c-bc327290e66a@kernel.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <e15df8ba-f058-4eb2-919c-bc327290e66a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=EIMG00ZC c=1 sm=1 tr=0 ts=687f56dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=730OvTMgWo7gkawVqJEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: XgzxPw71i1W3XLud9z-4LkNURorz-sHc
X-Proofpoint-GUID: XgzxPw71i1W3XLud9z-4LkNURorz-sHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA3NiBTYWx0ZWRfX+EDDSKmRsNI2
 RxUdBrldfGSPJHEQLd2ngc1INUD0ST+1XGD++P/RslnvJJc7Ci5Nf6V0gLwYN1C93HhqYxIJiIY
 ymF1FFxTPJmdCPXYxMpPVuHg8rxWr2y+2qRvnMMF2gvVNOL4IjvkM5hDU3iDqnDPBeWUBc7+3LJ
 bbf9QmaJDvc+zJ2E2w+DJ/J9UcExaPz7EVZID2rDw+N8jp5VHTpcDMIpgFYVSIkEiGxQvFQ1qBu
 8TZHiokDzgYI5RiNXwFBgKW7CJKW66ka90ImSItYRNiYdGBu5o3SpNcyiAjsnd4rRAqtArniUuT
 fGmNus4nuBc1xbgEO+GGsmvm5mlrbQV4Wtq9vLInrINlR4hQKP+1iljBleqFXpQaShQAU3cBGdx
 y6dRNFZkeEUrQGVeS/BaPqUPH2TzW+XXCec0Z1MVYnJ8xaMcYaf4BcFc1eii3Nst4kmx6VOh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=997 phishscore=0 mlxscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507220076
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

On 22/07/2025 12:13, Krzysztof Kozlowski wrote:
> On 22/07/2025 09:22, Xiangxu Yin wrote:
>> The QCS615 platform is based on the SM6150 SoC. Since the DP hardware is
>> shared with SM6150, the compatible string qcom,sm6150-dp is used to
>> represent the DP controller on QCS615.
> 
> 
> No, you cannot use other SoC compatible for different one. Look at
> qcs615.dtsi and board DTS - there is nothing saying that this is the
> same die.

Please take another look, we even have renamed qcs615.dtsi to sm6150.dtsi

-- 
With best wishes
Dmitry
