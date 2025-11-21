Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B8AC7BE5C
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 23:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A8A10E912;
	Fri, 21 Nov 2025 22:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nlesCqKo";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VCcaSEuk";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4B610E912
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:23 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALIGOlx4023972
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=6h4F3URArhkXYaOyRfPjchow
 oGF/yMvFUeAB/KcBtkI=; b=nlesCqKo5WFSoo2G5ByLOA1Yg8PX70G1iXta/sYS
 9rgN6j+HLEa8EzDuaq3j+scWb32VStQUB5koiZrCOY4qYU52OE8ek+aq7i4Emd09
 gsZvqtRRRUH/nS2A+SZfMZSeMMGP8hn4olwGMC45+4QEgpOijL/qx+k2WliwPT/E
 xups0qP2enlCdNhJw3Tx79nmKJABOILnXMBRxaZnR6kI2E0+2gyVHj0zw/Q6b3av
 q6YvbtoRiKHbyK1piacXVei9XCLR2vEMq2FAhNDLxSvtWgrglLcoP0xYFkK6Uy+k
 /UnTX2k0nlz4MdLpD4N/pGFujsz/97OI/YmuwdEeFmWJEA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajw7a0mc1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 22:44:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8b2ef6c8340so686139585a.0
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 14:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763765062; x=1764369862;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6h4F3URArhkXYaOyRfPjchowoGF/yMvFUeAB/KcBtkI=;
 b=VCcaSEukmfyXKlcPR7PFtOmFue4O9sCzlAkjEfdP9rLq6bC4Vt6n+JtBWsnGdR/EzU
 xBCvjpOe73FnQc917uk2u81IXu9gEbsKAN/NWWoFcXVMG1Kn7xLZewR43wDSeb2gXyVT
 vClwaOR+t6j/q5r0pDmZkzv/dTM1BV6SPJ9m/dE5la44Q2Me0/wZOIDSQv9+JODNL60p
 jX3IC1JjxW2x0v21EvR1c/DD+iw95qU83G12npOd9YiyCUYz/+RN6Wpg/6tR2UYmKb8q
 xYK6pZQmXpPdyvU5pq4P3jcpE6rYx4Acd6rW4Bo4YihGKWPxVwKgpid9p25YvUtfGrl8
 0Ixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763765062; x=1764369862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6h4F3URArhkXYaOyRfPjchowoGF/yMvFUeAB/KcBtkI=;
 b=EYFzYfj9FoYlHN/ihD4h7PDupFn7AkwlzhkYs5vsi4CrI5saSXs1jwkBurD4YqSEEy
 ksjNnmE9RI80koZ0pGgJMVCf3mWiyboJWDWGIluAkf2emS6MVfnuGsuVEFcWNfiq/zec
 AR4vCVDApOI99mAbS3E0kqWjtU8n6CC2/VUcQuJSC90M+dqeb17XMni1kWt4OInQHJcY
 mDqaYiP1OT7TUW53vhWnOKcpFU6ELsrmgb9oqi6iewxP36bZZAS08hTzldEMnyPc8OJH
 BdaRUzNiT43Z6Eqai3WhHM4nfTCWG7eDxD8VwgJmpHzIHHbLEX0khTJ/l1YJ63zOgAu2
 u/5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL8oJahPEZ868KpmoVZAGbhC1Ciiu7ogAdiiT2uHCzTOKSEi4lMxsotXqT9b+RXwwsiHVZ6gbWQyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJXngLskxsdxEvyWzwHo0yRyN3amYl0tyWTWZg31Vma01gXGZT
 vc3wFV/VVfiN5toEw947tI6t7pnQ7IfmYwarxokdEB4Ikl7TIrI0G9fI8hC8L6XF6UJplz6HzS7
 INRMaMOyVSy7dxqbZmta9VExEtTXD5UTkEfSihTwmJSTsu3mJijgTLQHg7daThvIWFywwl5g=
X-Gm-Gg: ASbGncv8dcIPF9Pbggj5I/WLOVuLjM2d+RZpZbxVk2De2hCPBIqHdAu05a+9v+asNKA
 VSX2vxT0A/AP7pqSGBmwDZvn/ZajHaFEdjvBWZU7Jo6RxkjKiX4zkeduflImkRweD4xG+7cXSl2
 bt3S4LZtEHmdYYRLs3gkF9FVUJTmwvSaIY2aGGuazut37ZCYR0nLxryQaXN72O899YXmCzwAREa
 8Jw0r1n98DS6A5IDJHIRJNv8IHboUWGOlKxq8aazERoi/u/j4TN5DbbQDpsespbSaLeGt0wcToy
 yz9g+qLPQvY/biNV2cuXpkdH4SB+mnH3WfZz7a3i3w+sgLpG4I4PSt373ERMpYdE8Q+jncoVdmJ
 +0JsNccFm/sdw2z5evKhYehglkA9d829R9t16QYrSL/hWWNyNzwsDX27/MRf2mGO76qcPukx0RH
 dVrU6ljsUAJKbOflUl8mh3fXI=
X-Received: by 2002:a05:620a:199b:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8b32ab88f25mr1002674085a.5.1763765061653; 
 Fri, 21 Nov 2025 14:44:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEI3I8lG5zOPGUxBnJD7antL9Am+iuZ9URcxIpbTDxXkvCQsuPHwSAvhtJp00c2A1SPWXrsYQ==
X-Received: by 2002:a05:620a:199b:b0:89d:b1e7:29e5 with SMTP id
 af79cd13be357-8b32ab88f25mr1002670885a.5.1763765061187; 
 Fri, 21 Nov 2025 14:44:21 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969dbc5b2bsm1959572e87.67.2025.11.21.14.44.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 14:44:19 -0800 (PST)
Date: Sat, 22 Nov 2025 00:44:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <quic_jiezh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3 6/6] arm64: dts: qcom: qcs615-ride: Enable Adreno 612
 GPU
Message-ID: <afqmoz2fml2kv2z3hhrltxvbpefrcla5aqymesf5u3nkkhexxt@h6uw4wj7dq6r>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
 <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122-qcs615-spin-2-v3-6-9f4d4c87f51d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE3NCBTYWx0ZWRfX9FDKpM9n40Ez
 mo6TfeIGy1fQQK4s7Ztyb5N5k5NvpWdxrs8oVmedrNXhNdi0Ei881ZIjE3hbPzDcBpxPM7w6xqa
 vwv8xC8M/va7EI5R0oDKCHq1Ofv8kuEhUGHInd8K+FCgNcJMWPWyS9J6qzMT2RAMpkIdv7wcsk2
 suSciV00+uB84fG2PrZvCplgq5MEx1d+F0RcDSZ2QwkAEEfuHY7o+QNAGuqn8R8WYUmT8MFBNlq
 OhB4xKXCEA0BTCMLEoFwgbGJOA+GHG16LaAgNGFvD2K49FY5uLjFuTqlwtpRECiq7FaUGH6qnZo
 jjkMYNCXfC0zBhUi3xc4/XqcVofYdnV3NF/mU6YzBs0yZswhHelRBwFyZBuE2x63l+TmgJnSFBF
 HFIxle7LnGbcJl944i36QhgtS4DjYQ==
X-Authority-Analysis: v=2.4 cv=QOhlhwLL c=1 sm=1 tr=0 ts=6920eb46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YsWbbbpubv--tx4qmFYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: B1wsjEwjDvoP2QhRr9vVJPxJzYMpUbJx
X-Proofpoint-ORIG-GUID: B1wsjEwjDvoP2QhRr9vVJPxJzYMpUbJx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_07,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210174
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

On Sat, Nov 22, 2025 at 03:22:20AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <quic_jiezh@quicinc.com>
> 
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
